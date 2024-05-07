import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
List<Widget> screens = [
  ikkinchi(),
  // uchinchi(),
  // turtinchi(),
  // beshinchi(),
];
class ikkinchi extends StatelessWidget {
  const ikkinchi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blue,
//               Colors.red,
            ]
          )
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('6-amaliy ish'),
          backgroundColor: Color(0xFF6200EE ),
        ),
        body:
            // screens[currentIndex],

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("AI"),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatar.iran.liara.run/public/40"),
              radius: 65,
            ),

            SizedBox(height: 15),
            TextField(
              obscureText: true,
              controller: controller1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password kiriting",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Color(0xFF9e2a2b))
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF6200EE))
                  )
              ),
              ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String text = controller1.text;
                  controller2.text = "Password: $text ALERT!!! Parolingni har qanday joyga kiritmang";
                });
              },
              child: Text("Yuborish"),

            ),
            SizedBox(height: 12),
            TextField(
              // obscureText: true,
              controller: controller2,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Color(0xFF9e2a2b))
                  ),
                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFF6200EE))
                  )
              ),
            ),
          ],
        ),

        bottomNavigationBar:
        Theme(
          data: ThemeData(
            canvasColor: Color(0xFF1F1F1F),
          ),
          child: BottomNavigationBar(
          backgroundColor: Color(0xFF6200EE),
          fixedColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          iconSize: 27,

          currentIndex: currentIndex,
          onTap: (index){
            setState(() {
                currentIndex = index;
            });
          },
          type:
            BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white.withOpacity(0.4),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),

              label: "Home",
            ),
            BottomNavigationBarItem(
              // title : Text("Sevimlilar"),
              icon: Icon(Icons.favorite),
              label: "Sevimli",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: "Musiqalar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.place),
              label: "Joylashuv",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
            label: "Yangiliklar")
            ],
        ),
      ),
    )
    );
  }
}