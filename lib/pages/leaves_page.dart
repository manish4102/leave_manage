import 'package:flutter/material.dart';
import 'package:leave_manage/pages/sidebar.dart';

class LeavesPage extends StatefulWidget {
  const LeavesPage({Key? key}) : super(key: key);

  @override
  State<LeavesPage> createState() => _LeavesPageState();
}

class _LeavesPageState extends State<LeavesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaves Page'),
      ),
      body: Row(
            children: [
              Sidebar(), // Sidebar always visible
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container for Requests
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white, // Added background color
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Requests', style: TextStyle(fontSize: 18)),
                              Row(
                                children: [
                                  _buildSquareButton('Pending'),
                                  SizedBox(width: 10),
                                  _buildSquareButton('Accepted'),
                                  SizedBox(width: 10),
                                  _buildSquareButton('Rejected'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // Containers for Leave Details
                        Column(
                          children: [
                            Row(
                              children: [
                                _buildLeaveDetailsContainer(),
                                SizedBox(width: 20),
                                _buildLeaveDetailsContainer(),
                                SizedBox(width: 20),
                                _buildLeaveDetailsContainer(),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                _buildLeaveDetailsContainer(),
                                SizedBox(width: 20),
                                _buildLeaveDetailsContainer(),
                                SizedBox(width: 20),
                                _buildLeaveDetailsContainer(),
                              ],
                            ),
                            // Add more rows as needed
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }

  Widget _buildSquareButton(String text) {
    return Container(
      width: 70,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white, // Added background color
        border: Border.all(color: Colors.black)
      ),
      child: Center(child: Text(text)),
    );
  }

 Widget _buildLeaveDetailsContainer() {
  bool isAccepted = false; // Change this based on your logic
  bool isRejected = false; // Change this based on your logic

  // Define a variable to hold the status text
  String statusText = 'Awaited';

  // Update the status text based on the state of isAccepted and isRejected
  if (isAccepted) {
    statusText = 'Accepted';
  } else if (isRejected) {
    statusText = 'Rejected';
  }

  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white, // Background color removed
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sick Leave', // Replace with dynamic value
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isAccepted
                        ? const Color.fromARGB(255, 200, 230, 201)
                        : isRejected
                            ? const Color.fromARGB(255, 255, 205, 210)
                            : const Color.fromARGB(255, 200, 230, 201),
                    border: Border.all(
                      color: isAccepted
                          ? Colors.green
                          : isRejected
                              ? Colors.red
                              : Colors.green,
                    ),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: isAccepted
                          ? Colors.green
                          : isRejected
                              ? Colors.red
                              : const Color.fromARGB(255, 247, 184, 13),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Applied Date: 2024-05-05', // Replace with dynamic value
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'User: John Doe', // Replace with dynamic value
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Description: Feeling unwell', // Replace with dynamic value
              ),
            ),
            SizedBox(height: 10),
            DataTable(
              dividerThickness: 0,
              columns: [
                DataColumn(
                  label: Text(
                    'From', // Replace with dynamic value
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'To', // Replace with dynamic value
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text(
                      'Start Date', // Replace with dynamic value
                    )),
                    DataCell(Text(
                      'End Date', // Replace with dynamic value
                    )),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAccepted = true;
                      isRejected = false;
                    });
                    // Accept leave logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Accept',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAccepted = false;
                      isRejected = true;
                    });
                    // Reject leave logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Reject',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}


}
