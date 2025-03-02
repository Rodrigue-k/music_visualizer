import 'dart:math';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class MusicVizualizer extends StatefulWidget {
  const MusicVizualizer({super.key});

  @override
  State<MusicVizualizer> createState() => _MusicVizualizerState();
}

class _MusicVizualizerState extends State<MusicVizualizer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: CustomPaint(
          size: Size.infinite,
          painter: CircleGraphPainter(),
        ),
      ),
    );
  }
}

class CircleGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const maxRadius = 90.0; // Rayon maximal du cercle
    final paint = Paint()..strokeCap = StrokeCap.round;

    final random = math.Random();

    // Générer 100 points à l'intérieur du cercle
    for (int i = 0; i < 100; i++) {
      // Générer un rayon aléatoire entre 0 et maxRadius
      final radius = maxRadius * math.sqrt(random.nextDouble());
      // Générer un angle aléatoire entre 0 et 2π
      final angle = 2 * math.pi * random.nextDouble();

      // Convertir en coordonnées cartésiennes
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      // Choisir une couleur aléatoire (bleu, vert, jaune)
      paint.color = _getRandomColor();
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(Offset(x, y), 3.0, paint);
    }
  }

  Color _getRandomColor() {
    final random = math.Random();
    final colors = [Colors.blue, Colors.green, Colors.yellow];
    return colors[random.nextInt(colors.length)];
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
