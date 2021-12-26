import 'package:flutter/material.dart';
import 'package:projedeneme/model/notification.dart';
import 'package:projedeneme/utils/colors.dart';
import 'package:projedeneme/utils/styles.dart';

class NotifTile extends StatelessWidget {

  final Notif notif;
  final VoidCallback delete;

  const NotifTile({required this.notif, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shadowColor: AppColors.primaryColor,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                notif.text,
                style: kCardTextLabel,
              ),
            ),

            Row(
              children: [
                Text(
                  notif.date,
                  style: kSubtitleLabel,
                ),

                Spacer(),

                SizedBox(width: 16,),

                IconButton(
                  onPressed: delete,
                  padding: EdgeInsets.all(0),
                  iconSize: 14,
                  splashRadius: 24,
                  color: Colors.red,
                  icon: Icon(
                    Icons.delete,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}