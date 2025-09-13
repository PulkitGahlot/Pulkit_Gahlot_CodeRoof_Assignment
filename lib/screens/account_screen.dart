import 'package:coderoofs_flutter_internship_assignment/screens/edit_profile.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text(
          "Account",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen()
                )
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff5e1153),
              foregroundColor: Colors.white,
            ), 
            child: Text(
              "Edit Profile"
            )
          ),
        )
      ),
    );
  }
}