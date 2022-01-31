import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class DateTile extends StatelessWidget {

  DateTime data;
  int index;

  DateTile({Key? key, required this.data, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color corDataTile = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        //Visibility(visible: index != 0, child: const Divider()),
        ListTile(
          leading: Icon(
            Icons.calendar_today_outlined,
            color: corDataTile,
            size: 22,
          ),
          title: Text(
            Jiffy(data).format("dd/MM/yyyy"),
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w700, color: corDataTile),
          ),
        ),
      ],
    );
  }
}
