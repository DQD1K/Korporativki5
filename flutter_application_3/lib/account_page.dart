import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  bool _isRegistered = false;
  String _username = '';
  String _password = '';
  String _nickname = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isRegistered = true;
        _username = _usernameController.text;
        _password = _passwordController.text;
        _nickname = _nicknameController.text;
      });
    }
  }

  Widget _buildRegistrationForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'Логин'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите логин';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Пароль'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите пароль';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _nicknameController,
            decoration: const InputDecoration(labelText: 'Ник'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите ник';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Зарегистрироваться'),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Логин: $_username'),
        Text('Ник: $_nickname'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isRegistered = false;
              _usernameController.clear();
              _passwordController.clear();
              _nicknameController.clear();
            });
          },
          child: const Text('Изменить данные'),
        ),
      ],
    );
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аккаунт'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isRegistered ? _buildAccountDetails() : _buildRegistrationForm(),
      ),
    );
  }
}

