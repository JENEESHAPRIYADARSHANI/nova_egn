import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback onRegistered;
  const RegisterScreen({super.key, required this.onRegistered});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _nic = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Wrap(
                runSpacing: 12,
                spacing: 12,
                children: [
                  SizedBox(
                      width: 300,
                      child: TextField(
                          controller: _name,
                          decoration:
                              const InputDecoration(labelText: 'Full name'))),
                  SizedBox(
                      width: 300,
                      child: TextField(
                          controller: _nic,
                          decoration: const InputDecoration(labelText: 'NIC'))),
                  SizedBox(
                      width: 300,
                      child: TextField(
                          controller: _phone,
                          decoration: const InputDecoration(
                              labelText: 'Phone (+94...)'))),
                  SizedBox(
                      width: 300,
                      child: TextField(
                          controller: _email,
                          decoration:
                              const InputDecoration(labelText: 'Email'))),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password')),
              const SizedBox(height: 20),
              FilledButton.icon(
                icon: const Icon(Icons.verified_user),
                onPressed: _busy
                    ? null
                    : () async {
                        setState(() => _busy = true);
                        await Future.delayed(const Duration(milliseconds: 800));
                        if (mounted) widget.onRegistered();
                        setState(() => _busy = false);
                      },
                label: _busy
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Verify & Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
