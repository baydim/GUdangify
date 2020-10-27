import 'package:belajar/satuan.dart';
import 'package:belajar/screen/diambil.dart';
import 'package:belajar/widget/berwid.dart';
import 'package:belajar/screen/cari.dart';
import 'package:belajar/screen/sampah.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final GlobalKey<ScaffoldState> _dra = new GlobalKey<ScaffoldState>();

  Widget appbar() {
    return Stack(
      children: <Widget>[
        Positioned(
            child: InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Get.to(Cari(), transition: Transition.noTransition);
                },
                child: Container(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.only(left: 55),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Telusuri barang',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  height: 55,
                  margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 2, spreadRadius: 0)
                      ]),
                ))),
        Positioned(
          left: 0,
          top: 6,
          child: MaterialButton(
            elevation: 0,
            focusElevation: 0.0,
            highlightElevation: 0,
            onPressed: () {
              _dra.currentState.openDrawer();
              // Scaffold.of(context).openDrawer();
            },
            color: Colors.white,
            child: Icon(Icons.menu),
            shape: CircleBorder(),
          ),
        ),
        Positioned(
          right: 0,
          top: 6,
          child: MaterialButton(
              elevation: 0,
              focusElevation: 0.0,
              highlightElevation: 0,
              onPressed: () {},
              shape: CircleBorder(),
              child: Hero(
                tag: 'prof',
                child: CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                ),
              )),
        ),
      ],
    );
  }

  Widget get draw {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        decoration: BoxDecoration(color: Colors.white),
        child: Drawer(
          elevation: 10.0,
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 56,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.grey.shade300,
                        blurRadius: 2,
                        spreadRadius: 0,
                      ),
                    ]),
                    child: Center(
                      child: Text("GUdangify",
                          style:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Get.to(Sampah(),
                        transition: Transition.downToUp, duration: milisec);
                  },
                  child: ListTile(
                    title: Text("Sampah"),
                    leading: Icon(Icons.delete_outline_rounded),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Get.to(Diambil(),
                        transition: Transition.downToUp, duration: milisec);
                  },
                  child: ListTile(
                    title: Text("Diambil"),
                    leading: Icon(Icons.beenhere_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: putihh,
      key: _dra,
      drawer: draw,
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
      )),
      floatingActionButton: button,
    );
  }
}
