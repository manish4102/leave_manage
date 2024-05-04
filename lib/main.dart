import 'package:flutter/material.dart';
import 'package:leave_manage/pages/sidebar.dart';
import 'package:leave_manage/pages/user_page.dart';
import 'package:leave_manage/pages/organizations_page.dart';
import 'package:leave_manage/pages/leaves_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidebar Example',
      initialRoute: '/users',
      routes: {
        '/users': (context) => UsersPage(),
        '/organizations': (context) => OrganizationsPage(),
        '/leaves': (context) => LeavesPage(),
      },
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Sidebar Example'),
      //   ),
      //   //drawer: Sidebar(), // Include the sidebar here
      //   //body: UsersPage(), // Initial page
      // ),
    );
  }
}
