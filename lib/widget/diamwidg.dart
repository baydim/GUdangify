import 'package:belajar/satuan.dart';
import 'package:belajar/screen/editsampah.dart';
import 'package:belajar/screen/sampah.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../control.dart';

Widget appbar() {
  return Stack(
    children: <Widget>[
      Positioned(
          child: Container(
        width: double.infinity,
        child: Container(
            margin: EdgeInsets.only(left: 55, right: 55),
            child: Center(
                child: Text("Diambil",
                    style: TextStyle(fontSize: 18, color: Colors.white)))),
        height: 55,
        margin: EdgeInsets.only(left: 15, right: 15, top: 5),
        decoration: BoxDecoration(
            color: Colors.teal[300],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0)
            ]),
      )),
      Positioned(
        left: 0,
        top: 6,
        child: MaterialButton(
          elevation: 0,
          focusElevation: 0.0,
          highlightElevation: 0,
          onPressed: () => Get.back(),
          color: Colors.white,
          child: Icon(
            Icons.arrow_back,
            color: Colors.teal[300],
          ),
          shape: CircleBorder(),
        ),
      ),
    ],
  );
}

Widget get halo {
  return SliverList(
      delegate: SliverChildBuilderDelegate(
    (context, index) => StreamBuilder<QuerySnapshot>(
        stream:
            // Datasevices.quer.orderBy('tgl').startAt(carii.text)
            Datasevices.ambil.orderBy('tglambil', descending: true).snapshots(),

        // Datasevices.quer.orderBy('tgl').startAt(carii.text.toString())
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 70,
                      color: Colors.teal[300],
                    ),
                    Text("Terjadi suatu kesalahan",
                        style: TextStyle(color: Colors.redAccent)),
                  ],
                ));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.black38,
            ));
          }
          if (snapshot.data.docs.isEmpty) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.directions_run,
                      size: 70,
                      color: Colors.teal[300],
                    ),
                    Text(
                      'Belum ada pengambilan',
                      style: TextStyle(
                        color: Colors.teal[300],
                      ),
                    ),
                  ],
                ));
          }
          return new Column(
            children: snapshot.data.docs.map((DocumentSnapshot doc) {
              return Dismissible(
                  background: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Icon(Icons.delete_outline, color: Colors.redAccent),
                    ),
                  ),
                  secondaryBackground: Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:
                          Icon(Icons.delete_outline, color: Colors.redAccent),
                    ),
                  ),
                  key: ObjectKey(doc.data().keys),
                  onDismissed: (direction) async {
                    try {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          duration: Duration(milliseconds: 1000),
                          content: InkWell(
                            onTap: () {
                              Get.to(Sampah(),
                                  transition: Transition.downToUp,
                                  duration: milisec);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              height: 45,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2,
                                      spreadRadius: 0)
                                ],
                                color: Colors.redAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Data berada disampah",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins'),
                                  )
                                ],
                              ),
                            ),
                          )));
                      await Datasevices.pindah(
                        doc.id,
                        name: doc.data()['nama'],
                        kategori: doc.data()['kategori'],
                        isikardus: doc.data()['isi_kardus'],
                        kardus: doc.data()['kardus'],
                        hasil: doc.data()['hasil'],
                        catatan: doc.data()['catatan'],
                        tgl: doc.data()['tgl'].toDate(),
                      );
                      // doc.data().remove(doc.id);
                      await Datasevices.hapamb(doc.id);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Get.to(
                          Editsam(
                            ids: doc.id,
                            namas: doc.data()['nama'],
                            katos: doc.data()['kategori'],
                            isis: doc.data()['isi_kardus'],
                            kados: doc.data()['kardus'],
                            hasils: doc.data()['hasil'],
                            cat: doc.data()['catatan'],
                            tgl: doc.data()['tgl'],
                          ),
                          transition: Transition.downToUp,
                          duration: milisec);
                    },
                    child: Container(
                        margin:
                            EdgeInsets.only(left: 15, right: 15, bottom: 15),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                doc.data()['tgl'].toDate().toString(),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2,
                                        spreadRadius: 0)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 2,
                                          child: Text(doc.data()['nama'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20))),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 2, 5, 2),
                                        decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Text(doc.data()['kategori'],
                                            style:
                                                TextStyle(color: Colors.white)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Kardus ' + doc.data()['kardus'],
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'item ' + doc.data()['hasil'],
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      doc.data()['catatan'] != ''
                                          ? CircleAvatar(
                                              backgroundColor: Colors.yellow,
                                              radius: 5.5,
                                            )
                                          : CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 5.5,
                                            )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ));
            }).toList(),
          );
        }),
    childCount: 1,
  ));
}
