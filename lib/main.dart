import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'shared/locator.dart';
import 'package:get_it/get_it.dart';

import 'shared/app_theme.dart';
import 'services/screens/services_page.dart';
import 'user_services/screens/user_appointments_page.dart';
import 'shared/stores/app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppState appState = GetIt.instance<AppState>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: 'Госуслуги Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: appState.isDark ? ThemeMode.dark : ThemeMode.light,
        home: ServicesPage(
          onNavigateToDetail: (service) {},
          onThemeToggle: appState.toggleTheme,
        ),
        routes: {
          '/appointments': (_) => UserAppointmentsPage(),
        },
      ),
    );
  }
}