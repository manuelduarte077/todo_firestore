import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_firestore/common/commons.dart';
import 'package:todo_firestore/constants/constants.dart';
import 'package:todo_firestore/features/list_task/widgets/widgets.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.70,
      width: size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Add New Task',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade200,
          ),

          /// Form
          const Text(
            'Task Name',
            style: AppStyle.headingOne,
          ),
          const TextFielWidget(
            hintText: 'Enter task name',
          ),
          const SizedBox(height: 20),
          const Text(
            'Description',
            style: AppStyle.headingOne,
          ),
          const TextFielWidget(
            hintText: 'Enter description',
            maxLines: 3,
          ),

          /// Category
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: RadioWidget(
                  titleRadio: 'LRN',
                  categoryColor: Colors.green,
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: 'WORK',
                  categoryColor: Colors.blue.shade700,
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: 'GEN',
                  categoryColor: Colors.amberAccent.shade700,
                ),
              ),
            ],
          ),

          /// Date and Time
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                title: 'Date',
                icon: CupertinoIcons.calendar,
                valueText: '12/12/2021',
              ),
              SizedBox(width: 22),
              DateTimeWidget(
                title: 'Time',
                icon: CupertinoIcons.time,
                valueText: '12:00 PM',
              )
            ],
          ),

          /// Button
          const SizedBox(height: 40),
          Row(
            children: [
              ButtonWidget(
                bgColor: Colors.white,
                fgColor: Colors.blue.shade800,
                title: 'Cancel',
              ),
              const SizedBox(width: 20),
              ButtonWidget(
                bgColor: Colors.blue.shade800,
                fgColor: Colors.white,
                title: 'Create',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
