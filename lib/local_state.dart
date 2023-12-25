import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slang_sample/i18n/strings.g.dart';

// アプリの現在のロケール（言語設定）を管理
class LocaleNotifier extends Notifier<AppLocale> {
  @override
  build() {
    // 初期状態を現在のロケール
    return LocaleSettings.currentLocale;
  }

  // 新しいロケール設定
  void changeLocale(AppLocale newLocale) {
    state = newLocale;
    LocaleSettings.setLocale(newLocale);
  }
}

class CounterNotifier extends Notifier<int> {
  @override
  build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, AppLocale>(LocaleNotifier.new);

final counterProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);