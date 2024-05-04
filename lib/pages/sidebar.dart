import 'package:flutter/material.dart';
class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildListTile(context, 'Users', Icons.person, '/users'),
            _buildListTile(context, 'Organizations', Icons.business, '/organizations'),
            _buildListTile(context, 'Leaves', Icons.assignment, '/leaves'),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, IconData icon, String route) {
    bool isSelected = ModalRoute.of(context)?.settings.name == route;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : null,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : null,
          ),
        ),
        onTap: () {
          Navigator.pop(context); // Close the drawer
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
