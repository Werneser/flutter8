import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<AppState>(() => AppState());

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

class AppState extends ChangeNotifier {
  bool _isDark = false;
  String? _userName;
  List<String> _bookedServiceIds = [];
  List<CompletedRequest> _completedRequests = [];

  bool get isDark => _isDark;
  String? get userName => _userName;
  List<String> get bookedServiceIds => List.unmodifiable(_bookedServiceIds);
  List<CompletedRequest> get completedRequests => List.unmodifiable(_completedRequests);

  void setName(String name) {
    _userName = name;
    notifyListeners();
  }

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void bookService(String serviceId) {
    if (!_bookedServiceIds.contains(serviceId)) {
      _bookedServiceIds.add(serviceId);
      notifyListeners();
    }
  }

  void setAppointments(List<String> ids) {
    _bookedServiceIds = List.from(ids);
    notifyListeners();
  }

  void addCompletedRequest(CompletedRequest req) {
    _completedRequests.add(req);
    notifyListeners();
  }
}