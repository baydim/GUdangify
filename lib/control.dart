import 'package:cloud_firestore/cloud_firestore.dart';

class Datasevices {
  static CollectionReference quer =
      FirebaseFirestore.instance.collection('gudang');
  static CollectionReference querhapus =
      FirebaseFirestore.instance.collection('hapus');
  static CollectionReference ambil =
      FirebaseFirestore.instance.collection('ambil');

  //tambahd data
  static Future<void> tamup({
    String name,
    String kategori,
    String isikardus,
    String kardus,
    String hasil,
    String catatan,
    DateTime tgl,
    String edit,
    String ambil,
  }) async {
    await quer.add({
      'nama': name,
      'kategori': kategori,
      'isi_kardus': isikardus,
      'kardus': kardus,
      'hasil': hasil,
      'catatan': catatan,
      'tgl': tgl,
      'edit': edit,
      'ambil': ambil
    });
  }

  //updatedenganID
  static Future<void> update(
    String id, {
    String name,
    String kategori,
    String isikardus,
    String kardus,
    String hasil,
    String catatan,
    String edit,
    DateTime tgl,
  }) async {
    await quer.doc(id).set({
      'nama': name,
      'kategori': kategori,
      'isi_kardus': isikardus,
      'kardus': kardus,
      'hasil': hasil,
      'catatan': catatan,
      'tgl': tgl,
      'edit': edit,
    });
  }

  //ambildataID
  static Future<DocumentSnapshot> getData(String id) async {
    return await quer.doc(id).get();
  }

  //hapus data
  static Future<void> hapus(String id) async {
    await quer.doc(id).delete();
  }

  //pindah sampah
  static Future<void> pindah(String id,
      {String name,
      String kategori,
      String isikardus,
      String kardus,
      String hasil,
      String catatan,
      String edit,
      DateTime tgl}) async {
    await querhapus.doc(id).set({
      'nama': name,
      'kategori': kategori,
      'isi_kardus': isikardus,
      'kardus': kardus,
      'hasil': hasil,
      'catatan': catatan,
      'tgl': tgl,
      'edit': edit
    });
  }

  //hapus sampah
  static Future<void> hapusa(String id) async {
    await querhapus.doc(id).delete();
  }


  //diambil
  static Future<void> bil(
    String id, {
    String name,
    String kategori,
    String isikardus,
    String kardus,
    String hasil,
    String catatan,
    String edit,
    DateTime tgl,
    DateTime tglambil,
    String oleh
  }) async {
    await ambil.doc(id).set({
      'nama': name,
      'kategori': kategori,
      'isi_kardus': isikardus,
      'kardus': kardus,
      'hasil': hasil,
      'catatan': catatan,
      'tgl': tgl,
      'edit': edit,
      'tglambil' : tglambil,
      'oleh' : oleh
    });
  }
    //hapus ambil
  static Future<void> hapamb(String id) async {
    await ambil.doc(id).delete();
  }


}
