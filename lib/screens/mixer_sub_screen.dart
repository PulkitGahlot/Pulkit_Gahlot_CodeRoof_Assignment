import 'package:coderoofs_flutter_internship_assignment/widgets/continue_button.dart';
import 'package:coderoofs_flutter_internship_assignment/widgets/feature_list.dart';
import 'package:coderoofs_flutter_internship_assignment/widgets/subscription_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MixerSubScreen extends StatefulWidget {
  const MixerSubScreen({super.key});

  @override
  State<MixerSubScreen> createState() => _MixerSubScreenState();
}

class _MixerSubScreenState extends State<MixerSubScreen> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> plans = [
    {
      "title": "Mixer",
      "price": "\$24.99",
      "desc": "All of the below",
      "color": Color(0xFFb40141),
      "mixerIcon": "assets/icons/mixer_icon.svg",
      "features": [
        "Unlimited Likes",
        "See who liked you",
        "Find people with wide range",
        "Access to events"
      ],
    },
    {
      "title": "Mixer VIP",
      "price": "\$99.99",
      "desc": "All 3 + VIP seating, food, and beverages",
      "color": Color(0xffd49231),
      "mixerIcon": "assets/icons/mixer_vip_sub.svg",
      "features": [
        "Unlimited Likes",
        "See who liked you",
        "Find people with wide range",
        "Access to events",
        "VIP seating, food & beverages"
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final plan = plans[selectedIndex];
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Gradient Header
          Container(
            height: (size.height * 0.22).h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  plan["color"].withOpacity(0.2),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: kToolbarHeight - 10 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Mixer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  "Level Up Your Mixer Experience",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: plan["color"],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      
          // Subscription Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select a plan",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: List.generate(
                    plans.length,
                    (index) => Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedIndex = index),
                        child: SubscriptionCard(
                          title: plans[index]["title"],
                          price: plans[index]["price"],
                          desc: plans[index]["desc"],
                          mixerIcon: plans[index]["mixerIcon"],
                          isSelected: selectedIndex == index,
                          color: plans[index]["color"],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      
          // Features Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: FeatureList(
              features: plan["features"],
              color: plan["color"],
              title: "Included with ${plan["title"]}",
            ),
          ),
      
          const Spacer(),
      
          // Continue Button
          ContinueButton(
            color: plan["color"],
            price: plan["price"],
            title: plan["title"],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Text(
              "By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer’s Terms.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black54
              ),
            ),
          )
        ],
      ),
    );
  }
}
