import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slang_sample/i18n/strings.g.dart';
import 'package:slang_sample/local_state.dart';
import 'package:slang_sample/pages/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // デバイスのロケール設定に基づいて初期化
  LocaleSettings.useDeviceLocale();
  runApp(ProviderScope(
    // アプリ内で言語を変更時に、その変更に更新
    child: TranslationProvider(
      child: const MyApp(),
    ),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 現在選択されている言語（ロケール）
      locale: currentLocale.flutterLocale,
      // アプリがサポートする言語を定義
      supportedLocales: AppLocaleUtils.supportedLocales,
      // 言語リソースを提供するためのデリゲートを定義
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: const MainPage(),
    );
  }
}
