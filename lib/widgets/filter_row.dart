import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: const [
          // Filters Button
          FilterChipWidget(
            icon: Icons.tune,
            label: "Filters",
            isSelected: true,
          ),

          // Dropdowns
          DropdownChipWidget(
            label: "Age",
            items: ["18-25", "26-35", "36-50", "50+"],
          ),
          DropdownChipWidget(
            label: "Height",
            items: ["< 5'5", "5'5 - 6'0", "6'0+"],
          ),
          DropdownChipWidget(
            label: "Habits",
            items: ["Smoking", "Drinking", "Fitness"],
          ),
        ],
      ),
    );
  }
}

/// 🔹 Simple rounded button with icon (like Filters)
class FilterChipWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton.icon(
        onPressed: () {
          // TODO: Add filter logic
        },
        icon: Icon(icon, size: 18, color: Color(0xFFb40141)),
        label: Text(label, style: const TextStyle(color: Color(0xFFb40141))),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isSelected ? Color(0xffb40141).withOpacity(0.1) : Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
      ),
    );
  }
}

/// 🔹 Dropdown styled like a pill
class DropdownChipWidget extends StatelessWidget {
  final String label;
  final List<String> items;

  const DropdownChipWidget({
    super.key,
    required this.label,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(label, style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16.sp)),
            icon: const Icon(Icons.arrow_drop_down),
            dropdownColor: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12.r),
            items: items
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (val) {
              // TODO: Add logic for $label filter
            },
          ),
        ),
      ),
    );
  }
}
