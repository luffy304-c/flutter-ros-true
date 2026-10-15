import 'package:flutter/material.dart';

import '../widgets/comic.dart';
import '../widgets/hero_art.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Вкладки'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Дом'),
              Tab(icon: Icon(Icons.favorite), text: 'Избранное'),
              Tab(icon: Icon(Icons.person), text: 'Профиль'),
            ],
          ),
        ),
        body: const ComicBackdrop(
          child: TabBarView(
            children: [
              _Headquarters(
                icon: Icons.home,
                title: 'ШТАБ ГЕРОЕВ',
                color: heroYellow,
                child: Icon(Icons.home, size: 80, color: ink),
              ),
              _Headquarters(
                icon: Icons.favorite,
                title: 'ЗАЛ СЛАВЫ',
                color: heroRed,
                child: FlutterLogo(size: 100),
              ),
              _Headquarters(
                icon: Icons.person,
                title: 'ДОСЬЕ ГЕРОЯ',
                color: Color(0xFFB9AAFF),
                child: Text(
                  'Это профиль',
                  style: TextStyle(
                    color: ink,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Headquarters extends StatelessWidget {
  const _Headquarters({
    required this.icon,
    required this.title,
    required this.color,
    required this.child,
  });
  final IconData icon;
  final String title;
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) => Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: ComicPanel(
        color: color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28, color: ink),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ink,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),
            const HeroArt(height: 150),
            const SizedBox(height: 20),
            child,
            const SizedBox(height: 12),
          ],
        ),
      ),
    ),
  );
}
