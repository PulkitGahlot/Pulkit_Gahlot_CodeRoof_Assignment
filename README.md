# Mixer Flutter App

---

## Overview
Mixer is a modular, responsive Flutter-based dating app prototype featuring profile management, daily swipe limits with subscription upsell, blind date event flow, and tab-based navigation. The project focuses on polished UI, reusable components, and smooth user interactions optimized for multiple device sizes using responsive design principles.

---

## Features

- Responsive UI built with `flutter_screenutil` for adaptive layout  
- Smooth tab navigation using `google_nav_bar` with scalable SVG icons  
- Home screen with filter chips, layered swipe preview cards, and subscription prompts  
- Subscription screens including auto-scrolling avatar lists and selectable plan cards  
- Edit Profile screen supporting photo upload with runtime permission checks  
- Blind Mixer event screen with SVG illustrations, stepper design, and date chips  
- Reusable widgets for settings lists, buttons, feature lists, and dropdown filters  
- Organized asset management with categorized SVG icons for crisp rendering  

---

## Project Structure

```
assets
|
|--blind_mixer_icon
|  |
|  |--blind_mixer.svg
|
|--edit_profile_icons
|  |
|  |--about_me_icon.svg
|  |
|  |--birthday_icon.svg
|  |
|  |--drinking_icon.svg
|  |
|  |--ethinicity_icon.svg
|  |
|  |--gender_icon.svg
|  |
|  |--height_icon.svg
|  |
|  |--hobbies_icon.svg
|  |
|  |--interested_in_icon.svg
|  |
|  |--kids_icon.svg
|  |
|  |--lifetyle_icon.svg
|  |
|  |--looking_for_icon.svg
|  |
|  |--marijuana_icon.svg
|  |
|  |--political_views_icon.svg
|  |
|  |--relationship_icon.svg
|  |
|  |--religious_beliefs_icon.svg
|  |
|  |--smoking_icon.svg
|
|--icons
|  |
|  |--mixer_icon.svg
|  |
|  |--mixer_vip_icon.svg
|  |
|  |--notification_icon.svg
|  |
|  |--power_up_icon.svg
|  |
|  |--nav_bar
|  |  |
|  |  |--account_icon.svg
|  |  |
|  |  |--mixer_home.svg
|  |  |
|  |  |--mixer_shop.svg
|
|--lib
|  |
|  |--main.dart
|  |
|  |--screens
|  |  |
|  |  |--account_screen.dart
|  |  |
|  |  |--blind_mixer.dart
|  |  |
|  |  |--edit_profile.dart
|  |  |
|  |  |--home_screen.dart
|  |  |
|  |  |--mixer_sub_screen.dart
|  |  |
|  |  |--subscription_screen.dart
|  |
|  |--widgets
|  |  |
|  |  |--bottom_nav_bar.dart
|  |  |
|  |  |--continue_button.dart
|  |  |
|  |  |--edit_profile_list.dart
|  |  |
|  |  |--feature_list.dart
|  |  |
|  |  |--filter_row.dart
|  |  |
|  |  |--image_stack.dart
|  |  |
|  |  |--photo_grid.dart
|  |  |
|  |  |--subscription_card.dart  
```

---

## Getting Started

### Prerequisites
- Flutter SDK (version compatible with null safety)  
- Dart SDK  
- IDE like VS Code or Android Studio  

### Installation

1. Clone the repository:

```sh
git clone https://github.com/PulkitGahlot/Pulkit_Gahlot_CodeRoof_Assignment.git
cd Pulkit_Gahlot_CodeRoof_Assignment
```

2. Get dependencies:

```sh
flutter pub get
```

3. Run the application:

```sh
flutter run
```

---

## Libraries and Packages Used

| Package             | Purpose                               |
|---------------------|---------------------------------------|
| flutter_screenutil  | Responsive UI scaling for widgets     |
| flutter_svg         | SVG vector icon rendering             |
| google_nav_bar      | Animated bottom navigation bar        |
| image_picker        | Access device camera/gallery          |
| permission_handler  | Manage app permissions safely         |
| dotted_border       | Dashed border styling for placeholders|

---

## Known Limitations

- Current implementation uses mock static data for profiles and subscriptions.  
- Filtering and profile field navigation logic are placeholder implementations.  
- No backend connectivity or persistent storage yet.

---

## Challenges & Solutions

| Challenge                             | Solution                                                                                   |
|---------------------------------------|--------------------------------------------------------------------------------------------|
| Consistent UI on different devices    | Used `flutter_screenutil` for adaptive widget sizing and scaling across all screens        |
| Complex blurred and rotated cards     | Leveraged Flutter's `Stack`, `Transform`, and `ImageFiltered` for layered blur effects     |
| Runtime permissions for image pick    | Added `permission_handler` package with user feedback for permission denial or settings    |
| Infinite auto-scrolling carousel      | Implemented cyclic scrolling using a `Timer` to update `ScrollController` offset           |
| Maintaining visual design consistency | Created reusable widgets with parameterized colors and styles for maintainability          |

---

## Screenshots

<img width="389" height="820" alt="Screenshot 2025-09-13 231703" src="https://github.com/user-attachments/assets/7adb7734-c196-4749-9095-6ecffc33a467" />  <img width="390" height="838" alt="Screenshot 2025-09-13 231738" src="https://github.com/user-attachments/assets/b39403cd-1ad1-481d-b838-8bb023f8af2b" />

<img width="386" height="837" alt="Screenshot 2025-09-13 231943" src="https://github.com/user-attachments/assets/836dc85e-2314-4f51-8fcc-db4175047793" />  <img width="382" height="835" alt="Screenshot 2025-09-13 231834" src="https://github.com/user-attachments/assets/f314a5da-fb37-434d-b0d7-0f45ec04294d" />

---

## Download the app

[Mixer App](https://clikn.in/c1uyQY8)

---

## 👨‍💻 Author

Hi, I'm **Pulkit Gahlot**.

“A good hacker is the one who breaks systems, to build secure ones.”

Feel free to connect!
- **Linkedin**: [Pulkit Gahlot](https://linkedin.com/in/pulkit-gahlot)
- **X**: [Pulkit_Gahlot_](https://x.com/Pulkit_Gahlot_)
- **GitHub**: [PulkitGahlot](https://github.com/PulkitGahlot)
- **E-Mail**: [pulkitgahlot85@gmail.com](pulkitgahlot85@gmail.com)



Thank you for checking out Mixer! For issues or feature requests, please open a GitHub issue or pull request.

