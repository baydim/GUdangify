import 'package:belajar/satuan.dart';
import 'package:belajar/widget/samwidg.dart';
import 'package:flutter/material.dart';

class Sampah extends StatefulWidget {
  @override
  _SampahState createState() => _SampahState();
}

class _SampahState extends State<Sampah> {
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
