import 'package:auth_api/models/user.dart';
import 'package:auth_api/services/http_request.dart';
import 'package:auth_api/services/login_request.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

final box = GetStorage();

class _DashboardState extends State<Dashboard> {
  late Future<UserModel> user;
  late LoginRequest request;

  @override
  void initState() {
    super.initState();
    user = HttpRequest().getUser();
    request = LoginRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          FutureBuilder<UserModel>(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text('Nama Pengguna: ${snapshot.data?.name}');
                }
              }),
          ElevatedButton(
              onPressed: () {
                request.logout().then((value) {
                  setState(() {
                    box.remove('token');
                    Navigator.pushNamed(context, '/login');
                  });
                });
              },
              child: const Text("Logout"))
        ],
      )),
    );
  }
}
