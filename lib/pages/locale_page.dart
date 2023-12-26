import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slang_sample/i18n/strings.g.dart';
import 'package:slang_sample/providers/locale_state.dart';

class LocalePage extends ConsumerWidget {
  const LocalePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 現在のコンテキストに基づいて適切な翻訳を取得
    final translations = Translations.of(context);
    final localeState = ref.watch(localeProvider);
    final localeNotifier = ref.read(localeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.settings.language.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: AppLocale.values.length,
          itemBuilder: (context, index) {
            final locale = AppLocale.values[index];
            return RadioListTile<AppLocale>(
              value: locale,
              groupValue: localeState,
              title: Text(translations.locales[locale.languageTag]!),
              onChanged: (value) {
                if (value != null) {
                  localeNotifier.changeLocale(value);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
