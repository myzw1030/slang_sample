import 'package:flutter/material.dart';
import 'package:slang_sample/i18n/strings.g.dart';
import 'package:slang_sample/pages/locale_page.dart';

enum SettingOption {
  language,
  // 他の設定項目があれば記述。ex)themeMode
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context);
    return ListView.builder(
      itemCount: SettingOption.values.length,
      itemBuilder: (context, index) {
        final option = SettingOption.values[index];
        switch (option) {
          case SettingOption.language:
            return _SettingsListItem(
              icon: Icons.language,
              title: translations.settings.language.title,
              trailing: Text(translations.settings.language.currentLanguage),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LocalePage(),
                  ),
                );
              },
            );
        }
      },
    );
  }
}

class _SettingsListItem extends StatelessWidget {
  const _SettingsListItem({
    required this.icon,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Widget trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
