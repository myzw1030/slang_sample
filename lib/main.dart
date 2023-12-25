import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slang_sample/i18n/strings.g.dart';
import 'package:slang_sample/local_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  runApp(ProviderScope(
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
      locale: currentLocale.flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final counter = ref.watch(counterProvider);
    final activeLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(t.mainScreen.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              t.mainScreen.counter(n: counter),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: AppLocale.values.map((locale) {
                final bool active = activeLocale == locale;

                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: active ? Colors.blue.shade200 : null,
                    ),
                    onPressed: () {
                      ref.read(localeProvider.notifier).changeLocale(locale);
                    },
                    child: Text(t.locales[locale.languageTag]!),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        tooltip: context.t.mainScreen.tapMe,
        child: const Icon(Icons.add),
      ),
    );
  }
}
