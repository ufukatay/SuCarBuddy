import 'package:flutter/material.dart';
import 'package:projedeneme/model/post.dart';
import 'package:projedeneme/services/auth.dart';
import 'package:projedeneme/services/db.dart';
import 'package:projedeneme/utils/colors.dart';
import 'package:projedeneme/utils/styles.dart';
import 'package:projedeneme/widget/post_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class ExplorePage extends StatefulWidget {

  @override
  _ExplorePageState createState() => _ExplorePageState();
}


class _ExplorePageState extends State<ExplorePage>  {
  List<Post> myPosts = [
    Post(text: 'Sabanci to Kadiköy \nCreated by Arda', date: '5.01.2022', likeCount: 10, commentCount: 5),


  ];
  int count = 0;
  AuthService auth = AuthService();
  DBService db = DBService();
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


  @override
  Widget build(BuildContext context) {
    //db.addUser('name', 'surname', 'mail', 'token');
    //db.addUserAutoID('nameAuto', 'surnameAuto', 'mail@auto', 'token');


    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Explore-Page", style: kDefaultLabel,),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.yellow,
        centerTitle: true,
        elevation: 0.0,

      ),
      body:PageView(
        children: [
          SingleChildScrollView(
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
                            Navigator.pushNamed(context,'/explore_page2');
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: myPosts.map(
                              (post) =>
                              PostTile(
                                post: post,
                                delete: () {
                                  setState(() {
                                    myPosts.remove(post);
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
