import 'dart:async';
import 'package:coderoofs_flutter_internship_assignment/screens/mixer_sub_screen.dart';
import 'package:coderoofs_flutter_internship_assignment/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<String> images = [
    "https://randomuser.me/api/portraits/men/1.jpg",
    "https://randomuser.me/api/portraits/women/2.jpg",
    "https://randomuser.me/api/portraits/men/3.jpg",
    "https://randomuser.me/api/portraits/women/4.jpg",
    "https://randomuser.me/api/portraits/men/5.jpg",
    "https://randomuser.me/api/portraits/women/6.jpg",
    "https://randomuser.me/api/portraits/men/7.jpg",
    "https://randomuser.me/api/portraits/women/8.jpg",
  ];

  @override
  void initState() {
    super.initState();

    // Auto scroll horizontally
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double current = _scrollController.offset;
        double delta = 1.0; // scroll speed

        if (current + delta >= maxScroll) {
          _scrollController.jumpTo(0); // reset to start
        } else {
          _scrollController.jumpTo(current + delta);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double avatarSize = constraints.maxWidth * 0.22;
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          return Column(
            children: [
              SizedBox(height: kToolbarHeight - 24),

              // Infinite horizontal grid (3 rows)
              SizedBox(
                height: (screenHeight * 0.45).h,  // avatarSize * 3,
                child: Stack(
                  children: [
                    ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 1000, // simulate infinite
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (rowIndex) {
                            final image =
                                images[(index * 3 + rowIndex) % images.length];
                            return Container(
                              margin: EdgeInsets.all(constraints.maxWidth * 0.03),
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: (avatarSize / 2 - 6).r,
                                backgroundImage: NetworkImage(image),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: (screenWidth * 0.3).w,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.white,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: (screenWidth * 0.3).w,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.white,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              //Card section
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, vertical: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Mixer SVG Placeholder
                    SvgPicture.asset(
                      'assets/icons/mixer_icon.svg',
                      height: (screenHeight * 0.07).h,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Discover Without Limits",
                      style: TextStyle(
                        fontSize: (screenHeight * 0.022).sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Unlock everything Mixer offers, from premium features to VIP events",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: (screenHeight * 0.018).sp,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:  (constraints.maxHeight * 0.03).h),
              // Buttons
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1, vertical: 12),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MixerSubScreen(),
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
                                "Upgrade Now",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>
                              BottomNavigation(),
                            )
                          );
                        },
                        child: Text(
                          "Later",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),             
            ],
          );
        },
      ),
    );
  }
}