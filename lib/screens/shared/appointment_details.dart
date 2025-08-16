import 'package:flutter/material.dart';

class AppointmentDetails extends StatelessWidget {
  final String appointmentId;
  const AppointmentDetails({super.key, required this.appointmentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointment $appointmentId')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _InfoRow(label: 'GN Office', value: 'Homagama GN'),
          _InfoRow(label: 'Date', value: '2025-08-18'),
          _InfoRow(label: 'Time', value: '10:00 AM'),
          _InfoRow(label: 'Purpose', value: 'NIC renewal'),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
                child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Reschedule'))),
            const SizedBox(width: 12),
            Expanded(
                child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.cancel),
                    label: const Text('Cancel'))),
          ]),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
                width: 140,
                child: Text(label,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600))),
            Expanded(child: Text(value)),
          ],
        ),
      ),
    );
  }
}
