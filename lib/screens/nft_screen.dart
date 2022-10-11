import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:nft_showroom/animations/fade_animation.dart';
import 'package:nft_showroom/widgets/info_tile.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NFTDisplay extends StatefulWidget {
  const NFTDisplay({Key? key, required this.nft}) : super(key: key);
  final String nft;

  @override
  State<NFTDisplay> createState() => _NFTDisplayState();
}

class _NFTDisplayState extends State<NFTDisplay> {
  List<String> names = [
    'Warren Hester',
    'Damaris Figueroa',
    'Houston Avila',
    'Mariela Barton',
    'Renee Fisher',
    'Terrence Mckinney',
    'Rubi Pearson',
    'Gauge Hoffman',
    'Olive Love',
    'Davon Flynn',
    'Kamron Mcbride',
    'Miracle Underwood',
    'Vaughn Higgins',
    'Ryan Larsen',
    'Rafael Mitchell',
    'Azul Barrera',
    'Braylon Benson',
    'Andy Maddox',
    'Blaze Douglas',
    'Keon Burgess',
    'Sebastian Nelson',
    'Elianna Bennett',
    'Elaina Morrison',
    'Emmanuel Mccormick',
    'Sebastian Riley',
    'Eric Cole',
    'Ronin Zuniga',
    'Joel Duran',
    'Aaron Wong',
    'Kristen Lewis',
    'Jairo Mueller',
    'Jaylen Bruce',
    'Alexandra Wolf',
    'Madelyn Hess',
    'Tyshawn Cooke',
    'Sophia Lozano',
    'Nehemiah Novak',
    'Jordan Waters',
    'Hazel Becker',
    'Amir Martin',
    'Veronica Abbott',
    'Marisa Barber',
    'Brooke Pugh',
    'Jayce Sosa',
    'Josh Bradshaw',
    'Autumn Brandt',
    'Mercedes Branch',
    'Amare Burns',
    'Matthew Lowe',
    'Kaya Fry',
  ];

  var remainingTime = '${DateTime.now().day}d ${23 - DateTime.now().hour}h ${60 - DateTime.now().minute}m ${60 - DateTime.now().second}s';
  var seconds = 0;
  late double price;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    price = Random().nextDouble() * 15;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      seconds++;
      setState(() {
        remainingTime = '${DateTime.now().day}d ${23 - DateTime.now().hour}h ${60 - DateTime.now().minute}m ${60 - DateTime.now().second}s';
        if (seconds == 20) {
          price += Random().nextDouble() * 5;
          seconds = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Hero(
              tag: widget.nft,
              child: Image.asset(widget.nft),
            ),
            Positioned(
                bottom: 10,
                left: 10,
                child: FadeAnimation(
                  intervalStart: 0.1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        width: 160,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: const Text(
                          'Digital NFT Art',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ]),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FadeAnimation(
              intervalStart: 0.3,
              child: Text(
                  'Monkey #${int.parse(widget.nft.split('.').first.substring(11)) < 10 ? '20${widget.nft.split('.').first.substring(11)}' : '2${widget.nft.split('.').first.substring(11)}'}',
                  style: TextStyle(
                      color: Colors.white, fontSize: 22, shadows: [for (double i = 1; i < 8; i++) Shadow(color: Colors.blue.shade700, blurRadius: 3 * i)])),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FadeAnimation(
              intervalStart: 0.35,
              child: Text(
                'Owned by ${names[int.parse(widget.nft.split('.').first.substring(11))]}',
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FadeAnimation(
              intervalStart: 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoTile.time(title: remainingTime),
                  InfoTile.price(title: '${price.toStringAsFixed(2)} ETH'),
                ],
              ),
            ),
          ),
          const Spacer(),
          FadeAnimation(
            intervalStart: 0.6,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
                for (double i = 1; i < 3; i++) BoxShadow(color: Colors.blue.shade700, blurRadius: 3 * i, inset: true),
                for (double i = 1; i < 5; i++) BoxShadow(spreadRadius: -1, blurStyle: BlurStyle.outer, color: Colors.blue.shade700, blurRadius: 3 * i),
              ]),
              child: FadeAnimation(
                intervalStart: 0.8,
                child: Text(
                  'Place Bid',
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, shadows: [for (double i = 1; i < 8; i++) Shadow(color: Colors.blue.shade700, blurRadius: 3 * i)]),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
