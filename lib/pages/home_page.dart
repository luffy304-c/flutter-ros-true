import 'package:flutter/material.dart';

import '../widgets/comic.dart';
import '../widgets/hero_art.dart';
import 'counter_page.dart';
import 'form_page.dart';
import 'gesture_page.dart';
import 'tabs_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void open(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const HeroBadge(size: 64),
        title: const Text('Привет!'),
        content: const Text('Это пример диалога'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('HERO COMICS'),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.bolt, color: heroYellow),
        ),
      ],
    ),
    drawer: Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: heroYellow),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroBadge(size: 72),
                Text(
                  'Меню',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Кнопки'),
            onTap: () {
              Navigator.pop(context);
              open(context, const CounterPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Поле ввода'),
            onTap: () {
              Navigator.pop(context);
              open(context, const FormPage());
            },
          ),
        ],
      ),
    ),
    body: ComicBackdrop(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 24, 32),
        children: [
          ComicPanel(
            padding: EdgeInsets.zero,
            color: heroYellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: ink,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: const Text(
                    '№ 01     •     НАЧАЛО ЛЕГЕНДЫ     •     2026',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const Stack(
                  children: [
                    HeroArt(height: 250),
                    Positioned(
                      left: 12,
                      bottom: 14,
                      child: ActionBurst('ВПЕРЁД!', color: heroRed),
                    ),
                  ],
                ),
                Container(
                  color: heroRed,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ComicWord(
                        'ГОРОДУ НУЖЕН ГЕРОЙ.',
                        size: 32,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'И ЭТОТ ГЕРОЙ — ТЫ!',
                        style: TextStyle(
                          color: heroYellow,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          const Text(
            'ТВОИ СУПЕРСПОСОБНОСТИ',
            style: TextStyle(
              color: ink,
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 14),
          _mission(
            context,
            '01',
            'Кнопки и счётчик',
            'Заряди свою суперсилу',
            Icons.bolt,
            heroYellow,
            const CounterPage(),
          ),
          _mission(
            context,
            '02',
            'Поле ввода',
            'Раскрой своё геройское имя',
            Icons.badge_outlined,
            heroRed,
            const FormPage(),
          ),
          _mission(
            context,
            '03',
            'Жесты',
            'Управляй одним движением',
            Icons.touch_app_outlined,
            const Color(0xFF6DD6C5),
            const GesturePage(),
          ),
          _mission(
            context,
            '04',
            'Вкладки',
            'Исследуй штаб героев',
            Icons.auto_awesome,
            const Color(0xFFB9AAFF),
            const TabsPage(),
          ),
          OutlinedButton.icon(
            onPressed: () => showMyDialog(context),
            icon: const Icon(Icons.chat_bubble_outline),
            label: const Text('Показать диалог'),
          ),
          const SizedBox(height: 18),
          const Text(
            'ПРОДОЛЖЕНИЕ СЛЕДУЕТ…',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ink,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    ),
  );

  Widget _mission(
    BuildContext context,
    String number,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    Widget page,
  ) => Padding(
    padding: const EdgeInsets.only(bottom: 18),
    child: ComicPanel(
      padding: EdgeInsets.zero,
      color: color,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(1),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => open(context, page),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 58,
                  decoration: BoxDecoration(
                    color: paper,
                    border: Border.all(color: ink, width: 2),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Icon(icon, color: ink, size: 30),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: ink,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: const TextStyle(color: ink, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  number,
                  style: const TextStyle(
                    color: ink,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
