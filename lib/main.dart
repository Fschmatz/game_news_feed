import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:game_news_feed/util/theme.dart';
import 'package:provider/provider.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    EasyDynamicThemeWidget(
      child: const StartAppTheme(),
    ),
  );

}

class StartAppTheme extends StatelessWidget {
  const StartAppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: light,
      darkTheme: dark,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: const App(),
    );
  }
}



