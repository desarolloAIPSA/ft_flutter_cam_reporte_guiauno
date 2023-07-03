import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SonidoMedia {
  final player = AudioPlayer();

  Future<void> play({required String filePath}) async {
    try {
      await player.setAsset(filePath);
      await player.play();
      await stop();
    } catch (e) {
      debugPrint('Error al cargar/reproducir el archivo de sonido: $e');
    }
  }

  Future<void> pause() async {
    await player.pause();
  }

  Future<void> stop() async {
    await player.stop();
  }
}
