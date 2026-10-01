import 'package:flutter/material.dart';

class SplashAnimationController {
  final TickerProvider vsync;

  late final AnimationController controller;

  late final Animation<double> blobScale;
  late final Animation<double> blobWidth;
  late final Animation<double> blobHeight;
  late final Animation<double> contentFade;
  late final Animation<double> loginTransition;

  SplashAnimationController({
    required this.vsync,
  }) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(
        milliseconds: 3500,
      ),
    );

    // Blob awalnya kecil,
    // kemudian membesar.
    blobScale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.55,
          end: 0.75,
        ).chain(
          CurveTween(
            curve: Curves.easeOut,
          ),
        ),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.75,
          end: 1.0,
        ).chain(
          CurveTween(
            curve: Curves.easeInOut,
          ),
        ),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 7.0,
        ).chain(
          CurveTween(
            curve: Curves.easeInCubic,
          ),
        ),
        weight: 30,
      ),
    ]).animate(controller);

    // Ukuran blob sedikit berubah
    // supaya terasa seperti shape yang hidup.
    blobWidth = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.72,
          end: 0.9,
        ),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.9,
          end: 1.2,
        ),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 3.0,
        ),
        weight: 30,
      ),
    ]).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    blobHeight = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.55,
          end: 0.75,
        ),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.75,
          end: 1.1,
        ),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.1,
          end: 3.0,
        ),
        weight: 30,
      ),
    ]).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    // Logo + text muncul di awal.
    contentFade = CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.0,
        0.45,
        curve: Curves.easeIn,
      ),
    );

    // Untuk transisi terakhir menuju login.
    loginTransition = CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.82,
        1.0,
        curve: Curves.easeIn,
      ),
    );
  }

  void start() {
    controller.forward();
  }

  void dispose() {
    controller.dispose();
  }
}