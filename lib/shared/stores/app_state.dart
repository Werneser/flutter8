import 'package:mobx/mobx.dart';
import '../../shared/locator.dart';

part 'app_state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  @observable
  bool isDark = false;

  @observable
  String? userName;

  @observable
  ObservableList<String> bookedServiceIds = ObservableList<String>();

  @observable
  ObservableList<CompletedRequest> completedRequests = ObservableList<CompletedRequest>();

  @action
  void setName(String name) {
    userName = name;
  }

  @action
  void toggleTheme() {
    isDark = !isDark;
  }

  @action
  void bookService(String serviceId) {
    if (!bookedServiceIds.contains(serviceId)) {
      bookedServiceIds.add(serviceId);
    }
  }

  @action
  void setAppointments(List<String> ids) {
    bookedServiceIds = ObservableList<String>.of(ids);
  }

  @action
  void addCompletedRequest(CompletedRequest req) {
    completedRequests.add(req);
  }
}