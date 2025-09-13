import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A widget that displays three overlapping, rotated, and blurred image cards.
///
/// This creates a "fan" effect with a central image card flanked by two
/// angled cards, closely matching the provided UI image.
class ImageStack extends StatelessWidget {
  const ImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    // Constants for styling to easily tweak the appearance.
    // These values have been tuned to match the reference image.
    const double cardWidth = 180.0;
    const double cardHeight = 240.0;
    const double borderRadius = 12.0;
    const double rotationAngle = 0.25; // in radians (~14 degrees)
    const double blurSigma = 5.0;

    return Center(
      // SizedBox constrains the Stack's size, preventing it from
      // taking up more space than needed and helping with layout.
      child: SizedBox(
        width: 350.w,
        height: 270.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Left Card
            // Uses Transform.translate to move it horizontally and vertically,
            // and Transform.rotate to angle it.
            Transform.translate(
              offset: const Offset(-45, 10),
              child: Transform.rotate(
                angle: -rotationAngle,
                child: _buildImageCard(
                  width: cardWidth.w,
                  height: cardHeight.h,
                  borderRadius: borderRadius.r,
                  blurSigma: blurSigma,
                  // Placeholder image URL
                  imageUrl: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?fit=crop&w=300&h=400',
                ),
              ),
            ),

            // Right Card
            // Same transforms as the left card, but with positive values
            // to place it on the opposite side.
            Transform.translate(
              offset: const Offset(45, 10),
              child: Transform.rotate(
                angle: rotationAngle,
                child: _buildImageCard(
                  width: cardWidth.w,
                  height: cardHeight.h,
                  borderRadius: borderRadius.r,
                  blurSigma: blurSigma,
                  // Placeholder image URL
                  imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?fit=crop&w=300&h=400',
                ),
              ),
            ),

            // Center Card (On Top)
            // This is the last child in the Stack, so it will be drawn on top
            // of the others. It's translated slightly up for a better visual hierarchy.
            Transform.translate(
              offset: const Offset(0, -5),
              child: _buildImageCard(
                width: cardWidth.w,
                height: cardHeight.r,
                borderRadius: borderRadius.r,
                blurSigma: blurSigma,
                // Placeholder image URL
                imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?fit=crop&w=300&h=400',
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// A helper method to build a single styled image card, avoiding code repetition.
  Widget _buildImageCard({
    required double width,
    required double height,
    required double borderRadius,
    required double blurSigma,
    required String imageUrl,
  }) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        boxShadow: [
          // A subtle shadow to give the cards depth and make them pop.
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1.r,
            blurRadius: 10.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      // ClipRRect ensures the image inside respects the container's rounded corners.
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius.r),
        // ImageFiltered applies the blur effect to its child.
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover, // Ensures the image covers the entire card area.
            // A loading builder provides visual feedback while the image is downloading.
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            // An error builder displays an icon if the image fails to load.
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image, color: Colors.grey),
              );
            },
          ),
        ),
      ),
    );
  }
}
