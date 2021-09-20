import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final url;
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final content;
  // ignore: prefer_typing_uninitialized_variables
  final description;
  // ignore: prefer_typing_uninitialized_variables
  final publishedAt;
  // ignore: prefer_typing_uninitialized_variables
  final author;
  // ignore: prefer_typing_uninitialized_variables
  final urlToImage;

  const Details(
      {Key? key,
      this.url,
      this.title,
      this.content,
      this.publishedAt,
      this.author,
      this.description,
      this.urlToImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          urlToImage != null
              ? Image.network(urlToImage)
              : Container(
                  height: 250,
                  color: Colors.grey[200],
                ),
          Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '$publishedAt',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 5),
                Text('$content'),
                const SizedBox(height: 5),
                Text('$description'),
                const Divider(),
                Text('Author : $author '),
                const SizedBox(height: 5),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () => _launchURL(),
                  child: const Text('Selengkapnya',
                      style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _launchURL() async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
