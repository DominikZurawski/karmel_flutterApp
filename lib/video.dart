import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:karmel_app/globals.dart' as globals;

class VideoBar extends StatefulWidget {
  const VideoBar({Key? key}) : super(key: key);
  @override
  _VideoBar createState() => _VideoBar();
}

class _VideoBar extends State<VideoBar> {
//class VideoBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: globals.controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              globals.controller!.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          globals.isPlayerReady = true;
        },
        onEnded: (data) {
          globals.controller!.load(globals.ids[
              (globals.ids.indexOf(data.videoId) + 1) % globals.ids.length]);
          //_showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) =>
          /*Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                /*child: Image.asset(
              'assets/ypf.png',
              fit: BoxFit.fitWidth,
            ),*/
              ),
              title: const Text(
                'Youtube Player Flutter',
                style: TextStyle(color: Colors.white),
              ),

            ),
            body: ListView(
              children: [*/
          //player,
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            player,
            _space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: _isPlayerReady
                            ? () => _controller.load(_ids[
                        (_ids.indexOf(_controller.metadata.videoId) -
                            1) %
                            _ids.length])
                            : null,
                      ),*/
                IconButton(
                  icon: Icon(
                    globals.controller!.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  onPressed: globals.isPlayerReady
                      ? () {
                          globals.controller!.value.isPlaying
                              ? globals.controller!.pause()
                              : globals.controller!.play();
                          setState(() {});
                        }
                      : null,
                ),
                IconButton(
                  icon:
                      Icon(globals.muted ? Icons.volume_off : Icons.volume_up),
                  onPressed: globals.isPlayerReady
                      ? () {
                          globals.muted
                              ? globals.controller!.unMute()
                              : globals.controller!.mute();
                          setState(() {
                            globals.muted = !globals.muted;
                          });
                        }
                      : null,
                ),
                FullScreenButton(
                  controller: globals.controller,
                  color: Colors.blueAccent,
                ),
                /*IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: _isPlayerReady
                            ? () => _controller.load(_ids[
                        (_ids.indexOf(_controller.metadata.videoId) +
                            1) %
                            _ids.length])
                            : null,
                      ),*/
              ],
            ),
            _space,
            Row(
              children: <Widget>[
                const Text(
                  "Volume",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Expanded(
                  child: Slider(
                    inactiveColor: Colors.transparent,
                    value: globals.volume,
                    min: 0.0,
                    max: 100.0,
                    divisions: 10,
                    label: '${(globals.volume).round()}',
                    onChanged: globals.isPlayerReady
                        ? (value) {
                            setState(() {
                              globals.volume = value;
                            });
                            globals.controller!
                                .setVolume(globals.volume.round());
                          }
                        : null,
                  ),
                ),
              ],
            ),
            _space,
          ],
        ),
      ),
      //],
      //),
      //),
    );
  }

  Widget get _space => const SizedBox(height: 10);

  /*void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }*/
}
