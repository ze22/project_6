import 'package:flutter/material.dart';
import 'package:flutter_guide/screens/registeration%20_form.dart';
import 'package:flutter_guide/widgets/customize_button.dart';



class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 48),
            buildMenuItem(
              text:'register as employee',
              icon: Icons.account_box_rounded,
            )
            // CustomizedButton(onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (_) => RegisterationForm()));
            //           },
            //           buttonText: "register as employee",
            //           textcolor: Colors.white,
            //           buttonColor: Color(0xff07526A),)
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
    required String text,
    required IconData icon,
  }){
    final color = Colors.white;

    return ListTile(
      leading: Icon(icon, color:color),
      title: Text(text,style: TextStyle(color:color)),
      onTap: (){
        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RegisterationForm()));
      },
    );
  }
}