import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guide/screens/registeration%20_form.dart';
import 'package:flutter_guide/utils/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_guide/widgets/drawer.dart';

import '../model/user.dart';
import '../widgets/button_widget.dart';
import '../widgets/numbers_widget.dart';
import '../widgets/profile_widget.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    
    final user = userPreferences.getUser();

    return Scaffold(
    // (endDrawer: AppDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,

          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          
          // Drawer()
          // IconButton(
          //   icon: Icon(icon),
          //   color: Colors.black,
          //   onPressed: (){},
          // )
        ],
        // IconButton(
        //   icon: Icon(icon),
        //   onPressed: () {
            
        //   },
        //   )
        iconTheme:IconThemeData(color: Colors.black),
      ),
      endDrawer: AppDrawer(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked:() async{
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RegisterationForm()
                ),
              );

              setState(() {
                
              });
            },
          ),
          
          
          
          
          SizedBox(height: 18),
          buidName(user),
          SizedBox(height: 8),
          Center(child: buildEmployButton()),
          SizedBox(height: 20),
          NumbersWidget(),
          SizedBox(height: 20),
          buildcv(user),
          SizedBox(height: 20),
          buildRegion(user),
          SizedBox(height: 20),
          buildAddress(user),
          SizedBox(height: 20),
          buildEducation(user),
          SizedBox(height: 20),
          buildSex(user)
        ],
      ),
      );
  }


  Widget buidName(User user) => Column(
    children:[
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 24),
      ),
      SizedBox(height: 3),
      Text(
        user.occupation,
        
        ),
    ],
    );

    Widget buildEmployButton( ) => ButtonWidget(
      text: 'Employ',
      
      onClicked: (){}
    );

    Widget buildcv(User user) =>Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text('CV',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
         const SizedBox(height: 10),
              Text(
                user.cvpath,
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
      ]
),
    );

    Widget buildRegion(User user) =>Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text('Region',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
         const SizedBox(height: 10),
              Text(
                user.region,
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
      ]
),
    );
     Widget buildAddress(User user) =>Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text('Address',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
         const SizedBox(height: 10),
              Text(
                user.address,
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
      ]
),
    );
    
    Widget buildEducation(User user) =>Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text('Education',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
         const SizedBox(height: 10),
              Text(
                user.education,
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
      ]
),
    );


    Widget buildSex(User user) =>Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text('Sex',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
         const SizedBox(height: 10),
              Text(
                user.sex,
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
      ]
),
    );
}

