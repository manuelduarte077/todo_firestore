import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget(
      {super.key, required this.titleRadio, required this.categoryColor});

  final String titleRadio;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categoryColor),
        child: RadioListTile(
          contentPadding: EdgeInsets.zero,
          value: 1,
          groupValue: 0,
          onChanged: (value) {},
          title: Transform.translate(
            offset: const Offset(-22, 0),
            child: Text(
              titleRadio,
              style: TextStyle(
                color: categoryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
