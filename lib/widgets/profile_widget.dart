import 'package:flutter/material.dart';
 

 class ProfileWidget extends StatelessWidget {
   final bool isEdit;
   final String imagePath;
   final VoidCallback onClicked; 

  const ProfileWidget({Key? key,
      required this.imagePath,
      required this.onClicked,
      this.isEdit = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Colorc = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children:[
           buildImage(),
           Positioned(
             bottom: 0,
             right: 4,
             child: buildEditIcon(Color(0xff07526A))),
        ],
      ),
    );
  }
  Widget buildImage() {
    final image  = imagePath;
     
     return ClipOval(
       child: Material(
         color: Colors.transparent,
         child: Ink.image(
           image : AssetImage("assets/test.png"),
           fit: BoxFit.cover,
           width: 128,
           height: 128,
           child: InkWell(onTap: onClicked),
         
         ),
       ),
     );

  }
  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all:8,
      child: Icon(
        isEdit ? Icons.add_a_photo : Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}