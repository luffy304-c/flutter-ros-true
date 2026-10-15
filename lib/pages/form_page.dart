import 'package:flutter/material.dart';

import '../widgets/comic.dart';
import '../widgets/hero_art.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final controller = TextEditingController();
  String result = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Поле ввода')),
      body: ComicBackdrop(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ChapterHeading(
                number: '02',
                title: 'КТО ТЫ, ГЕРОЙ?',
                subtitle: 'Впиши своё имя в историю.',
              ),
              const ComicPanel(
                padding: EdgeInsets.zero,
                child: HeroArt(height: 180),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Введите имя',
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = 'Привет, ${controller.text}!';
                  });
                },
                child: const Text('Показать'),
              ),
              const SizedBox(height: 20),
              if (result.isNotEmpty)
                ComicPanel(
                  color: heroYellow,
                  child: Text(
                    result,
                    style: const TextStyle(
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
