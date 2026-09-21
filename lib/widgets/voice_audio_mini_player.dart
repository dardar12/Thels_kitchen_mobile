// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// class VoiceAudioMiniPlayer extends StatefulWidget {
//   final String assetPath;
//   const VoiceAudioMiniPlayer({super.key, required this.assetPath});

//   @override
//   State<VoiceAudioMiniPlayer> createState() => _VoiceAudioMiniPlayerState();
// }

// class _VoiceAudioMiniPlayerState extends State<VoiceAudioMiniPlayer> {
//   late AudioPlayer _player;
//   StreamSubscription<PlayerState>? _playerStateSubscription;
//   bool isPlaying = false;
//   bool isLoading = false;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _player = AudioPlayer();
//     _initAudio();
//   }

//   Future<void> _initAudio() async {
//     await _playerStateSubscription?.cancel();
//     if (mounted) {
//       setState(() {
//         isLoading = true;
//         errorMessage = null;
//       });
//     }

//     try {
//       await _player.setAsset(widget.assetPath);
//       _playerStateSubscription = _player.playerStateStream.listen((state) {
//         if (mounted) {
//           setState(() {
//             isPlaying = state.playing;
//             if (state.processingState == ProcessingState.completed) {
//               _player.seek(Duration.zero);
//               _player.pause();
//             }
//           });
//         }
//       });
//     } catch (e) {
//       if (mounted) {
//         setState(() => errorMessage = ' error: $e');
//       }
//     } finally {
//       if (mounted) {
//         setState(() => isLoading = false);
//       }
//     }
//   }

//   @override
//   void didUpdateWidget(covariant VoiceAudioMiniPlayer oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.assetPath != widget.assetPath) {
//       _initAudio();
//     }
//   }

//   @override
//   void dispose() {
//     _playerStateSubscription?.cancel();
//     _player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (errorMessage != null) {
//       return Text(
//         errorMessage!,
//         style: const TextStyle(color: Colors.red, fontSize: 11),
//       );
//     }

//     return Row(
//       children: [
//         isLoading
//             ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
//             : IconButton(
//                 icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
//                 color: Theme.of(context).primaryColor,
//                 onPressed: () async {
//                   if (isPlaying) {
//                     await _player.pause();
//                   } else {
//                     await _player.play();
//                   }
//                 },
//               ),
//         Text(isPlaying ? 'Playing voice ...' : 'Tap to play '),
//       ],
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class VoiceAudioMiniPlayer extends StatefulWidget {
  final String assetPath;
  const VoiceAudioMiniPlayer({super.key, required this.assetPath});

  @override
  State<VoiceAudioMiniPlayer> createState() => _VoiceAudioMiniPlayerState();
}

class _VoiceAudioMiniPlayerState extends State<VoiceAudioMiniPlayer> {
  late AudioPlayer _player;
  StreamSubscription<PlayerState>? _playerStateSubscription;
  bool isPlaying = false;
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    await _playerStateSubscription?.cancel();
    if (mounted) {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });
    }

    try {
      await _player.setAsset(widget.assetPath, package: 'thels_kitchen');
      _playerStateSubscription = _player.playerStateStream.listen((state) {
        if (mounted) {
          setState(() {
            isPlaying = state.playing;
            if (state.processingState == ProcessingState.completed) {
              _player.seek(Duration.zero);
              _player.pause();
            }
          });
        }
      });
    } catch (_) {
      try {
        await _player.setAsset(widget.assetPath);
        _playerStateSubscription = _player.playerStateStream.listen((state) {
          if (mounted) {
            setState(() {
              isPlaying = state.playing;
              if (state.processingState == ProcessingState.completed) {
                _player.seek(Duration.zero);
                _player.pause();
              }
            });
          }
        });
      } catch (e) {
        if (mounted) {
          setState(() => errorMessage = 'err: $e');
        }
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void didUpdateWidget(covariant VoiceAudioMiniPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath) {
      _initAudio();
    }
  }

  @override
  void dispose() {
    _playerStateSubscription?.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Text(
        errorMessage!,
        style: const TextStyle(color: Colors.red, fontSize: 11),
      );
    }

    return Row(
      children: [
        isLoading
            ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
            : IconButton(
                icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  if (isPlaying) {
                    await _player.pause();
                  } else {
                    await _player.play();
                  }
                },
              ),
        Text(isPlaying ? 'Playing voice ...' : 'Tap to play '),
      ],
    );
  }
}