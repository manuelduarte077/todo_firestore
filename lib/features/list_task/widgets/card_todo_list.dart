import 'package:flutter/material.dart';

class CardTodoListWidget extends StatelessWidget {
  const CardTodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            decoration: BoxDecoration(
              color: Colors.blue.shade800,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),

          /// Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      'Design Meeting',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Discuss about new design',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: Colors.blue.shade800,
                        shape: const CircleBorder(),
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                  ),

                  /// Button Content
                  Transform.translate(
                    offset: const Offset(0, -12),
                    child: Column(
                      children: [
                        Divider(
                          thickness: 1.5,
                          color: Colors.grey.shade200,
                        ),
                        const Row(
                          children: [
                            Text('Today'),
                            SizedBox(width: 10),
                            Text('09:15 PM - 11:45 PM')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
