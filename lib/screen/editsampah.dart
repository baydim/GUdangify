import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../control.dart';
import '../satuan.dart';

// ignore: must_be_immutable
class Editsam extends StatefulWidget {
  Editsam(
      {this.ids,
      this.namas,
      this.katos,
      this.isis,
      this.kados,
      this.hasils,
      this.cat,
      this.tgl});
  String ids;
  String namas;
  String katos;
  String isis;
  String kados;
  String hasils;
  String cat;
  Timestamp tgl;
  @override
  _EditsamState createState() => _EditsamState();
}

class _EditsamState extends State<Editsam> {
  var namabarang = TextEditingController();
  var kategoribarang = TextEditingController();
  var isikardus = TextEditingController();
  var kardus = TextEditingController();
  var total;
  var hasil = TextEditingController();
  var catat = TextEditingController();

  @override
  void initState() {
    super.initState();
    namabarang.text = widget.namas;
    kategoribarang.text = widget.katos;
    isikardus.text = widget.isis;
    kardus.text = widget.kados;
    hasil.text = widget.hasils;
    catat.text = widget.cat;
  }

  Widget get appbar {
    return Stack(
      children: <Widget>[
        Positioned(
            child: Container(
          width: double.infinity,
          child: Container(
            child: Center(
              child: Text(
                'Detail sampah',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          height: 55,
          margin: EdgeInsets.only(left: 15, right: 15, top: 5),
          decoration: BoxDecoration(
              color: Colors.redAccent,
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
              color: Colors.redAccent,
            ),
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
            onPressed: () => Get.bottomSheet(
                Container(
                  height: 300,
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: <Widget>[
                      SelectableText(
                        "ID: ${widget.ids}",
                        style: TextStyle(color: Colors.white),
                      ),
                      QrImage(
                        data: widget.ids,
                        version: 3,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        size: 200,
                        errorCorrectionLevel: QrErrorCorrectLevel.Q,
                      ),
                    ],
                  ),
                ),
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                ignoreSafeArea: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.redAccent),
            color: Colors.transparent,
            child: Icon(Icons.qr_code, color: Colors.white),
            shape: CircleBorder(),
          ),
        ),
      ],
    );
  }

  Widget get nama {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 4, 15, 0),
      width: double.infinity,
      child: TextField(
        enabled: false,
        controller: namabarang,
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Nama barang',
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
    );
  }

  Widget get lis {
    return Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 4),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0)
            ]),
        child: TextField(
          enabled: false,
          controller: kategoribarang,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Kategori',
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        )
        // DropdownButtonHideUnderline(
        //   child: DropdownButton(
        //     hint: Text("Kategori "),
        //     value: _valFriends,
        //     items: _myFriends.map((li) {
        //       return DropdownMenuItem(
        //         child: Text(li),
        //         value: li,
        //       );
        //     }).toList(),
        //     onChanged: (li) {
        //       setState(() {
        //         _valFriends = li;
        //       });
        //     },
        //   ),
        // )
        );
  }

  Widget get pack {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Isi @ kardus',
              style: TextStyle(color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
              margin: EdgeInsets.only(top: 7),
              width: 90,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 2, spreadRadius: 0)
                  ]),
              child: TextField(
                enabled: false,
                onChanged: (isi) {
                  perkalian();
                  setState(() {});
                },
                controller: isikardus,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Kardus anda',
              style: TextStyle(color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
              margin: EdgeInsets.only(top: 7),
              width: 90,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 2, spreadRadius: 0)
                  ]),
              child: TextField(
                enabled: false,
                onChanged: (kardus) {
                  perkalian();
                  setState(() {});
                },
                controller: kardus,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Total item',
              style: TextStyle(color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
              margin: EdgeInsets.only(top: 7),
              width: 90,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 2, spreadRadius: 0)
                  ]),
              child: TextField(
                enabled: false,
                controller: hasil,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget get catatan {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
      margin: EdgeInsets.only(top: 7),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0)
          ]),
      child: TextField(
        enabled: false,
        controller: catat,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Catatan',
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  void perkalian() {
    double i;
    double k;
    isikardus.text == "" ? i = 0 : i = double.parse(isikardus.text);
    kardus.text == "" ? k = 0 : k = double.parse(kardus.text);
    total = i * k;
    // total = int.parse(isikardus.text) * int.parse(kardus.text);
    hasil.text = total.toString();
  }

  Widget get tombol {
    return MaterialButton(
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        color: Colors.redAccent,
        onPressed: () async {
          await Datasevices.update(
            widget.ids,
            name: namabarang.text,
            kategori: kategoribarang.text,
            isikardus: isikardus.text,
            kardus: kardus.text,
            hasil: hasil.text,
            catatan: catat.text,
            tgl: widget.tgl.toDate(),
          );
          try {
            await Datasevices.hapusa(widget.ids);
          } catch (e) {
            print(e);
          }
          Get.back();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
            width: double.infinity,
            height: 40,
            child: Center(
              child: Text('Pulihkan', style: TextStyle(color: Colors.white)),
            )));
  }

  String namabar;
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
                  flexibleSpace: appbar),
              SliverToBoxAdapter(
                  child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 35,
                    ),
                    nama,
                    SizedBox(
                      height: 15,
                    ),
                    lis,
                    SizedBox(
                      height: 15,
                    ),
                    pack,
                    SizedBox(
                      height: 15,
                    ),
                    catatan,
                    SizedBox(
                      height: 15,
                    ),
                    tombol,
                    Text(widget.tgl.toDate().toString())
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
