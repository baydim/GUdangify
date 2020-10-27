import 'package:belajar/satuan.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../control.dart';

class Tambah extends StatefulWidget {
  @override
  _TambahState createState() => _TambahState();
}

class _TambahState extends State<Tambah> {
  var namabarang = TextEditingController();
  var kategoribarang = TextEditingController();
  var isikardus = TextEditingController();
  var kardus = TextEditingController();
  var total;
  var hasil = TextEditingController();
  var catat = TextEditingController();

  Widget get appbar {
    return Stack(
      children: <Widget>[
        Positioned(
            child: Container(
          width: double.infinity,
          child: Container(
            child: Center(
              child: Text(
                'Tambah barang',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          height: 55,
          margin: EdgeInsets.only(left: 15, right: 15, top: 5),
          decoration: BoxDecoration(
              color: Colors.white,
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
            color: Colors.blue,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
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
        maxLength: 20,
        controller: namabarang,
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          counter: SizedBox(width: 0, height: 0),
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
          maxLength: 10,
          controller: kategoribarang,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
            counter: SizedBox(width: 0, height: 0),
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
                onChanged: (isi) {
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

  void show() {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('data')));
  }

  Widget get tombol {
    return MaterialButton(
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        color: Colors.blue,
        onPressed: () async {
          DateTime now = DateTime.now();
          if (namabarang.text.isEmpty ||
              kategoribarang.text.isEmpty ||
              isikardus.text.isEmpty ||
              kardus.text.isEmpty ||
              hasil.text.isEmpty) {
            Get.bottomSheet(
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  height: 45,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 2, spreadRadius: 0)
                    ],
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Kolom anda belum lengkap",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                ),
                barrierColor: Colors.transparent);
          } else {
            Datasevices.tamup(
                name: namabarang.text,
                kategori: kategoribarang.text,
                isikardus: isikardus.text,
                kardus: kardus.text,
                hasil: hasil.text,
                catatan: catat.text,
                tgl: now);

            Get.back();
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
            width: double.infinity,
            height: 40,
            child: Center(
              child: Text('Simpan', style: TextStyle(color: Colors.white)),
            )));
  }

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
                    tombol
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
