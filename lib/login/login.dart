import 'package:belajar/login/daftar.dart';
import 'package:belajar/login/masuk.dart';
import 'package:belajar/satuan.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var now;

  @override
  void initState() {
    super.initState();
    now = TimeOfDay.now().hour;
    if (now >= 0 && now <= 9) {
      greet = "Pagi";
    }
    if (now >= 10 && now <= 15) {
      greet = "Siang";
    }
    if (now >= 16 && now <= 18) {
      greet = "Sore";
    }
    if (now >= 19 && now <= 24) {
      greet = "Malam";
    }
  }

  Widget get gambar {
    return Center(
      child: ListTile(
        title: Center(
            child: Text(
          "Selamat $greet",
          style: TextStyle(fontSize: 28, color: Colors.black54),
        )),
        subtitle: Hero(tag: 'hm', child: Image.asset("assets/log.png")),
      ),
    );
  }

  Widget get bawah {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Hero(
          tag: 'hmy',
          child: MaterialButton(
            height: 40,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            color: Colors.redAccent,
            minWidth: MediaQuery.of(context).size.width / 2.4,
            onPressed: () {
              Get.to(Daftar(),
                  transition: Transition.fadeIn, duration: milisec);
            },
            child: Text(
              "Daftar",
              style: putih,
            ),
          ),
        ),
        Hero(
          tag: 'hmyy',
          child: MaterialButton(
            height: 40,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            color: Colors.blueAccent,
            minWidth: MediaQuery.of(context).size.width / 2.4,
            onPressed: () {
              Get.to(Masuk(), transition: Transition.fadeIn, duration: milisec);
            },
            child: Text(
              "Masuk",
              style: putih,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: putihh,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: Container(
            height: 300,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[gambar, bawah],
            ),
          )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Text(
        "By TuTu",
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
}
