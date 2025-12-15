import 'package:flutter/material.dart';

class KidsVocabApp extends StatelessWidget {
  const KidsVocabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Vocab Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const _HomePlaceholder(),
    );
  }
}

class _HomePlaceholder extends StatelessWidget {
  const _HomePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kids Vocab Game')),
      body: const Center(
        child: Text('Scaffold ready — screens to be added'),
      ),
    );
  }
}
