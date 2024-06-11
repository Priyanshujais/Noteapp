import 'package:flutter/material.dart';
import 'ui.helper.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(radius: 25,
              backgroundImage: AssetImage('assets/images/img.png'),
            ),
            SizedBox(width: 10),
            Text(
              'Hi, Priyanshu',
              style: TextStyle(fontSize: 26, color: Colors.white,fontWeight: FontWeight.bold),
            ),
            Spacer(), // This will push the drawer icon to the right
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: Colors.black87.withOpacity(0.9), // Replace with your desired background color
              ),
              child: IconButton(
                icon: Icon(Icons.menu_sharp, size: 34, color: Colors.white),
                onPressed: () {
                  // Handle drawer open
                },
              ),
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
                style: TextStyle(fontSize: 60, color: Colors.white,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  uihelper.CustomContainer(50, 120, "All"),
                  uihelper.CustomContainer(50, 120, "Important"),
                  uihelper.CustomContainer(50, 120, "bookmarked"),
          
          
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  uihelper.CustomBigContainer(300, screenWidth/2.2, Colors.greenAccent),
                  SizedBox(width: 10,),
                  uihelper.CustomBigContainer(300, screenWidth/2.2, Colors.blueAccent),
          
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: uihelper.CustomBigContainer(200, screenWidth/1.1, Colors.red)
              ),
              SizedBox(height: 20),
              Center(
                  child: uihelper.CustomBigContainer(200, screenWidth/1.1, Colors.red)
              ), SizedBox(height: 20),
              Center(
                  child: uihelper.CustomBigContainer(200, screenWidth/1.1, Colors.red)
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add note
        },
        child: Icon(Icons.add),shape: CircleBorder(),backgroundColor: Colors.black,
      ),
    );
  }




}
