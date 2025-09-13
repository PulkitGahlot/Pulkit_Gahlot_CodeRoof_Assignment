import 'package:coderoofs_flutter_internship_assignment/screens/account_screen.dart';
import 'package:coderoofs_flutter_internship_assignment/screens/blind_mixer.dart';
import 'package:coderoofs_flutter_internship_assignment/screens/home_screen.dart';
import 'package:coderoofs_flutter_internship_assignment/screens/mixer_sub_screen.dart';
import 'package:coderoofs_flutter_internship_assignment/screens/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';





class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}


class _BottomNavigation extends State<BottomNavigation>{
  int _selectedIndex = 0;
  List <Widget> screens = const [
    HomeScreen(),
    MixerSubScreen(),
    SubscriptionScreen(),
    BlindMixerScreen(),
    AccountScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        // The decoration is what creates the shadow
        decoration: BoxDecoration(
          color: Colors.white, // Or your nav bar's background color
          boxShadow: [
            BoxShadow(
              // A larger blurRadius creates a softer, more faded shadow
              blurRadius: 20.r,
              color: Colors.black.withOpacity(.1),
              // The negative dy value pushes the shadow upwards
              offset: const Offset(0, -10),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          child: GNav(
            
            duration: Duration(milliseconds: 400),
            selectedIndex: _selectedIndex,
            tabBackgroundColor: Color(0xFFb40141).withOpacity(0.1),
            activeColor: Color(0xFFb40141),
            gap: 8,
            padding: const EdgeInsets.all(16),
            onTabChange: (index) => {
              setState(() {
                _selectedIndex = index;
              }),
            },
            tabs: [
              GButton(
                leading: SvgPicture.asset(
                  "assets/icons/nav_bar/mixer_home.svg",
                  width: 24.w,
                  height: 24.h,
                ),
                icon: Icons.home_outlined,
                iconColor: Colors.transparent,
              ),
              GButton(
                leading: SvgPicture.asset(
                  "assets/icons/mixer_icon.svg",
                  fit: BoxFit.cover,
                  color: Colors.black,
                  width: 24.w,
                  height: 24.h,
                ),
                icon: Icons.heart_broken,
                iconColor: Colors.transparent,
              ),
              GButton(
                leading: SvgPicture.asset(
                  "assets/icons/nav_bar/mixer_shop.svg",
                  fit: BoxFit.cover,
                  width: 32.w,
                  height: 32.h,
                  color: Colors.black,
                ),
                icon: Icons.visibility_outlined,
                iconColor: Colors.transparent,
              ),
              GButton(
                icon: Icons.visibility_outlined,
                iconColor: Colors.black,
              ),
              GButton(
                leading: SvgPicture.asset(
                  "assets/icons/nav_bar/account_icon.svg",
                  width: 28.w,
                  fit: BoxFit.cover,
                  height: 28.h,
                ),
                icon: Icons.person_outline,
                iconColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}