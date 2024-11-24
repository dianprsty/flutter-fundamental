import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/animation/explicit/align_transition_example.dart';
import 'package:flutter_fundamental/feature/animation/explicit/decorated_box_transition_example.dart';
import 'package:flutter_fundamental/feature/animation/explicit/default_text_style_transition.dart';
import 'package:flutter_fundamental/feature/animation/explicit/fade_transition_example.dart';
import 'package:flutter_fundamental/feature/animation/explicit/multi_animation_builder_example.dart';
import 'package:flutter_fundamental/feature/animation/explicit/multi_animation_example.dart';
import 'package:flutter_fundamental/feature/animation/explicit/positioned_transition_example.dart';
import 'package:flutter_fundamental/feature/animation/explicit/rotation_transition_example.dart';
import 'package:flutter_fundamental/feature/animation/explicit/scale_transition_example.dart';
import 'package:flutter_fundamental/feature/animation/explicit/size_transition_example.dart';
import 'package:flutter_fundamental/feature/animation/explicit/slide_transition_example.dart';
import 'package:flutter_fundamental/feature/animation/explicit/two_animated_builder_example.dart';
import 'package:flutter_fundamental/feature/animation/implicit/animated_align_axample.dart';
import 'package:flutter_fundamental/feature/animation/implicit/animated_container_example.dart';
import 'package:flutter_fundamental/feature/animation/implicit/animated_cross_fade_example.dart';
import 'package:flutter_fundamental/feature/animation/implicit/animated_default_text_style_example.dart';
import 'package:flutter_fundamental/feature/animation/implicit/animated_opacity_example.dart';
import 'package:flutter_fundamental/feature/animation/implicit/animated_padding_example.dart';
import 'package:flutter_fundamental/feature/animation/implicit/animated_positioned_axample.dart';
import 'package:flutter_fundamental/feature/animation/implicit/animated_rotation_example.dart';
import 'package:flutter_fundamental/feature/animation/implicit/animated_size_example.dart';
import 'package:flutter_fundamental/feature/animation/implicit/animated_switcher_example.dart';
import 'package:flutter_fundamental/feature/animation/implicit/tween_animation_builder_size_example.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Animation Page"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: const [
              Text("Implicit Animation",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 16),
              ImplicitAnimation(),
              SizedBox(height: 32),
              Text("Explicit Animation",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 16),
              ExplicitAnimation(),
            ],
          ),
        ));
  }
}

class ImplicitAnimation extends StatelessWidget {
  const ImplicitAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AnimatedContainerExample(),
          ));
        },
        child: const Text('Animated Container'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AnimatedOpacityExample(),
          ));
        },
        child: const Text('Animated Opacity'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AnimatedAlignExample(),
          ));
        },
        child: const Text('Animated Align'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AnimatedPaddingExample(),
          ));
        },
        child: const Text('Animated Padding'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AnimatedDefaultTextStyleExample(),
          ));
        },
        child: const Text('Animated Default Text Style'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AnimatedPositionedExample(),
          ));
        },
        child: const Text('Animated Positioned'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AnimatedRotationExample(),
          ));
        },
        child: const Text('Animated Rotation'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AnimatedCrossFadeExample(),
          ));
        },
        child: const Text('Animated Cross Fade'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AnimatedSizeExample(),
          ));
        },
        child: const Text('Animated Size'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AnimatedSwitcherExample(),
          ));
        },
        child: const Text('Animated Switcher'),
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TweenAnimationBuilderSizeExample(),
          ));
        },
        child: const Text('Tween Builder Size'),
      ),
    ]);
  }
}

class ExplicitAnimation extends StatelessWidget {
  const ExplicitAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SizeTransitionExample(),
          ));
        },
        child: const Text('Size Transition'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const FadeTransitionExample(),
          ));
        },
        child: const Text('Fade Transition'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AlignTransitionExample(),
          ));
        },
        child: const Text('Align Transition'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const RotationTransitionExample(),
          ));
        },
        child: const Text('Rotation Transition'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ScaleTransitionExample(),
          ));
        },
        child: const Text('Scale Transition'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SlideTransitionExample(),
          ));
        },
        child: const Text('Slide Transition'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PositionedTransitionExample(),
          ));
        },
        child: const Text('Positioned Transition'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DecoratedBoxTransitionExample(),
          ));
        },
        child: const Text('Decorated Box Transition'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DefaultTextStyleTransitionExample(),
          ));
        },
        child: const Text('Default Text Style Transition'),
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MultiAnimationExample(),
          ));
        },
        child: const Text('Multiple Animation'),
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MultiAnimationBuilderExample(),
          ));
        },
        child: const Text('Multiple Animation Builder'),
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TwoAnimatedBuilderExample(),
          ));
        },
        child: const Text('Two Builder'),
      ),
    ]);
  }
}
