// ignore_for_file: avoid_web_libraries_in_flutter, avoid_print

import 'dart:convert';
import 'package:coba_berita/detail.dart';
import 'package:coba_berita/profile.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => MainPage(title: '',)));
          },
          icon: Icon(Icons.menu),
        ),
        title: const Text('News App'),
      ),
      body: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                color: Colors.grey[200],
                height: 100,
                width: 100,
                child: _posts[index]['urlToImage'] != null
                    ? Image.network(
                        _posts[index]['urlToImage'],
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : const Center(),
              ),
              title: Text(
                '${_posts[index]['title']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '${_posts[index]['description']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                Navigator.push(
                  // ignore: prefer_const_constructors
                  context,
                  MaterialPageRoute(
                    builder: (c) => Details(
                      url: _posts[index]['url'],
                      title: _posts[index]['title'],
                      description: _posts[index]['description'],
                      content: _posts[index]['content'],
                      publishedAt: _posts[index]['publishedAt'],
                      author: _posts[index]['author'],
                      urlToImage: _posts[index]['urlToImage'],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=id&apiKey=4199dc5f73ea45ea9ac20caa639e22bb'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
