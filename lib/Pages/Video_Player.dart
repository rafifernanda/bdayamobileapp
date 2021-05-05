import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Video_Player extends StatefulWidget {
  @override
  _Video_PlayerState createState() => _Video_PlayerState();
}

class _Video_PlayerState extends State<Video_Player> {

  String videoURL = "https://youtu.be/H0zCquXdUyo?list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbAVMV1fZFOOoShY";

  YoutubePlayerController _controller;

  @override
  void initState() {

//    _controller = YoutubePlayerController(
//        initialVideoId: YoutubePlayer.convertUrlToId(videoURL)
//    );
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          isLive: true,
        )
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),

            ],
          ),
        ),
      ),
    );
  }
}