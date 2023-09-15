import 'package:flutter/material.dart';
import 'package:todo_firestore/constants/constants.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.valueText,
  });

  final String title;
  final IconData icon;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.headingOne,
          ),

          /// Date
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(width: 12),
                Text(valueText),
              ],
            ),
          )
        ],
      ),
    );
  }
}
