import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crud_pertemuan5/editdata.dart';
import 'package:crud_pertemuan5/main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  List list;
  int index;
  Details({required this.list, required this.index});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void delete() {
    var url =
        Uri.parse('http://192.168.100.168/restapi2/delete.php'); //deletion api
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Are You Sure?"), //confirming the deletion of record
      actions: [
        MaterialButton(
          child: const Text("YES DELETE"),
          onPressed: () {
            delete();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Home()));
          },
        ),
        MaterialButton(
          child: const Text("NO.."),
          onPressed: () {
            Navigator.of(context).pop(); // Menutup AlertDialog
            // Tambahkan logika atau panggilan fungsi untuk perintah "NO" di sini
          },
        ),
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('${widget.list[widget.index]['nama']}')),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.list[widget.index]['nama'],
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Alamat : ${widget.list[widget.index]['alamat']}"),
              const SizedBox(
                height: 3,
              ),
              Text(
                  "Salary : ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(double.parse(widget.list[widget.index]['salary']))}"),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: MaterialButton(
                        child: const Text("Edit Data"),
                        color: Colors.amber,
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Edit(list: widget.list, index: widget.index)),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: MaterialButton(
                          child: const Text("Delete"),
                          color: Colors.amber,
                          onPressed: () {
                            confirm();
                          })),
                ],
              )
            ],
          ),
        ));
  }
}
