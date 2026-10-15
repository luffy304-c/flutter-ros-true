import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'comic.dart';

/// Original vector artwork, drawn at any resolution without external assets.
class HeroArt extends StatelessWidget {
  const HeroArt({super.key, this.height = 260});
  final double height;
  @override
  Widget build(BuildContext context) => Semantics(
    image: true,
    label: 'Супергерой в синей маске и красном плаще над городом',
    child: SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(painter: _HeroPainter()),
    ),
  );
}

class _HeroPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.clipRect(Offset.zero & size);
    canvas.scale(size.width / 400, size.height / 300);
    final fill = Paint();
    final outline = Paint()
      ..color = ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
    void polygon(List<Offset> points, Color color, {bool stroke = true}) {
      final path = Path()..addPolygon(points, true);
      canvas.drawPath(path, fill..color = color);
      if (stroke) canvas.drawPath(path, outline);
    }

    void path(Path path, Color color) {
      canvas.drawPath(path, fill..color = color);
      canvas.drawPath(path, outline);
    }

    canvas.drawRect(
      const Rect.fromLTWH(0, 0, 400, 300),
      fill..color = heroYellow,
    );
    const origin = Offset(250, 140);
    for (int i = 0; i < 24; i++) {
      final a = i * math.pi / 12;
      polygon(
        [
          origin,
          origin + Offset(math.cos(a), math.sin(a)) * 700,
          origin + Offset(math.cos(a + .065), math.sin(a + .065)) * 700,
        ],
        const Color(0xFFF09F22),
        stroke: false,
      );
    }
    for (double y = 5; y < 300; y += 9) {
      for (double x = 5; x < 400; x += 9) {
        canvas.drawCircle(
          Offset(x, y),
          1.2,
          fill..color = ink.withValues(alpha: .13),
        );
      }
    }
    // Skyline and lit windows.
    for (int i = 0; i < 10; i++) {
      final x = i * 45.0 - 15;
      final top = 218.0 - (i % 3) * 22;
      canvas.drawRect(Rect.fromLTWH(x, top, 39, 300 - top), fill..color = ink);
      for (double wy = top + 12; wy < 300; wy += 18) {
        for (double wx = x + 8; wx < x + 33; wx += 14) {
          canvas.drawRect(
            Rect.fromLTWH(wx, wy, 5, 7),
            fill..color = heroYellow,
          );
        }
      }
    }
    // Wind-swept cape.
    path(
      Path()
        ..moveTo(224, 110)
        ..cubicTo(290, 84, 320, 153, 400, 102)
        ..lineTo(418, 270)
        ..cubicTo(332, 221, 322, 292, 235, 262)
        ..lineTo(197, 168)
        ..close(),
      heroRed,
    );
    path(
      Path()
        ..moveTo(264, 141)
        ..cubicTo(310, 154, 327, 193, 386, 181)
        ..cubicTo(333, 231, 301, 204, 269, 202)
        ..close(),
      const Color(0xFFAF172A),
    );
    // Back leg and boot.
    polygon([
      const Offset(210, 214),
      const Offset(247, 218),
      const Offset(225, 272),
      const Offset(179, 301),
      const Offset(153, 289),
      const Offset(198, 248),
    ], heroBlue);
    polygon([
      const Offset(174, 268),
      const Offset(202, 286),
      const Offset(177, 313),
      const Offset(123, 313),
      const Offset(129, 297),
    ], heroRed);
    // Forward leg.
    polygon([
      const Offset(235, 207),
      const Offset(273, 200),
      const Offset(297, 241),
      const Offset(281, 300),
      const Offset(251, 300),
      const Offset(260, 248),
    ], heroBlue);
    polygon([
      const Offset(256, 274),
      const Offset(287, 280),
      const Offset(288, 311),
      const Offset(236, 311),
    ], heroRed);
    // Torso.
    path(
      Path()
        ..moveTo(210, 106)
        ..quadraticBezierTo(237, 96, 264, 112)
        ..lineTo(289, 151)
        ..lineTo(265, 177)
        ..lineTo(267, 218)
        ..quadraticBezierTo(232, 233, 207, 216)
        ..lineTo(202, 166)
        ..lineTo(181, 139)
        ..close(),
      heroBlue,
    );
    polygon(
      [
        const Offset(252, 128),
        const Offset(273, 157),
        const Offset(251, 178),
        const Offset(253, 212),
        const Offset(231, 215),
        const Offset(235, 163),
      ],
      const Color(0xFF103D86),
      stroke: false,
    );
    // Arm reaches upward into a fist.
    path(
      Path()
        ..moveTo(201, 113)
        ..quadraticBezierTo(185, 101, 174, 87)
        ..lineTo(151, 43)
        ..lineTo(126, 54)
        ..lineTo(144, 111)
        ..quadraticBezierTo(160, 143, 185, 150)
        ..close(),
      heroBlue,
    );
    polygon([
      const Offset(131, 71),
      const Offset(162, 59),
      const Offset(152, 31),
      const Offset(122, 39),
    ], heroRed);
    path(
      Path()
        ..moveTo(123, 42)
        ..lineTo(114, 28)
        ..lineTo(115, 12)
        ..lineTo(125, 7)
        ..lineTo(132, 12)
        ..lineTo(143, 8)
        ..lineTo(150, 14)
        ..lineTo(158, 16)
        ..lineTo(162, 33)
        ..lineTo(151, 48)
        ..close(),
      const Color(0xFFF5B985),
    );
    // Forearm across the waist.
    path(
      Path()
        ..moveTo(272, 130)
        ..quadraticBezierTo(294, 139, 298, 163)
        ..lineTo(272, 194)
        ..lineTo(245, 181)
        ..lineTo(264, 163)
        ..lineTo(251, 151)
        ..close(),
      heroBlue,
    );
    polygon([
      const Offset(267, 170),
      const Offset(281, 189),
      const Offset(255, 204),
      const Offset(240, 182),
    ], heroRed);
    // Belt and lightning crest.
    polygon([
      const Offset(207, 206),
      const Offset(264, 207),
      const Offset(267, 220),
      const Offset(209, 223),
    ], heroYellow);
    canvas.drawCircle(const Offset(235, 214), 8, fill..color = ink);
    polygon([
      const Offset(224, 132),
      const Offset(248, 132),
      const Offset(239, 150),
      const Offset(252, 150),
      const Offset(224, 184),
      const Offset(231, 157),
      const Offset(217, 157),
    ], heroYellow);
    // Neck, face, hair, angular domino mask.
    polygon([
      const Offset(220, 90),
      const Offset(246, 88),
      const Offset(251, 112),
      const Offset(235, 123),
      const Offset(217, 108),
    ], const Color(0xFFF5B985));
    path(
      Path()
        ..moveTo(213, 54)
        ..quadraticBezierTo(228, 35, 249, 48)
        ..lineTo(259, 72)
        ..lineTo(253, 92)
        ..lineTo(234, 105)
        ..lineTo(216, 92)
        ..lineTo(207, 72)
        ..close(),
      const Color(0xFFF5B985),
    );
    path(
      Path()
        ..moveTo(210, 73)
        ..lineTo(204, 58)
        ..lineTo(207, 39)
        ..lineTo(223, 34)
        ..lineTo(235, 20)
        ..lineTo(243, 34)
        ..lineTo(262, 33)
        ..lineTo(254, 53)
        ..lineTo(232, 48)
        ..lineTo(219, 55)
        ..close(),
      ink,
    );
    polygon([
      const Offset(210, 61),
      const Offset(231, 64),
      const Offset(251, 56),
      const Offset(261, 68),
      const Offset(248, 82),
      const Offset(234, 77),
      const Offset(218, 83),
    ], heroBlue);
    polygon(
      [const Offset(216, 67), const Offset(228, 70), const Offset(222, 74)],
      Colors.white,
      stroke: false,
    );
    polygon(
      [const Offset(237, 68), const Offset(253, 63), const Offset(248, 72)],
      Colors.white,
      stroke: false,
    );
    canvas.drawLine(
      const Offset(233, 90),
      const Offset(246, 87),
      outline..strokeWidth = 2.5,
    );
    // Ink motion strokes.
    for (int i = 0; i < 4; i++) {
      canvas.drawLine(
        Offset(55.0 + i * 16, 150.0 + i * 10),
        Offset(96.0 + i * 16, 100.0 + i * 10),
        outline..strokeWidth = 2,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_HeroPainter oldDelegate) => false;
}

class ComicWord extends StatelessWidget {
  const ComicWord(
    this.text, {
    super.key,
    this.size = 38,
    this.color = heroYellow,
  });
  final String text;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      height: 1.05,
      letterSpacing: -1,
    );
    return Stack(
      children: [
        ExcludeSemantics(
          child: Text(
            text,
            style: style.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 5
                ..color = ink,
            ),
          ),
        ),
        Text(text, style: style.copyWith(color: color)),
      ],
    );
  }
}

class ActionBurst extends StatelessWidget {
  const ActionBurst(this.text, {super.key, this.color = heroYellow});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _BurstPainter(color),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
      child: ComicWord(text, size: 24, color: Colors.white),
    ),
  );
}

class _BurstPainter extends CustomPainter {
  _BurstPainter(this.color);
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final points = List.generate(24, (i) {
      final a = i * math.pi / 12;
      final r = i.isEven ? 1.0 : .72;
      return Offset(
        size.width / 2 + math.cos(a) * size.width / 2 * r,
        size.height / 2 + math.sin(a) * size.height / 2 * r,
      );
    });
    final path = Path()..addPolygon(points, true);
    canvas.drawPath(path, Paint()..color = color);
    canvas.drawPath(
      path,
      Paint()
        ..color = ink
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5,
    );
  }

  @override
  bool shouldRepaint(_BurstPainter oldDelegate) => color != oldDelegate.color;
}
