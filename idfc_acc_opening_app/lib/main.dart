import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:idfc_acc_opening_app/account_opening_page.dart';
import 'package:idfc_acc_opening_app/localization/app_localizations.dart';
import 'package:idfc_acc_opening_app/providers/language_provider.dart';

void main() {
  runApp(const IdfcApp());
}

class IdfcColors {
  static const Color primary = Color.fromARGB(255, 150, 31, 23);
  static const Color background = Color.fromARGB(255, 255, 236, 244);
  static const Color bannerBackground = Color.fromARGB(255, 245, 235, 198);
  static const Color textSecondary = Color.fromARGB(255, 87, 86, 86);
}

class IdfcApp extends StatefulWidget {
  const IdfcApp({super.key});

  @override
  State<IdfcApp> createState() => _IdfcAppState();
}

class _IdfcAppState extends State<IdfcApp> {
  final LanguageProvider _languageProvider = LanguageProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _languageProvider,
      builder: (context, child) {
        return MaterialApp(
          title: 'IDFC Account Opening',
          debugShowCheckedModeBanner: false,
          locale: _languageProvider.currentLocale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: IdfcColors.primary,
              primary: IdfcColors.primary,
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: const BorderSide(
                  color: IdfcColors.primary,
                  width: 1,
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: IdfcColors.primary,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
            ),
            cardTheme: CardThemeData(
              color: Colors.white,
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            radioTheme: RadioThemeData(
              fillColor: WidgetStateProperty.all(IdfcColors.primary),
            ),
            checkboxTheme: CheckboxThemeData(
              fillColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return IdfcColors.primary;
                }
                return null;
              }),
            ),
            dividerTheme: const DividerThemeData(
              color: Colors.grey,
              thickness: 1,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: IdfcColors.primary,
              elevation: 0,
              foregroundColor: Colors.white,
            ),
            textTheme: const TextTheme(
              headlineSmall: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              bodyMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: IdfcColors.textSecondary,
              ),
              bodySmall: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
          home: AccountOpeningApp(languageProvider: _languageProvider),
        );
      },
    );
  }
}
