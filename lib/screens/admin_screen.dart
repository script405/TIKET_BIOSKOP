import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('users');
    if (data != null) {
      setState(() {
        users = jsonDecode(data);
      });
    }
  }

  Future<void> deleteUser(int index) async {
    final prefs = await SharedPreferences.getInstance();
    users.removeAt(index);
    await prefs.setString('users', jsonEncode(users));
    loadUsers(); // refresh tampilan
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedInUser');
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Admin'),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body:
          users.isEmpty
              ? Center(child: Text('Tidak ada akun user.'))
              : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index]['username']),
                    subtitle: Text('Password: ${users[index]['password']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteUser(index),
                    ),
                  );
                },
              ),
    );
  }
}
