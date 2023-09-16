import 'package:flutter/material.dart';
import 'package:todo_firestore/common/show_add_new_task.dart';
import 'package:todo_firestore/features/list_task/widgets/widgets.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const CustomAppBar(),
      body: const ListTaskScreen(),
    );
  }
}

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const HeaderListTask(),

            // Card List Task
            const SizedBox(height: 20),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CardTodoListWidget(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class HeaderListTask extends StatelessWidget {
  const HeaderListTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Tasks',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Friday, 16 May',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xffD5E8FA),
            foregroundColor: Colors.blue.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: const BorderSide(color: Colors.grey),
          ),
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            context: context,
            builder: (context) => const AddNewTask(),
          ),
          child: const Text(
            '+ New Task',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
