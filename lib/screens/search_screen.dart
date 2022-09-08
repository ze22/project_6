import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class lookup extends StatefulWidget {
  const lookup({super.key});

  @override
  State<lookup> createState() => _lookupState();
}

class _lookupState extends State<lookup> with ChangeNotifier {
  bool _searchBoolean = false;
  List<int> _searchIndexList = [];
  final url = 'https://shop-ed8d0-default-rtdb.firebaseio.com/employee.json';
  Map<String, dynamic> _list = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: !_searchBoolean ? Text("Search") : _searchTextField(),
            actions: !_searchBoolean
                ? [
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            _searchBoolean = true;
                            _searchIndexList = [];
                          });
                        })
                  ]
                : [
                    IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchBoolean = false;
                          });
                        })
                  ]),
        body: !_searchBoolean ? _defaultListView() : _searchListView());
  }

  Widget _searchTextField() {
    return TextField(
      onChanged: (String s) async {
        final url = Uri.parse(
            'https://shop-ed8d0-default-rtdb.firebaseio.com/employees.json');
        final response = await http.get(url);

        final _list = json.decode(response.body) as Map<String, dynamic>;
        setState(() {
          _searchIndexList = [];
          for (int i = 0; i < _list.length; i++) {
            if (_list['Occupation'].contains(s) ||
                _list['fullName'].contains(s)) {
              _searchIndexList.add(i);
            }
          }
        });
      },
      autofocus: true,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _searchListView() {
    return ListView.builder(
        itemCount: _searchIndexList.length,
        itemBuilder: (context, index) {
          index = _searchIndexList[index];
          return Card(
              child: ListTile(
            title: Text(_list['fullname']),
            onTap: () {
              String inside = _list['fullname'];
              notifyListeners();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProfileScreen(name1: inside)));
            },
          ));
        });
  }

  Widget _defaultListView() {
    return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return Card(child: ListTile(title: Text(_list[index])));
        });
  }
}
