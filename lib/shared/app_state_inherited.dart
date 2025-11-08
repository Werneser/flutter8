import 'package:flutter/widgets.dart';

class FormStateData {
  String name;
  String email;
  // другие поля

  FormStateData({required this.name, required this.email});

  FormStateData copyWith({String? name, String? email}) {
    return FormStateData(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  bool isDifferent(FormStateData other) =>
      name != other.name || email != other.email;
}

class AppStateData {
  final FormStateData initial;
  FormStateData _current;

  AppStateData({required this.initial}) : _current = initial;

  FormStateData get current => _current;

  void update(FormStateData next) {
    _current = next;
  }

  // можно добавить удобные сеттеры по каждому полю
  void setName(String v) {
    final next = _current.copyWith(name: v);
    _current = next;
  }

  void setEmail(String v) {
    final next = _current.copyWith(email: v);
    _current = next;
  }
}

class AppStateInherited extends InheritedWidget {
  final AppStateData data;

  AppStateInherited({required this.data, required Widget child}) : super(child: child);

  static AppStateData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppStateInherited>();
    assert(widget != null, 'AppStateInherited not found in context');
    return widget!.data;
  }

  @override
  bool updateShouldNotify(AppStateInherited oldWidget) {
    // уведомляем только если данные изменились
    return oldWidget.data.current.isDifferent(data.current);
  }
}