import 'package:belajar/screen/sampah.dart';
import 'package:belajar/screen/tambah.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:belajar/control.dart';
import 'package:belajar/screen/edit.dart';

import '../satuan.dart';

Widget get button {
  return Stack(
    children: <Widget>[
      Positioned(
        bottom: 5,
        right: -15,
        child: MaterialButton(
          elevation: 1,
          focusElevation: 1,
          hoverElevation: 1,
          highlightElevation: 1,
          disabledElevation: 0,
          child: SizedBox(
            width: 60,
            height: 60,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
          ),
          shape: CircleBorder(),
          color: Colors.blueAccent,
          onPressed: () {
            Get.to(Tambah(),
                transition: Transition.rightToLeftWithFade, duration: milisec);
          },
        ),
      )
    ],
  );
}

final padding = EdgeInsets.only(left: 15, right: 15);

//drawer

//data
Widget get halo {
  return SliverList(
      delegate: SliverChildBuilderDelegate(
    (context, index) => StreamBuilder<QuerySnapshot>(
        stream: Datasevices.quer
            .orderBy('tgl', descending: true)
            // .where('hapus', isEqualTo: n)
            .snapshots(),
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
                      color: Colors.redAccent,
                    ),
                    Text("Terjadi suatu kesalahan",
                        style: TextStyle(color: Colors.redAccent)),
                  ],
                ));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
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
                      Icons.storage_outlined,
                      size: 70,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'Gudang anda kosong',
                      style: TextStyle(color: Colors.blueGrey),
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

                      await Datasevices.hapus(doc.id);
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
                          Edit(
                            ids: doc.id,
                            namas: doc.data()['nama'],
                            katos: doc.data()['kategori'],
                            isis: doc.data()['isi_kardus'],
                            kados: doc.data()['kardus'],
                            hasils: doc.data()['hasil'],
                            cat: doc.data()['catatan'],
                            tgl: doc.data()['tgl'],
                          ),
                          transition: Transition.downToUp);
                      // print(doc.id);
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
                                            color: Colors.blueAccent,
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
                                      doc.data()['edit'] == 'a'
                                          ? Text('Diedit')
                                          : SizedBox(width: 0, height: 0),
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
