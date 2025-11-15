import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../shared/locator.dart';
import '../models/service_item.dart';
import '../../shared/stores/app_state.dart';

class ServiceDetailPage extends StatefulWidget {
  final ServiceItem service;

  ServiceDetailPage({required this.service});

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _phone = '';
  String _email = '';
  String _comment = '';

  final AppState appState = GetIt.instance<AppState>();

 final TextEditingController _nameController = TextEditingController(
    text: GetIt.instance<AppState>().userName ?? '',
  );

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      appState.setName(_name);
      final now = DateTime.now();
      final req = CompletedRequest(
        id: '${widget.service.id}_${now.millisecondsSinceEpoch}',
        serviceId: widget.service.id,
        name: _name,
        phone: _phone,
        email: _email,
        comment: _comment,
        dateSubmitted: now,
      );
      appState.addCompletedRequest(req);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Заявка отправлена: $_name')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.service.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              widget.service.description,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Заполните анкету для услуги',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Имя',
                      hintText: 'Например, Иван Иванов',
                    ),
                    validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Пожалуйста, введите имя' : null,
                    onSaved: (value) => _name = value!.trim(),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Контактный телефон',
                      hintText: '+7 900 000 0000',
                    ),
                    onSaved: (value) => _phone = value?.trim() ?? '',
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Электронная почта',
                      hintText: 'example@mail.ru',
                    ),
                    onSaved: (value) => _email = value?.trim() ?? '',
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Комментарий к заявке',
                      hintText: 'Доп. сведения',
                    ),
                    maxLines: 3,
                    onSaved: (value) => _comment = value?.trim() ?? '',
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: _saveForm, child: const Text('Отправить заявку')),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (_) {
                final existingName = appState.userName;
                if (existingName != null) {
                  return Text('Имя: $existingName', style: TextStyle(color: Colors.green[700]));
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}