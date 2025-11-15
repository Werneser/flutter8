// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppState, Store {
  late final _$isDarkAtom = Atom(name: '_AppState.isDark', context: context);

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  late final _$userNameAtom = Atom(
    name: '_AppState.userName',
    context: context,
  );

  @override
  String? get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String? value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$bookedServiceIdsAtom = Atom(
    name: '_AppState.bookedServiceIds',
    context: context,
  );

  @override
  ObservableList<String> get bookedServiceIds {
    _$bookedServiceIdsAtom.reportRead();
    return super.bookedServiceIds;
  }

  @override
  set bookedServiceIds(ObservableList<String> value) {
    _$bookedServiceIdsAtom.reportWrite(value, super.bookedServiceIds, () {
      super.bookedServiceIds = value;
    });
  }

  late final _$completedRequestsAtom = Atom(
    name: '_AppState.completedRequests',
    context: context,
  );

  @override
  ObservableList<CompletedRequest> get completedRequests {
    _$completedRequestsAtom.reportRead();
    return super.completedRequests;
  }

  @override
  set completedRequests(ObservableList<CompletedRequest> value) {
    _$completedRequestsAtom.reportWrite(value, super.completedRequests, () {
      super.completedRequests = value;
    });
  }

  late final _$_AppStateActionController = ActionController(
    name: '_AppState',
    context: context,
  );

  @override
  void setName(String name) {
    final _$actionInfo = _$_AppStateActionController.startAction(
      name: '_AppState.setName',
    );
    try {
      return super.setName(name);
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTheme() {
    final _$actionInfo = _$_AppStateActionController.startAction(
      name: '_AppState.toggleTheme',
    );
    try {
      return super.toggleTheme();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void bookService(String serviceId) {
    final _$actionInfo = _$_AppStateActionController.startAction(
      name: '_AppState.bookService',
    );
    try {
      return super.bookService(serviceId);
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAppointments(List<String> ids) {
    final _$actionInfo = _$_AppStateActionController.startAction(
      name: '_AppState.setAppointments',
    );
    try {
      return super.setAppointments(ids);
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCompletedRequest(CompletedRequest req) {
    final _$actionInfo = _$_AppStateActionController.startAction(
      name: '_AppState.addCompletedRequest',
    );
    try {
      return super.addCompletedRequest(req);
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDark: ${isDark},
userName: ${userName},
bookedServiceIds: ${bookedServiceIds},
completedRequests: ${completedRequests}
    ''';
  }
}
