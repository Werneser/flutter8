import 'package:flutter8/shared/stores/app_state.dart';
import 'package:get_it/get_it.dart';
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