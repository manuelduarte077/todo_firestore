import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber.shade200,
          radius: 25,
          child: const Icon(Icons.person_2_outlined),
        ),
        title: Text(
          'Hello, I\'m',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade400,
          ),
        ),
        subtitle: const Text(
          'Don Manuel',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.calendar),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.bell),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
