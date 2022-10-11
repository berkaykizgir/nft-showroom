import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const InfoTile({Key? key, required this.title, required this.subtitle, required this.color}) : super(key: key);
  const InfoTile.time({Key? key, required this.title, this.subtitle = 'Remaining Time', this.color = Colors.green}) : super(key: key);
  const InfoTile.price({Key? key, required this.title, this.subtitle = 'Highest Bid', this.color = Colors.amber}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 16, shadows: [for (double i = 1; i < 8; i++) Shadow(color: color, blurRadius: 3 * i)])),
        const SizedBox(
          height: 8,
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
