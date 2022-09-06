import 'package:flutter/material.dart';
import 'package:password_blocks/model/utility.dart';
import 'package:password_blocks/view/main_menu.dart';
import 'dart:convert';

import 'package:password_blocks/view/widgets/userPassInfoCard.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const MainMenu(),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          title: const Center(child: Text('Block Pass')),
        ),
        body: FutureBuilder(
          future: fetchUserPasswords(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (_, index) {
                  return UserPassInfoCard(
                    data: data[index],
                  );
                },
                itemCount: data.length,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
