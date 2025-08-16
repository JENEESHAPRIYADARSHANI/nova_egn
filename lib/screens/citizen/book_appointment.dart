import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  final void Function(String appointmentId) onSubmitted;
  const BookAppointmentScreen({super.key, required this.onSubmitted});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final _purpose = TextEditingController();
  final _date = TextEditingController();
  final _time = TextEditingController();
  String _office = 'Homagama GN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Appointment')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DropdownButtonFormField(
            value: _office,
            items: const [
              DropdownMenuItem(
                  value: 'Homagama GN', child: Text('Homagama GN')),
              DropdownMenuItem(value: 'Kottawa GN', child: Text('Kottawa GN')),
              DropdownMenuItem(
                  value: 'Maharagama GN', child: Text('Maharagama GN')),
            ],
            onChanged: (v) => setState(() => _office = v as String),
            decoration: const InputDecoration(labelText: 'GN Office'),
          ),
          const SizedBox(height: 12),
          TextField(
              controller: _purpose,
              decoration: const InputDecoration(
                  labelText: 'Purpose (e.g. NIC renewal)')),
          const SizedBox(height: 12),
          TextField(
              readOnly: true,
              controller: _date,
              decoration: const InputDecoration(
                  labelText: 'Date', suffixIcon: Icon(Icons.calendar_today)),
              onTap: _pickDate),
          const SizedBox(height: 12),
          TextField(
              readOnly: true,
              controller: _time,
              decoration: const InputDecoration(
                  labelText: 'Time Slot', suffixIcon: Icon(Icons.access_time)),
              onTap: _pickTime),
          const SizedBox(height: 20),
          FilledButton.icon(
            icon: const Icon(Icons.check_circle),
            onPressed: () {
              widget.onSubmitted('A-${DateTime.now().millisecondsSinceEpoch}');
            },
            label: const Text('Submit request'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
        context: context,
        firstDate: now,
        lastDate: now.add(const Duration(days: 60)),
        initialDate: now);
    if (date != null)
      _date.text =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _pickTime() async {
    final time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) _time.text = time.format(context);
  }
}
