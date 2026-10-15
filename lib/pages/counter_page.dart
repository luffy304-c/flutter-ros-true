import 'package:flutter/material.dart';

import '../widgets/comic.dart';
import '../widgets/hero_art.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Кнопки')),
      body: ComicBackdrop(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ChapterHeading(
                  number: '01',
                  title: 'ЗАРЯД СИЛЫ',
                  subtitle: 'Каждое нажатие меняет твой уровень энергии.',
                ),
                ComicPanel(
                  color: heroYellow,
                  child: Column(
                    children: [
                      const ActionBurst('BOOM!', color: heroRed),
                      Text(
                        '$count',
                        style: const TextStyle(
                          color: ink,
                          fontSize: 64,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text(
                        'ЕДИНИЦ ЭНЕРГИИ',
                        style: TextStyle(
                          color: ink,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  runSpacing: 8,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() => count++),
                      child: const Text('+1'),
                    ),
                    OutlinedButton(
                      onPressed: () => setState(() => count--),
                      child: const Text('-1'),
                    ),
                    TextButton(
                      onPressed: () => setState(() => count = 0),
                      child: const Text('Сброс'),
                    ),
                    IconButton(
                      onPressed: () => setState(() => count += 10),
                      tooltip: '+10 энергии',
                      style: IconButton.styleFrom(
                        backgroundColor: heroRed,
                        foregroundColor: ink,
                      ),
                      icon: const Icon(Icons.star),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
