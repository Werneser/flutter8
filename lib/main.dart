import 'package:flutter/material.dart';
import 'package:flutter8/shared/locator.dart';
import 'package:get_it/get_it.dart';
import 'shared/app_theme.dart';
import 'services/screens/services_page.dart';
import 'user_services/screens/user_appointments_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppState appState;
  late VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    appState = GetIt.instance<AppState>();
    _listener = () => setState(() {});
    appState.addListener(_listener);
  }

  @override
  void dispose() {
    appState.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Используем AnimatedBuilder для автоматического перерисования при изменениях AppState
    return AnimatedBuilder(
      animation: appState,
      builder: (context, child) {
        return MaterialApp(
          title: 'Госуслуги Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDark ? ThemeMode.dark : ThemeMode.light,
          home: ServicesPage(
            onNavigateToDetail: (service) {
              // деталь будет открываться внутри ServicesPage
            },
            onThemeToggle: appState.toggleTheme,
          ),
          routes: {
            '/appointments': (_) => UserAppointmentsPage(),
          },
        );
      },
    );
  }
}