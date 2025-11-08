import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../services/models/service_item.dart';
import '../../shared/locator.dart';

class UserAppointmentsPage extends StatelessWidget {
  final AppState appState = GetIt.instance<AppState>();

  UserAppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookedIds = appState.bookedServiceIds;
    final completed = appState.completedRequests;

    final List<CompletedRequest> bookedRequests = completed
        .where((req) => bookedIds.contains(req.serviceId))
        .toList();

    final List<CompletedRequest> displayRequests = bookedRequests.isNotEmpty
        ? bookedRequests
        : completed.isNotEmpty
        ? completed
        : <CompletedRequest>[];

    // Список всех доступных услуг (можно вынести в модель/поставщик данных)
    final List<ServiceItem> allServices = [
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

    return Scaffold(
      appBar: AppBar(title: Text('Мои записи')),
      body: displayRequests.isEmpty
          ? Center(
        child: Text(
          'У вас нет заполненных заявок для отображения.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: displayRequests.length,
        itemBuilder: (context, index) {
          final req = displayRequests[index];
          final service = allServices.firstWhere(
                (s) => s.id == req.serviceId,
            orElse: () => ServiceItem(
              id: req.serviceId,
              title: 'Неизвестная услуга',
              description: '',
            ),
          );

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(service.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Заявка от: ${req.name}'),
                  Text('Дата подачи: ${req.dateSubmitted.toLocal()}'
                      .split('.')
                      .first),
                  if (req.comment.isNotEmpty)
                    Text('Комментарий: ${req.comment}'),
                  Text(
                    'Контакт: ${req.phone.isNotEmpty ? req.phone : 'не указан'} • email: ${req.email.isNotEmpty ? req.email : 'не указан'}',
                  ),
                ],
              ),
              onTap: null, // без навигации внутри списка
            ),
          );
        },
      ),
    );
  }
}