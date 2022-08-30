import 'package:flutter/material.dart';
import 'package:flutter_guide/widgets/customized_textfield.dart';

class RegisterationForm extends StatefulWidget {
  const RegisterationForm({Key? key}) : super(key: key);

  @override
  State<RegisterationForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterationForm> {
  final TextEditingController _fullnameController = TextEditingController();
   TextEditingController _dateController = TextEditingController();
  final      TextEditingController _adddressController = TextEditingController();
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
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/test.png"),
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white

                          ),
                          color: Colors.blue
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,)
                          
                      ),
                    )
                  ],
                ),
              ),
              
              const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("please uploade picture",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          // fontWeight: FontWeight.bold,
                          
                        )),
                  ),
                ),
                
              const SizedBox(height: 1,),
              
              CustomizedTextfield(
                  myController: _fullnameController,
                  hintText: "Enter fullname on identity card",
                  isPassword: false,
                  // prefixIcon: const Icon(Icons.mail, color: Colors.black),
                ),
                
              TextField(
                  // keyboardType: TextInputType.name,
                  controller: _dateController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today_rounded),
                    hintText: "select Date of Birth"),
                    onTap: ()async{
                      DateTime? pickeddate =await showDatePicker(
                        context: context,
                         initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101)
                          
                          );
                          // .then((value) {
                          //   setState(() {
                          //     _dateController = value!;
                          //   });
                          // },
                          // );

                          // if (pickeddate != null){
                          //   setState(() {
                          //     _dateController.text = DateFormat.('yyyy-MM-dd').format(pickeddate);
                          //   });
                          // }
                    },
                  
                ),
                CustomizedTextfield(myController: _adddressController,
                hintText: "Address",
                isPassword: false,
                )
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     DropdownButton(value: valueChoose,
                //     onChanged: (newValue){
                //       setState(() {
                //         valueChoose = newValue;
                //       });
                //     }
                //     )
                //   ],
                // )
                
            ],
          ),
        ),
      ),
      //  TextField(
      //   controller: _dateController,
      //   decoration: InputDecoration(
      //     icon: Icon(Icons.calendar_today_rounded),
      //     labelText: "Select Date of Birth"
      //   ),)
    );
  }
}