import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projedeneme/model/notification.dart';
import 'package:projedeneme/utils/user_preferences.dart';
import 'package:projedeneme/widget/appbar_widget.dart';
import 'package:projedeneme/widget/notification_tile.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    List<Notif> myNotif = [
      Notif(text: 'Arda join your trip', date: '5.01.2022'),
      Notif(text: 'Sergen comment your trip', date: '26.12.2021'),
      Notif(text: 'Irmak liked your trip', date: '30.12.2021'),
      Notif(text: 'Ufuk begin to follow you', date: '5.01.2022'),
      Notif(text: 'Ahmet join your trip', date: '26.12.2021'),
      Notif(text: 'Your trip capacity is full \n which created in 30.12.2021', date: '30.12.2021'),
    ];
    int count = 0;
    void buttonClicked() {
      setState(() {
        count++;
      });
      print('Button Clicked');
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();

      print('initState');
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: buildAppBar(context),
      body: PageView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 3,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: myNotif.map(
                              (notif) =>
                              NotifTile(
                                notif: notif,
                                delete: () {
                                  setState(() {
                                    myNotif.remove(notif);
                                  });
                                },)
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}