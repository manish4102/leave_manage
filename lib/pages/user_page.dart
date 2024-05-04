import 'package:flutter/material.dart';
import 'package:leave_manage/pages/sidebar.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Users Page'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selectedUser = null;
          });
        },
        child: Row(
          children: [
            Sidebar(),
            Expanded(
              child: ListView(
                children: [
                  // List of users
                  _buildUserTile('John Doe', 'ABC Organization', '92%'),
                  _buildUserTile('Jane Smith', 'XYZ Organization', '85%'),
                  _buildUserTile('Alex Johnson', 'PQR Organization', '78%'),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: selectedUser != null
          ? ConstrainedBox(
              constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width * 0.25),
              child: Drawer(
                child: UserDetailsDrawer(name: selectedUser!, organization: 'Organization', attendance: selectedUser == 'John Doe' ? '92%' : selectedUser == 'Jane Smith' ? '85%' : '78%'),
              ),
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddUserDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildUserTile(String name, String organization, String attendance) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedUser = name;
        });
        _scaffoldKey.currentState?.openEndDrawer();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selectedUser == name ? Colors.deepPurple : Colors.white, width: 2),
          color: selectedUser == name ? Colors.deepPurple[100] : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          title: Text(name),
          subtitle: Text(organization),
        ),
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add User'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Organization'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Attendance'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add user logic here
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class UserDetailsDrawer extends StatelessWidget {
  final String name;
  final String organization;
  final String attendance;

  const UserDetailsDrawer({
    Key? key,
    required this.name,
    required this.organization,
    required this.attendance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
          ),
          child: Text(
            'User Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Name: $name'),
        ),
        ListTile(
          title: Text('Organization: $organization'),
        ),
        ListTile(
          title: Text('Attendance: $attendance'),
        ),
        // Add more user details here
      ],
    );
  }
}
