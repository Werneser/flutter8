import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../shared/locator.dart';
import '../models/service_item.dart';
import 'service_detail_page.dart';

class ServicesPage extends StatefulWidget {
  final void Function() onThemeToggle;

  final void Function(ServiceItem)? onNavigateToDetail;

  ServicesPage({required this.onThemeToggle, this.onNavigateToDetail});

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<ServiceItem> _services = [
    ServiceItem(
      id: 'doctor_appointment',
      title: 'Запись к врачу',
      description: 'Выбор даты, времени приема и консультация врача.',
    ),
    ServiceItem(
      id: 'driving_license',
      title: 'Получение водительского удостоверения',
      description: 'Запись на экзамен, сбор документов, расписание.',
    ),
    ServiceItem(
      id: 'driver_education',
      title: 'Обучение и сдача теории',
      description: 'Онлайн-курсы, расписание занятий и экзамены.',
    ),
    ServiceItem(
      id: 'passport_rights',
      title: 'Получение паспорта/прав',
      description: 'Пошаговая подача, необходимые документы.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final appState = GetIt.instance<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Услуги'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: widget.onThemeToggle,
            tooltip: 'Сменить тему',
          ),
          IconButton(
            icon: Icon(Icons.list_alt),
            onPressed: () {
              // переход к списку записанных услуг
              Navigator.of(context).pushNamed('/appointments');
            },
            tooltip: 'Мои записи',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _services.length,
        itemBuilder: (context, index) {
          final s = _services[index];
          final isBooked = appState.bookedServiceIds.contains(s.id);

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(s.title),
              subtitle: Text(s.description),
              trailing: isBooked ? Icon(Icons.check, color: Colors.green) : Icon(Icons.arrow_forward),
              onTap: () {
                // Переход на детальную страницу услуги
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ServiceDetailPage(service: s)),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/appointments');
        },
        child: Icon(Icons.list),
        tooltip: 'Мои записи',
      ),
    );
  }
}