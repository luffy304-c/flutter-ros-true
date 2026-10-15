import 'package:flutter/material.dart';

import '../widgets/comic.dart';
import '../widgets/hero_art.dart';

class GesturePage extends StatefulWidget {
  const GesturePage({super.key});

  @override
  State<GesturePage> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  bool isRed = false;
  List<String> items = ['Яблоко', 'Банан', 'Груша', 'Апельсин'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Жесты')),
      body: ComicBackdrop(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 24, 32),
          children: [
            const ChapterHeading(
              number: '03',
              title: 'ЛОВКОСТЬ РУК',
              subtitle: 'Коснись квадрата. Смахни строку. Ты управляешь!',
            ),

            // Нажатие на квадрат
            Center(
              child: GestureDetector(
                onTap: () => setState(() => isRed = !isRed),
                child: Container(
                  width: 150,
                  height: 150,
                  color: isRed ? Colors.red : Colors.blue,
                  alignment: Alignment.center,
                  child: const ActionBurst('Нажми'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Смахни строку в сторону:', textAlign: TextAlign.center),

            // Список, строки можно смахнуть
            for (final item in items)
              Dismissible(
                key: Key(item),
                onDismissed: (direction) {
                  setState(() => items.remove(item));
                },
                background: Container(
                  color: heroRed,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(16),
                  child: const Icon(Icons.flash_on, color: ink),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ComicPanel(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: const Icon(Icons.shield_outlined, color: ink),
                      title: Text(
                        item,
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                      trailing: const Icon(Icons.swipe, color: ink),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
