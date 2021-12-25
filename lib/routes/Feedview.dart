import 'package:flutter/material.dart';
import 'package:projedeneme/services/auth.dart';
import 'package:projedeneme/services/db.dart';
import 'package:projedeneme/utils/colors.dart';
import 'package:projedeneme/utils/styles.dart';



class FeedView extends StatelessWidget {

  AuthService auth = AuthService();
  DBService db = DBService();


    @override
    Widget build(BuildContext context) {
      db.addUser('name', 'surname', 'mail', 'token');
      db.addUserAutoID('nameAuto', 'surnameAuto', 'mail@auto', 'token');


      return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              auth.signOutFromGoogle();
            },
            icon: Icon(Icons.logout),
          ),
          title: Text("SEARCH BAR", style: kDefaultLabel,),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.yellow,
          centerTitle: true,
          elevation: 0.0,
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white),
                textTheme: TextTheme().apply(bodyColor: Colors.white),
              ),
              child: PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text('Profile-Page'),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text('Share'),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Search"),

                        )),
                    IconButton(
                        onPressed: () {
                          print("Button pressed");
                        },
                        icon: Icon(
                          Icons.search,
                          size: 40,
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 3,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),

      );

    }
  }
void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.pushNamed(context, '/profile_page');
      break;
    case 1:
      Navigator.pushNamed(context, '/profile_page');
      break;

  }
}
