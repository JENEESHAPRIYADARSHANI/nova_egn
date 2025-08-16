import 'package:flutter/material.dart';

class CitizenHome extends StatelessWidget {
  final VoidCallback onBookTap;
  final VoidCallback onListTap;
  final VoidCallback onStaffSwitch;
  const CitizenHome(
      {super.key,
      required this.onBookTap,
      required this.onListTap,
      required this.onStaffSwitch});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('eGN — Citizen'),
        actions: [
          IconButton(
              onPressed: onStaffSwitch,
              icon: const Icon(Icons.admin_panel_settings)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(children: [
            Expanded(
                child: _HeroCard(
                    title: 'Book Appointment',
                    icon: Icons.add_circle,
                    color: cs.primary,
                    onTap: onBookTap)),
            Expanded(
                child: _HeroCard(
                    title: 'My Appointments',
                    icon: Icons.event_note,
                    color: cs.tertiary,
                    onTap: onListTap)),
          ]),
          const SizedBox(height: 12),
          Text('Nearby GN Offices',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Wrap(spacing: 12, runSpacing: 12, children: const [
            _OfficeTile(
                name: 'Homagama GN',
                address: 'Main Rd, Homagama',
                distance: '1.2 km'),
            _OfficeTile(
                name: 'Kottawa GN',
                address: 'High Level Rd, Kottawa',
                distance: '4.3 km'),
            _OfficeTile(
                name: 'Maharagama GN',
                address: 'Town Hall, Maharagama',
                distance: '6.0 km'),
          ]),
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const _HeroCard(
      {required this.title,
      required this.icon,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundColor: color.withOpacity(.15),
                  child: Icon(icon, color: color)),
              const SizedBox(width: 12),
              Expanded(
                  child: Text(title,
                      style: Theme.of(context).textTheme.titleMedium)),
              const Icon(Icons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }
}

class _OfficeTile extends StatelessWidget {
  final String name;
  final String address;
  final String distance;
  const _OfficeTile(
      {required this.name, required this.address, required this.distance});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            Row(children: [
              const Icon(Icons.location_on, size: 16),
              const SizedBox(width: 4),
              Expanded(child: Text(address))
            ]),
            const SizedBox(height: 6),
            Row(children: [
              const Icon(Icons.near_me, size: 16),
              const SizedBox(width: 4),
              Text(distance)
            ])
          ]),
        ),
      ),
    );
  }
}
