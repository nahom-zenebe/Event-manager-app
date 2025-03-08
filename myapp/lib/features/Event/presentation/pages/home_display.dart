import 'package:flutter/material.dart';
import './homepage.dart';
import './save_page.dart';

class HomeDisplay extends StatefulWidget {
  const HomeDisplay({super.key});

  @override
  State<HomeDisplay> createState() => _HomeDisplayState();
}

class _HomeDisplayState extends State<HomeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              currentAccountPicture: Image.asset(
                'assets/box.jpg',
              ),
              currentAccountPictureSize: Size(70, 70),
              accountName: Text("abebe"),
              accountEmail: Text("abebe@gmail.com"),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home, color: Colors.deepPurple),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SavePage()));
              },
              title: Text("Saved"),
              leading: Icon(
                Icons.save_alt_outlined,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("Add Event"),
              leading: Icon(
                Icons.add,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("Profile page"),
              leading: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("logout"),
              leading: Icon(
                Icons.logout,
                color: Colors.deepPurple,
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search the event",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: Homepage())
          ],
        ),
      ),
    );
  }
}
