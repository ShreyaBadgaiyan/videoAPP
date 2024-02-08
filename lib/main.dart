import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videoapp/screens/video_list.dart';
import 'firebase_options.dart';
import 'utils.dart';
import 'resources/save_video.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Video Upload'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 String? _videoURL;
 VideoPlayerController? _controller;
 String? _downloadURL;
  @override

  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Upload'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoList()));
              },
              icon: const Icon(Icons.history),)
        ],

      ),
      body: Center(
        child: _videoURL !=null
        ? _videoPreviewWidget()
          : Text('No Video Selected'),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickVideo,
        child: const Icon(Icons.video_library),
      ),
    );
  }

  void _pickVideo() async{
_videoURL= await pickVideo();
_initializeVideoPlayer();
  }

  void _initializeVideoPlayer(){
        _controller=VideoPlayerController.file(
          File(_videoURL!)
        )
        ..initialize().then((_){
          setState(() {
            _controller!.play();
          });
        });
  }

  Widget _videoPreviewWidget(){
    if(_controller!=null){
      return SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
            ),
            
            ElevatedButton(onPressed: _uploadVideo, child: const Text('Upload Video')),
          ],
        ),
      );
    }
    else{
      return CircularProgressIndicator();
    }
  }

  void _uploadVideo() async{
_downloadURL=await StoreData().uploadVideo(_videoURL!);
await StoreData().saveVideoData(_downloadURL!);
setState(() {
  _videoURL=null;
});
  }
}
