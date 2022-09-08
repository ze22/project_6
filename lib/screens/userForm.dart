import 'package:flutter/material.dart';
import '../providers/register_employees.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class userForm extends StatefulWidget {
  const userForm({super.key});

  @override
  State<userForm> createState() => _userFormState();
}

class _userFormState extends State<userForm> {
  String name = "", occ = "", reg = "", add = "", educ = "", se = "";
  late employee _usertoday;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'Please provide a value.';
              }
              return null;
            },
            onSaved: (value) {
              name = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Occupation'),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'Please provide a value.';
              }
              return null;
            },
            onSaved: (value) {
              occ = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Region'),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'Please provide a value.';
              }
              return null;
            },
            onSaved: (value) {
              reg = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Address'),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'Please provide a value.';
              }
              return null;
            },
            onSaved: (value) {
              add = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Education'),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'Please provide a value.';
              }
              return null;
            },
            onSaved: (value) {
              educ = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Sex'),
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'Please provide a value.';
              }
              return null;
            },
            onSaved: (value) {
              se = value!;
            },
          ),
          ElevatedButton(
              onPressed: () {
                _usertoday = employee(
                    address: add,
                    education: educ,
                    fullname: name,
                    occupation: occ,
                    region: reg,
                    sex: se);
                final url = Uri.https("");
                http.post(url,
                    body: json.encode({
                      'fullname': _usertoday.fullname,
                      'occupation': _usertoday.occupation,
                      'region': _usertoday.region,
                      'address': _usertoday.address,
                      'education': _usertoday.education,
                      'sex': _usertoday.sex
                    }));
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
