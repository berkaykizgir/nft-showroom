import 'dart:math';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:nft_showroom/animations/fade_animation.dart';
import 'package:nft_showroom/screens/nft_screen.dart';
import 'package:nft_showroom/widgets/nft_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010101),
      body: Stack(
        children: [
          Positioned.fill(
              child: ShaderMask(
            blendMode: BlendMode.dstOut,
            shaderCallback: (bounds) {
              return LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.9),
                Colors.black,
              ], stops: const [
                0,
                0.62,
                0.67,
                0.85,
                1
              ]).createShader(bounds);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    10,
                    (index) {
                      return index % 2 == 0
                          ? const SizedBox(height: 30)
                          : NFTListView(
                              startIndex: 1 + index ~/ 2 * 10,
                              duration: Random().nextInt(45) + 25,
                            );
                    },
                  ).toList(),
                ],
              ),
            ),
          )),
          Positioned(
              bottom: 35,
              left: 24,
              right: 24,
              child: SizedBox(
                height: 170,
                child: FadeAnimation(
                  intervalStart: 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Monkey Podium',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                              shadows: [for (double i = 1; i < 8; i++) Shadow(color: Colors.blue.shade700, blurRadius: 3 * i)])),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Show some love to monkeys !',
                        style: TextStyle(
                            color: Colors.white70,
                            height: 1.2,
                            shadows: [for (double i = 1; i < 4; i++) Shadow(color: Colors.grey.shade700, blurRadius: 3 * i)]),
                      ),
                      const Spacer(),
                      Container(
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
                          for (double i = 1; i < 3; i++) BoxShadow(color: Colors.blue.shade700, blurRadius: 3 * i, inset: true),
                          for (double i = 1; i < 5; i++)
                            BoxShadow(spreadRadius: -1, blurStyle: BlurStyle.outer, color: Colors.blue.shade700, blurRadius: 3 * i),
                        ]),
                        child: TextButton(
                          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const NFTDisplay(nft: 'assets/nft/1.png'),
                          )),
                          style: TextButton.styleFrom(
                              side: BorderSide(color: Colors.blue.shade700, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text(
                            'Discover',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                shadows: [for (double i = 1; i < 8; i++) Shadow(color: Colors.blue.shade700, blurRadius: 3 * i)]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
