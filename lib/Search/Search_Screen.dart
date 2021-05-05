
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thesisproject/Pages/ProfilePage.dart';
import 'Model_Search.dart';
import 'package:thesisproject/Utils/consts.dart';


class Search_Screen extends StatefulWidget {
  @override
  _Search_ScreenState createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  List<Posts> _list = [];
  List<Posts> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response =
    await http.get("http://127.0.0.1:8080/apibdaya/api/search"); //http.get("https://lifei.id/api/search/news");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Posts.formJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.description.contains(text) || f.title.toString().contains(text))
        _search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: korange,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: korange,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    style: TextStyle(fontFamily: 'nunito', fontWeight: FontWeight.w500,),
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search News?", border: InputBorder.none ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.clear();
                      onSearch('');
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
              ),
            ),
            loading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Expanded(
              child: _search.length != 0 || controller.text.isNotEmpty
                  ? ListView.builder(
                itemCount: _search.length,
                itemBuilder: (context, i) {
                  final b = _search[i];
                  return GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Profile();
                    }));},
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              b.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(b.description),
                          ],
                        )),
                  );
                },
              )
                  : ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, i) {
                  final a = _list[i];
                  return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            a.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(a.description),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}