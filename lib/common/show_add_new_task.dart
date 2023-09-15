import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_firestore/common/commons.dart';
import 'package:todo_firestore/constants/constants.dart';
import 'package:todo_firestore/features/list_task/widgets/widgets.dart';
import 'package:todo_firestore/provider/date_time_provider.dart';
import 'package:todo_firestore/provider/radio_provider.dart';

class AddNewTask extends ConsumerWidget {
  const AddNewTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final dateProv = ref.watch(dateProvider);

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
              Expanded(
                child: RadioWidget(
                  titleRadio: 'LRN',
                  categoryColor: Colors.green,
                  valueInput: 1,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: 'WORK',
                  categoryColor: Colors.blue.shade700,
                  valueInput: 2,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioWidget(
                  titleRadio: 'GEN',
                  categoryColor: Colors.amberAccent.shade700,
                  valueInput: 3,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 3),
                ),
              ),
            ],
          ),

          /// Date and Time
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                title: 'Date',
                icon: CupertinoIcons.calendar,
                valueText: dateProv,
                onTap: () async {
                  final getValue = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2025),
                  );

                  if (getValue != null) {
                    final format = DateFormat.yMd();

                    ref
                        .read(dateProvider.notifier)
                        .update((state) => format.format(getValue));
                  }
                },
              ),
              const SizedBox(width: 22),
              DateTimeWidget(
                  title: 'Time',
                  icon: CupertinoIcons.time,
                  valueText: ref.watch(timeProvider),
                  onTap: () async {
                    final getTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (getTime != null) {
                      ref
                          .read(timeProvider.notifier)
                          .update((state) => getTime.format(context));
                    }
                  })
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
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(width: 20),
              ButtonWidget(
                bgColor: Colors.blue.shade800,
                fgColor: Colors.white,
                title: 'Create',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
