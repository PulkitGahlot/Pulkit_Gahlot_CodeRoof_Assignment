import 'package:coderoofs_flutter_internship_assignment/widgets/edit_profile_list.dart';
import 'package:coderoofs_flutter_internship_assignment/widgets/photo_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

   // Mock data for the list of settings
  final List<Map<String, dynamic>> settingsItems = const [
    {
      'icon': "assets/edit_profile_icons/about_me_icon.svg",
      'title': 'About Me (Bio)',
    },
    {
      'icon': "assets/edit_profile_icons/looking_for_icon.svg",
      'title': 'What are you looking for', 
    },
    {
      'icon': "assets/edit_profile_icons/gender_icon.svg",
      'title': 'Gender',
    },
    {
      'icon': "assets/edit_profile_icons/birthday_icon.svg",
      'title': 'Birthday (Age)',
    },
    {
      'icon': "assets/edit_profile_icons/height_icon.svg",
      'title': 'Height',
    },
    {
      'icon': "assets/edit_profile_icons/interested_in_icon.svg",
      'title': 'Interested in?',
    },
    {
      'icon': "assets/edit_profile_icons/gender_icon.svg",
      'title': 'Sexuality',
    },
    {
      'icon': "assets/edit_profile_icons/relationship_icon.svg",
      'title': 'Relationship',
    },
    {
      'icon': "assets/edit_profile_icons/ethinicity_icon.svg",
      'title': 'Ethnicity',
    },
    {
      'icon': "assets/edit_profile_icons/kids_icon.svg",
      'title': 'Kids',
    },
    {
      'icon': "assets/edit_profile_icons/drinking_icon.svg",
      'title': 'Drinking',
    },
    {
      'icon': "assets/edit_profile_icons/smoking_icon.svg",
      'title': 'Smoking',
    },
    {
      'icon': "assets/edit_profile_icons/marijuana_icon.svg",
      'title': 'Marijuana',
    },
    {
      'icon': "assets/edit_profile_icons/religious_beliefs_icon.svg",
      'title': 'Religioud Beliefs',
    },
    {
      'icon': "assets/edit_profile_icons/political_views_icon.svg",
      'title': 'Political Views',
    },
    {
      'icon': "assets/edit_profile_icons/hobbies_icon.svg",
      'title': 'Interests and Hobbies',
    },
    {
      'icon': "assets/edit_profile_icons/lifestyle_icon.svg",
      'title': 'Values and Lifestyle',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100.withOpacity(0.3),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.chevron_left_outlined,
          size: 36,
          ),
        ),
        title: Text(
          "Edit Profile"
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.visibility_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // This is the photo grid widget
              const PhotoGridWidget(),
              SizedBox(height: 24.h),
              Text(
                "Your details",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              // This builds the list of settings using the reusable tile
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: settingsItems.length,
                itemBuilder: (context, index) {
                  final item = settingsItems[index];
                  return ReusableListTile(
                    icon: item['icon'],
                    title: item['title'],
                    onTap: () {
                      // Handle navigation or action for this tile
                      // print('${item['title']} tapped');
                    },
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F6F9), // Very light lavender background
                  borderRadius: BorderRadius.circular(20.0.r),
                  border: Border.all(
                    color: const Color(0xFF5A1D5A).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    // Title
                    Text(
                      "Discover your Perfect Match",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Color(0xFF333333),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Overlapping profile pictures
                    SizedBox(
                      height: 64.h,
                      width: 150.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                        _buildProfileCircle(
                            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?fit=crop&w=100&h=100',
                            position: const RelativeRect.fromLTRB(0, 0, 80, 0),
                            size: 50,
                          ),
                          _buildProfileCircle(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?fit=crop&w=100&h=100',
                            position: const RelativeRect.fromLTRB(0, 0, 0, 0), // Centered
                            size: 60, // Center image is larger
                          ),
                          _buildProfileCircle(
                            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?fit=crop&w=100&h=100',
                            position: const RelativeRect.fromLTRB(80, 0, 0, 0),
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // "Take the quiz again" button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5A1D5A), // Deep purple
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        child: Text(
                          "Take the quiz again",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Helper to build the circular profile images with a white border.
Widget _buildProfileCircle(String imageUrl, {required RelativeRect position, required double size}) {
  return Positioned.fromRelativeRect(
    rect: position,
    child: CircleAvatar(
      radius: ((size / 2) + 2).r, // Outer circle for border
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: (size / 2).r, // Inner circle for image
        backgroundImage: NetworkImage(imageUrl),
      ),
    ),
  );
}