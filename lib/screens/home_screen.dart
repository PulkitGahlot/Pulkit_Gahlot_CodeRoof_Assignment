import 'package:coderoofs_flutter_internship_assignment/screens/subscription_screen.dart';
import 'package:coderoofs_flutter_internship_assignment/widgets/filter_row.dart';
import 'package:coderoofs_flutter_internship_assignment/widgets/image_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Mixer",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: (){}, 
                  icon: SvgPicture.asset(
                    "assets/icons/power_up_icon.svg",
                    fit: BoxFit.cover,
                    width: 26.w,
                    height: 26.h,
                  ),
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: SvgPicture.asset(
                    "assets/icons/notification_icon.svg",
                    fit: BoxFit.cover,
                    width: 26.w,
                    height: 26.h, 
                  ),
                )
              ],
            ), 
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FilterRow(),
          SizedBox(
            height: 90.h,
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Column(
              children: [
                ImageStack(),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  "You've hit your 25 daily swipes",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Go Premium to unlock more swipes and meet more people",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SubscriptionScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFB500C6), Color(0xFFE53935)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/mixer_icon.svg",
                          color: Colors.white.withOpacity(0.7),
                          width: 24.h,
                          height: 24.h,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "Subscribe to see likes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ), 
          )
        ],
      ),
    );
  }
}