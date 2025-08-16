import 'package:flutter/material.dart';

class AppointmentsList extends StatelessWidget {
  final void Function(String id) onOpen;
  const AppointmentsList({super.key, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
        6,
        (i) => _DummyAppointment(
            'A-000$i', 'Homagama GN', '2025-08-1${i}', i % 3));
    return Scaffold(
      appBar: AppBar(title: const Text('My Appointments')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          final a = items[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text('${a.office} — ${a.date}'),
              subtitle: Text(a.statusText),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => onOpen(a.id),
            ),
          );
        },
      ),
    );
  }
}

class _DummyAppointment {
  final String id;
  final String office;
  final String date;
  final int status; // 0 requested, 1 approved, 2 completed
  _DummyAppointment(this.id, this.office, this.date, this.status);
  String get statusText =>
      switch (status) { 0 => 'Requested', 1 => 'Approved', _ => 'Completed' };
}
