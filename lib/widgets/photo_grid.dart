import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:permission_handler/permission_handler.dart'; 

/// A widget that displays a grid of user photos with functionality
/// to add and remove images.
class PhotoGridWidget extends StatefulWidget {
  const PhotoGridWidget({super.key});

  @override
  State<PhotoGridWidget> createState() => _PhotoGridWidgetState();
}

class _PhotoGridWidgetState extends State<PhotoGridWidget> {
  // A list to hold the image URLs.
  // In a real app, this would come from a user profile or state management.
  final List<dynamic> _imageUrls = [
    'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?fit=crop&w=500&h=600',
    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?fit=crop&w=500&h=600',
    'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?fit=crop&w=500&h=600',
    'https://images.unsplash.com/photo-1488161628813-04466f872d24?fit=crop&w=500&h=600',
    'https://images.unsplash.com/photo-1521119989659-a83eee488004?fit=crop&w=500&h=600',
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?fit=crop&w=500&h=600',
  ];

  final ImagePicker _picker = ImagePicker();

  void _removeImage(int index) {
    setState(() {
      _imageUrls.removeAt(index);
    });
  }

  void _addImage() {
    // In a real app, this would open an image picker.
    // Here, we just add a placeholder image for demonstration.
     if (_imageUrls.length < 6) {
      _showImageSourceActionSheet(context);
    } else {
      // Optional: Show a message if the user tries to add more than 6 photos
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can only add up to 6 photos.')),
      );
    }
  }

  /// Picks an image from the specified source (camera or gallery).
  Future<void> _pickImage(ImageSource source) async {
    PermissionStatus status;

    // 1. Determine which permission to request
    if (source == ImageSource.camera) {
      status = await Permission.camera.request();
    } else {
      status = await Permission.photos.request();
    }
    if(!context.mounted){
      return;
    }
    // 2. Check the permission status
    if (status.isGranted) {
      // Permission is granted.
      try {
        final XFile? pickedFile = await _picker.pickImage(source: source);
        if (pickedFile != null) {
          setState(() {
            _imageUrls.add(File(pickedFile.path));
          });
        }
      } catch (e) {
        // Handle any potential errors from the image picker
        // print("Error picking image: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to pick image. Please try again.')),
        );
      }
    } else if (status.isDenied) {
      // Permission is denied.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission was denied. Please enable it in settings.')),
      );
    } else if (status.isPermanentlyDenied) {
      // Permission is permanently denied. Open app settings to enable it.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Permission permanently denied. Go to settings to enable it.'),
          action: SnackBarAction(
            label: 'Settings',
            onPressed: openAppSettings,
          ),
        ),
      );
    }
  }

  /// NEW: Shows a modal bottom sheet to choose the image source.

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a Photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75, // Adjust this for desired image aspect ratio
      ),
      itemCount: _imageUrls.length < 6 ? _imageUrls.length + 1 : 6,
      itemBuilder: (context, index) {
        if (index < _imageUrls.length) {
          // Display the image card
          return _buildImageCard(index, _imageUrls[index]);
        } else {
          // Display the "Add Photo" placeholder
          return _buildAddPhotoPlaceholder();
        }
      },
    );
  }

  /// Builds the card for an individual image with the 'Main' tag and remove button.
  Widget _buildImageCard(int index, dynamic imageUrl) {
    bool isMain = index == 0;
     ImageProvider imageProvider;
    if (imageUrl is String) {
      // It's a network imageUrl
      imageProvider = NetworkImage(imageUrl);
    } else if (imageUrl is File) {
      // It's a local file imageUrl
      imageProvider = FileImage(imageUrl);
    } else {
      // Fallback for unexpected types
      imageProvider = const AssetImage('assets/placeholder.png'); // Add a placeholder asset
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Stack(
        // Use Stack to overlay the 'Main' tag and the remove button
        children: [
          // The Image itself
          Positioned.fill(
            child: Image(
              image: imageProvider,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
          // The 'Main' tag, only for the first image
          if (isMain)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Main',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          // The remove button
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => _removeImage(index),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the placeholder for adding a new photo.
  Widget _buildAddPhotoPlaceholder() {
    return GestureDetector(
      onTap: _addImage,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          // BorderType: BorderType.RRect,
          radius: const Radius.circular(12),
          color: Colors.grey.shade400,
          strokeWidth: 1.5,
          dashPattern: const [6, 4],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.grey.shade500,
                  size: 32,
                ),
                const SizedBox(height: 8),
                Text(
                  'Add Photo',
                  style: TextStyle(color: Colors.grey.shade600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
