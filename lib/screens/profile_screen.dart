import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guide/utils/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_guide/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';
import '../widgets/button_widget.dart';
import '../widgets/numbers_widget.dart';
import '../widgets/profile_widget.dart';
import '../providers/register_employees.dart';

class ProfileScreen extends StatefulWidget {
  String name1;
  ProfileScreen({Key? key, required this.name1}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState(name1);
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name2 = "";
  _ProfileScreenState(this.name2);
  @override
  Widget build(BuildContext context) {
    final url = Uri.parse("https://shop-ed8d0-default-rtdb.firebaseio.com/employees.json");

    employee user = employee(
        address: "",
        education: "",
        fullname: "",
        occupation: "",
        region: "",
        sex: "");
    Future<void> show(user) async {
      final response = await http.get( url);
      final userPeople = json.decode(response.body) as Map<String, dynamic>;
      for (int i = 0; i < userPeople.length; i++) {
        if (userPeople['fullName'] == name2) {
          setState(() {
            user = employee(
                address: userPeople['address'],
                education: userPeople['education'],
                fullname: userPeople['fullname'],
                occupation: userPeople['occupation'],
                region: userPeople['region'],
                sex: userPeople['sex']);
          });
        }
      }
    }

    show(user);

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
        iconTheme: IconThemeData(color: Colors.black),
      ),
      endDrawer: AppDrawer(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
         // ProfileWidget(
         //   imagePath: user1.imagePath,
         //   onClicked: () async {},
         // ),
          SizedBox(height: 18),
          buidName(user),
          SizedBox(height: 8),
          Center(child: buildEmployButton()),
          SizedBox(height: 20),
          NumbersWidget(),
          SizedBox(height: 20),
        //  buildcv(user1),
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

  Widget buidName(employee user) => Column(
        children: [
          Text(
            user.fullname,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 3),
          Text(
            user.occupation,
          ),
        ],
      );

  Widget buildEmployButton() => ButtonWidget(text: 'Employ', onClicked: () {});

  Widget buildcv(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'CV',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            user.cvpath,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ]),
      );

  Widget buildRegion(employee user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Region',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            user.region,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ]),
      );
  Widget buildAddress(employee user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Address',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            user.address,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ]),
      );

  Widget buildEducation(employee user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Education',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            user.education,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ]),
      );

  Widget buildSex(employee user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Sex',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            user.sex,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ]),
      );
}
