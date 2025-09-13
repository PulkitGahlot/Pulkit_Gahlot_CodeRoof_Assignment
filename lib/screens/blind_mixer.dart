import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlindMixerScreen extends StatelessWidget {
  const BlindMixerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to make the layout responsive
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Blind Mixer",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ // Pushes content down a bit from the app bar
              // TODO: Replace this container with your main illustration image
              SvgPicture.asset(
                "assets/blind_mixer_icon/blind_mixer.svg",
                height: (screenWidth * 0.55).w,
              ),
              SizedBox(
                height: 24.h,
              ),
              Divider(
                color: Color(0xFFb40141).withOpacity(0.1),
                thickness: 0.4,
              ),
              SizedBox(
                height: 20.h,
              ),
              // "Upcoming Blind Date" Title
              Text(
                "Upcoming Blind Date",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              // Subtitle text
              Text(
                "Let Mixer surprise you with a match.",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20.h),
              // The date chip widget
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFb40141).withOpacity(0.01),
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    width: 1,
                    color: Color(0xFFb40141).withOpacity(0.1),
                  )
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // To make the container wrap its content
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "September 28 - 10 PM",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Divider(
                color: Color(0xFFb40141).withOpacity(0.1),
                thickness: 0.4,
              ),
              SizedBox(
                height: 70.h,
              ),
              // The stepper-like text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sign Up", style: TextStyle(color: Color(0xff5e1153))),
                  _buildDot(),
                  const Text("Smart Match", style: TextStyle(color: Color(0xff5e1153))),
                  _buildDot(),
                  const Text("Blind Date", style: TextStyle(color: Color(0xff5e1153))),
                ],
              ),
              const SizedBox(height: 20),
              // The main call-to-action button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.description_outlined, color: Colors.white),
                  label: Text(
                    "Fill out the Form",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5e1153), // Deep purple color
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    elevation: 5,
                    shadowColor: const Color(0xFF5A1D5A).withOpacity(0.4),
                  ),
                ),
              ),
            ],
          ), 
        ),
      ),
    );
  }
}

// Helper widget to build the dots in the stepper text
Widget _buildDot() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      width: 5.w,
      height: 5.h,
      decoration: const BoxDecoration(
        color: Color(0xff5e1153),
        shape: BoxShape.circle,
      ),
    ),
  );
}