import 'package:belajar/satuan.dart';
import 'package:belajar/widget/diamwidg.dart';
import 'package:flutter/material.dart';

class Diambil extends StatefulWidget {
  @override
  _DiambilState createState() => _DiambilState();
}

class _DiambilState extends State<Diambil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: putihh,
        body: SafeArea(
            child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                floating: true,
                expandedHeight: 0,
                flexibleSpace: appbar()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            halo
          ],
        )));
  }
}
