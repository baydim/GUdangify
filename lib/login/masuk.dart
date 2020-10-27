import 'package:belajar/screen/beranda.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../satuan.dart';

class Masuk extends StatefulWidget {
  @override
  _MasukState createState() => _MasukState();
}

class _MasukState extends State<Masuk> {
  final email = TextEditingController();
  final passs = TextEditingController();

  Widget get at {
    return Column(
      children: <Widget>[
        Hero(
          tag: 'hm',
          child: Image.asset(
            "assets/gp.png",
            width: 200,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Mohon isi dengan benar!!",
            style: TextStyle(fontSize: 20, color: Colors.black54))
      ],
    );
  }

  Widget get emaill {
    return Column(
      children: <Widget>[
        !email.text.contains("@") ? nit : nut,
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 4, 15, 0),
          width: double.infinity,
          child: TextField(
            onChanged: (value) {
              setState(() {});
            },
            maxLength: 20,
            controller: email,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              counter: SizedBox(width: 0, height: 0),
              hintText: 'Email',
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          height: 55,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0)
              ]),
        ),
      ],
    );
  }

  Widget get pass {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(15, 4, 15, 0),
          width: double.infinity,
          child: TextField(
            maxLength: 20,
            controller: passs,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              counter: SizedBox(width: 0, height: 0),
              hintText: 'Password',
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          height: 55,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0)
              ]),
        ),
        SizedBox(
          height: 5,
        ),
        not
      ],
    );
  }

  Widget get bawah {
    return Hero(
      tag: 'hmyy',
      child: MaterialButton(
        height: 40,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: Colors.blueAccent,
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Get.to(Beranda(), transition: Transition.downToUp, duration: milisec);
        },
        child: Text(
          "Masuk",
          style: putih,
        ),
      ),
    );
  }

  Widget get flo {
    return Stack(
      children: <Widget>[
        Positioned(
          left: -25,
          child: MaterialButton(
            elevation: 0,
            focusElevation: 0.0,
            highlightElevation: 0,
            onPressed: () {
              Get.back();
            },
            color: Colors.white,
            child: Icon(Icons.arrow_back),
            shape: CircleBorder(),
          ),
        ),
      ],
    );
  }

  Widget get go {
    return MaterialButton(
      color: Colors.white,
      elevation: 1,
      shape: CircleBorder(),
      height: 40,
      onPressed: () {},
      child:
          Text("G", style: TextStyle(fontSize: 24, color: Colors.blueAccent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: putihh,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: <Widget>[
                  at,
                  SizedBox(
                    height: 30,
                  ),
                  emaill,
                  SizedBox(
                    height: 15,
                  ),
                  pass,
                  SizedBox(
                    height: 50,
                  ),
                  bawah,
                  SizedBox(
                    height: 15,
                  ),
                  go,
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: flo);
  }
}
