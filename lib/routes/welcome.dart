import 'package:flutter/material.dart';
import 'package:projedeneme/utils/styles.dart';
import 'package:projedeneme/utils/colors.dart';
import 'package:projedeneme/utils/dimension.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,),
            Center(
              child: Padding(
                padding: Dimen.regularPadding,
                child: RichText(
                  text: TextSpan(
                    text: "Welcome to ",
                    style: kCountLabel,
                    children: <TextSpan>[
                      TextSpan(
                        text: "SuBuddyCar",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0QEQ1LwTlS1XjTqiTszS7onqfH6qNvbnw4w&usqp=CAU'),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),

              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Signup',
                          style: kCountLabel,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ),
                  ),

                  SizedBox(width: 8.0,),

                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Login',
                          style: kCountLabel,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Text(
              'Sign up with',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: buttonPressed, child: Text('Facebook')
            ),
            SizedBox(height: 15,),
            ElevatedButton.icon(onPressed: buttonPressed, icon: Icon(Icons.mail), label: Text('Gmail')
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[600],
    );
  }
  void buttonPressed() {
    print('Button tapped');
  }
}
