import 'package:appscrip_task/model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text("User Full Details"),),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: ${user.name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Gap(10),
              Text("Email: ${user.email}", style: TextStyle(fontSize: 18)),
            Gap(10),
              Text("Address: ${user.street}, ${user.city},", style: TextStyle(fontSize: 18)),
              Gap(10),
              Text("Phone: ${user.phone}", style: TextStyle(fontSize: 18)),
              Gap(10),
              Text("Website: ${user.website}", style: TextStyle(fontSize: 18)),
            Gap(10),
              Text("Company: ${user.company}", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
