import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_guide/utils/user_preferences.dart';
import 'package:flutter_guide/widgets/customized_textfield.dart';
import 'package:flutter_guide/widgets/customize_button.dart';
import 'package:flutter_guide/widgets/profile_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../model/user.dart';
import '../widgets/textfield_Widget.dart';

class RegisterationForm extends StatefulWidget {
  const RegisterationForm({Key? key}) : super(key: key);

  @override
  State<RegisterationForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterationForm> {
  // final TextEditingController _fullnameController = TextEditingController();
  //  TextEditingController _dateController = TextEditingController();
  // final      TextEditingController _adddressController = TextEditingController();
  late User user;

  @override
  void initState()  {
    super.initState();

    user = userPreferences.getUser();
  }
  
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
            onClicked: () async {
              final image = await ImagePicker()
                .getImage(source: ImageSource.gallery);


                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage =
                        await File(image.path).copy(imageFile.path);

                    setState(() => user = user.copy(imagePath: newImage.path));
            }
            ),


            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged:(name) => user = user.copy(name: name),
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Occupation',
              text: user.occupation,
              onChanged: (occupation) => user = user.copy(name: occupation),
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Region',
              text: user.region,
              onChanged: (region) => user = user.copy(name: region),
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Address',
              text: user.address,
              onChanged: (address)=> user = user.copy(name: address),
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Education',
              text: user.education,
            maxLines:4,
              onChanged: (Education) => user = user.copy(name:Education),
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              label: 'Sex',
              text: user.sex,
            // maxLines:2,
              onChanged: (sex) => user = user.copy(name: sex),
            ),
            SizedBox(height: 20),
            CustomizedButton(
              buttonText: "Register",
              buttonColor: const Color(0xff07526A),
              textcolor: Colors.white,
              onPressed: () {
                userPreferences.setUser(user);
                Navigator.of(context).pop();
              },
            ),


        ],
      ),

    );
  }
}