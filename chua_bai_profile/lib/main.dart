import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),

          // user
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 30),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 100,
                  width: 100,
                  decoration:
                      // BoxDecoration(borderRadius: BorderRadius.circular(50)),
                      const BoxDecoration(shape: BoxShape.circle),
                  child: Image.network(
                      "https://scontent.fhan12-1.fna.fbcdn.net/v/t39.30808-1/291988260_2195803410569861_3435265310130132741_n.jpg?stp=dst-jpg_p320x320&_nc_cat=102&ccb=1-7&_nc_sid=7206a8&_nc_ohc=aUy8ct_G4csAX9CHXnQ&_nc_ht=scontent.fhan12-1.fna&oh=00_AfDRdQWJ7CJ65TsRh93KyqYYGsw93dgRCOZ5-2hGRCXAtg&oe=641F0DDD"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hoang Phuong",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("0999 999 999")
                  ],
                )
              ],
            ),
          ),

          // List
          Expanded(
              child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomItem(),
                  CustomItem(),
                  CustomItem(),
                  CustomItem()
                ]),
          )),
        ],
      )),
    );
  }

  Row CustomItem() {
    
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(8)),
          child: const Icon(Icons.camera_outdoor_sharp),
        ),

        // title
        const Expanded(child: Text("My Account")),

        // icon right
        const Icon(Icons.chevron_right)
      ],
    );
  }
}
