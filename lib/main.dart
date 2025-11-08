import 'package:flutter/material.dart';
import 'package:flutter8/user_services/screens/user_appointments_page.dart';
import 'shared/app_theme.dart';
import 'services/screens/services_page.dart';

void main() {
  runApp(MyApp());
}

class CompletedRequest {
  final String id;
  final String serviceId;
  final String name;
  final String phone;
  final String email;
  final String comment;
  final DateTime dateSubmitted;

  CompletedRequest({
    required this.id,
    required this.serviceId,
    required this.name,
    required this.phone,
    required this.email,
    required this.comment,
    required this.dateSubmitted,
  });
}

class UserDataInherited extends InheritedWidget {
  final String? userName;
  final List<String> bookedServiceIds;
  final List<CompletedRequest> completedRequests;
  final void Function(String) onNameChanged;
  final void Function(String) onBookService;
  final void Function(List<String>) onSetAppointments;
  final void Function(CompletedRequest) onAddCompletedRequest;

  const UserDataInherited({
    Key? key,
    required this.userName,
    required this.bookedServiceIds,
    required this.completedRequests,
    required this.onNameChanged,
    required this.onBookService,
    required this.onSetAppointments,
    required this.onAddCompletedRequest,
    required Widget child,
  }) : super(key: key, child: child);

  static UserDataInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserDataInherited>();
  }

  @override
  bool updateShouldNotify(UserDataInherited oldWidget) {
    return oldWidget.userName != userName ||
        oldWidget.bookedServiceIds != bookedServiceIds ||
        oldWidget.completedRequests != completedRequests;
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _dark = false;
  String? _userName;
  List<String> _bookedServiceIds = [];
  List<CompletedRequest> _completedRequests = [];

  void _setName(String name) {
    setState(() => _userName = name);
  }

  void _toggleTheme() {
    setState(() => _dark = !_dark);
  }

  void _bookService(String serviceId) {
    setState(() {
      if (!_bookedServiceIds.contains(serviceId)) {
        _bookedServiceIds.add(serviceId);
      }
    });
  }

  void _setAppointments(List<String> ids) {
    setState(() => _bookedServiceIds = List.from(ids));
  }

  void _addCompletedRequest(CompletedRequest req) {
    setState(() => _completedRequests.add(req));
  }

  @override
  Widget build(BuildContext context) {
    return UserDataInherited(
      userName: _userName,
      bookedServiceIds: _bookedServiceIds,
      completedRequests: _completedRequests,
      onNameChanged: _setName,
      onBookService: _bookService,
      onSetAppointments: _setAppointments,
      onAddCompletedRequest: _addCompletedRequest,
      child: MaterialApp(
        title: 'Госуслуги Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _dark ? ThemeMode.dark : ThemeMode.light,
        home: ServicesPage(
          onNavigateToDetail: (service) {
            // деталь будет открываться внутри ServicesPage
          },
          onThemeToggle: _toggleTheme,
        ),
        routes: {
          '/appointments': (_) => UserAppointmentsPage(),
        },
      ),
    );
  }
}