import 'package:flutter/material.dart';
import 'package:slang_sample/i18n/strings.g.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    // 現在のコンテキストに基づいて適切な翻訳を取得
    final translations = Translations.of(context);
    return ListView.builder(
      itemCount: AppLocale.values.length,
      itemBuilder: (context, index) => const ListTile(
        title: Text('タイトルが入ります。'),
        subtitle: Text('サブタイトルが入ります。'),
      ),
    );
  }
}
