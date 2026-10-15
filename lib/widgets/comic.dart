import 'package:flutter/material.dart';

const ink = Color(0xFF171822);
const paper = Color(0xFFFFF3D6);
const heroYellow = Color(0xFFFFD52A);
const heroBlue = Color(0xFF175BC0);
const heroRed = Color(0xFFEB3838);

ThemeData comicTheme() {
  const border = BorderSide(color: ink, width: 3);
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(2));
  final button = ElevatedButton.styleFrom(
    backgroundColor: heroYellow,
    foregroundColor: ink,
    minimumSize: const Size(48, 48),
    textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
    side: border,
    shape: shape,
    elevation: 0,
  );
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: paper,
    colorScheme: ColorScheme.fromSeed(seedColor: heroBlue, surface: paper),
    appBarTheme: const AppBarTheme(
      backgroundColor: heroRed,
      foregroundColor: Colors.white,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 21,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w900,
      ),
      shape: Border(bottom: border),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: button),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: button.copyWith(
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ink,
        textStyle: const TextStyle(fontWeight: FontWeight.w900),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: border,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(color: heroBlue, width: 3),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: heroYellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: border,
      ),
      titleTextStyle: const TextStyle(
        color: ink,
        fontSize: 28,
        fontWeight: FontWeight.w900,
      ),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: ink,
      unselectedLabelColor: ink,
      indicatorColor: heroRed,
      labelStyle: TextStyle(fontWeight: FontWeight.w900),
    ),
  );
}

class ComicPanel extends StatelessWidget {
  const ComicPanel({
    super.key,
    required this.child,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(20),
  });
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      color: color,
      border: Border.all(color: ink, width: 3),
      borderRadius: BorderRadius.circular(2),
      boxShadow: const [BoxShadow(color: ink, offset: Offset(5, 6))],
    ),
    child: child,
  );
}

class ComicBackdrop extends StatelessWidget {
  const ComicBackdrop({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _DotsPainter(),
    child: SafeArea(child: child),
  );
}

class _DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = ink.withValues(alpha: 0.09);
    for (double y = 10; y < size.height; y += 18) {
      for (double x = 10; x < size.width; x += 18) {
        canvas.drawCircle(Offset(x, y), 1.4, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotsPainter oldDelegate) => false;
}

class HeroBadge extends StatelessWidget {
  const HeroBadge({super.key, this.size = 82});
  final double size;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: size,
    height: size,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.shield, size: size, color: ink),
        Icon(Icons.shield, size: size * .86, color: heroYellow),
        Icon(Icons.bolt, size: size * .62, color: ink),
      ],
    ),
  );
}

class ChapterHeading extends StatelessWidget {
  const ChapterHeading({
    super.key,
    required this.number,
    required this.title,
    required this.subtitle,
  });
  final String number;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'МИССИЯ $number',
        style: const TextStyle(
          color: heroBlue,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        title,
        style: const TextStyle(
          color: ink,
          fontSize: 30,
          fontWeight: FontWeight.w900,
          height: 1.1,
        ),
      ),
      const SizedBox(height: 8),
      Text(subtitle, style: const TextStyle(color: ink, fontSize: 15)),
      const SizedBox(height: 24),
    ],
  );
}
