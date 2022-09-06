import 'package:flutter/material.dart';
import 'package:flutter_guide/utils/user_preferences.dart';
import 'package:flutter_guide/widgets/customized_textfield.dart';
import 'package:flutter_guide/widgets/profile_widget.dart';

import '../model/user.dart';
import '../widgets/textfield_Widget.dart';

class RegisterationForm extends StatefulWidget {
  const RegisterationForm({Key? key}) : super(key: key);

  @override
  State<RegisterationForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterationForm> {
  final TextEditingController _fullnameController = TextEditingController();
   TextEditingController _dateController = TextEditingController();
  final      TextEditingController _adddressController = TextEditingController();
  User user = userPreferences.myUser;
  // late String valueChoose;
  // List listItem = [
  //   "Iteme 1", "Item 2", "Item 4","item 5"
  // ];
  // final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        // IconButton(
        //   icon: Icon(icon),
        //   onPressed: () {
            
        //   },
        //   )
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath, 
            isEdit: true,
            onClicked: () async {}
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged:(name){},
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Occupation',
              text: user.occupation,
              onChanged: (occupation) {},
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Region',
              text: user.region,
              onChanged: (region) {},
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Address',
              text: user.address,
              onChanged: (address) {},
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Education',
              text: user.education,
            maxLines:4,
              onChanged: (Education) {},
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Sex',
              text: user.sex,
            // maxLines:2,
              onChanged: (sex) {},
            )

        ],
      ),

    );
  }
}