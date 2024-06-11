import 'package:flutter/material.dart';
import '../../Widgets/ui.helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: Colors.black,
          elevation: 0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/img.png'),
              ),
              SizedBox(width: 10),
              Center(
                child: Text(
                  'Hi, Priyanshu',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "mukta",
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.menu, size: 25, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  // Handle logout action here
                  Navigator.pop(context); // Close the drawer
                  // Implement your logout logic, e.g., navigate to login screen
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'My Notes',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.black,
                    fontFamily: "mukta",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    uihelper.CustomContainer(
                      height: 50,
                      width: 120,
                      text: "All",
                      color: Colors.redAccent,
                      textColor: Colors.white,
                    ),
                    uihelper.CustomContainer(
                      height: 50,
                      width: 120,
                      text: "Important",
                      color: Colors.orangeAccent,
                      textColor: Colors.white,
                    ),
                    uihelper.CustomContainer(
                      height: 50,
                      width: 120,
                      text: "Bookmarked",
                      color: Colors.yellowAccent,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    uihelper.CustomBigContainer(
                      height: 300,
                      width: screenWidth / 2.2,
                      color: Colors.greenAccent,
                      shadowColor: Colors.green,
                    ),
                    SizedBox(width: 10),
                    uihelper.CustomBigContainer(
                      height: 300,
                      width: screenWidth / 2.2,
                      color: Colors.blueAccent,
                      shadowColor: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: uihelper.CustomBigContainer(
                    height: 200,
                    width: screenWidth / 1.1,
                    color: Colors.redAccent,
                    shadowColor: Colors.red,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: uihelper.CustomBigContainer(
                    height: 200,
                    width: screenWidth / 1.1,
                    color: Colors.redAccent,
                    shadowColor: Colors.red,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: uihelper.CustomBigContainer(
                    height: 200,
                    width: screenWidth / 1.1,
                    color: Colors.redAccent,
                    shadowColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Handle add note
          },
          child: Icon(Icons.add),
          shape: CircleBorder(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
