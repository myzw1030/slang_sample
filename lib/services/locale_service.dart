import 'package:shared_preferences/shared_preferences.dart';
import 'package:slang_sample/i18n/strings.g.dart';

class LocaleService {
  static const String languageKey = 'languageCode';
  // 言語設定を保存(言語コードを保存)
  static Future<void> saveLanguage(AppLocale locale) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(languageKey, locale.toString());
  }

  // 言語設定を取得(言語コードを返す)デフォルトは現在の言語コード
  static Future<void> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguageCode = prefs.getString(languageKey) ??
        LocaleSettings.currentLocale.languageCode;
    // 取得した言語設定に基づいてロケールを設定
    // 保存された言語コードと一致するかどうかを確認（一致しない場合は現在のロケール）。
    LocaleSettings.setLocale(AppLocale.values.firstWhere(
      (locale) => locale.toString() == savedLanguageCode,
      orElse: () => LocaleSettings.currentLocale,
    ));
  }
}
