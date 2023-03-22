import 'package:flutter/material.dart';

class ProfileUserPage extends StatelessWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            // header
            Header(),
            // user profile
            User(),
            // options
            UserOptions(),
            // Loggout Button
            LogoutButton()
          ],
        ),
      ),
    );
  }
}

class UserOptions extends StatelessWidget {
  const UserOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomListTile(
              leadingColor: Colors.blue,
              iconLeading: Icons.calendar_today_outlined,
              title: "My Account"),
          CustomListTile(
              leadingColor: Colors.pink,
              iconLeading: Icons.location_on_outlined,
              title: "Address"),
          CustomListTile(
              leadingColor: Colors.orange,
              iconLeading: Icons.settings_outlined,
              title: "Setting"),
          CustomListTile(
              leadingColor: Colors.pink,
              iconLeading: Icons.question_mark,
              title: "Help Center"),
          CustomListTile(
              leadingColor: Colors.blue,
              iconLeading: Icons.phone_outlined,
              title: "Contact"),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData iconLeading;
  final String title;
  final Color leadingColor;

  CustomListTile(
      {required this.iconLeading,
      required this.leadingColor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: leadingColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          iconLeading,
          color: Colors.white,
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Edit Profile",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class User extends StatelessWidget {
  const User({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
                "https://scontent.fhan19-1.fna.fbcdn.net/v/t39.30808-6/291988260_2195803410569861_3435265310130132741_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=SkZxww6D9xsAX-ISj3T&_nc_ht=scontent.fhan19-1.fna&oh=00_AfAawtjBmBZ9esg1k6paTpAiyNlTn_eix0dUsdOER0aBkg&oe=641B111F",
                width: 100,
                height: 100,
                fit: BoxFit.cover),
          ),

          // name and phone number
          Container(
            margin: const EdgeInsets.only(left: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hoang Phuong",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "0999 099 099",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[200]),
          onPressed: () {
            // Add your logout logic here
          },
          child: const Text(
            'Logout',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
