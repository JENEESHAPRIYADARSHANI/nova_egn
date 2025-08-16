import 'package:flutter/material.dart';

class StaffDashboard extends StatelessWidget {
  final void Function(String id) onOpen;
  final VoidCallback onBack;
  const StaffDashboard({super.key, required this.onOpen, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
        title: const Text('eGN — Staff Dashboard'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(spacing: 12, runSpacing: 12, children: const [
            _StatCard(title: 'Pending', value: '12', icon: Icons.hourglass_top),
            _StatCard(title: 'Approved', value: '34', icon: Icons.verified),
            _StatCard(title: 'Today', value: '9', icon: Icons.today),
          ]),
          const SizedBox(height: 12),
          Text('Today\'s Slots', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ...List.generate(
              8,
              (i) => _SlotTile(
                    time: '${9 + i}:00',
                    name: i.isEven ? 'K Perera' : 'S Fernando',
                    id: 'A-10$i',
                    onOpen: onOpen,
                  )),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const _StatCard(
      {required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(child: Icon(icon)),
              const SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: Theme.of(context).textTheme.labelLarge),
                Text(value,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class _SlotTile extends StatelessWidget {
  final String time;
  final String name;
  final String id;
  final void Function(String id) onOpen;
  const _SlotTile(
      {required this.time,
      required this.name,
      required this.id,
      required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(time)),
        title: Text(name),
        subtitle: Text('ID $id'),
        trailing: Wrap(spacing: 6, children: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.check_circle_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          IconButton(
              onPressed: () => onOpen(id), icon: const Icon(Icons.open_in_new)),
        ]),
      ),
    );
  }
}
