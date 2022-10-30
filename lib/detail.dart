import 'package:flutter/material.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://localhost:8888/deleteData.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Home();
    }));
    _DeleteData(context, "Data deleted successfully");
  }

  void _DeleteData(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
        "${widget.list[widget.index]['item_name']}",
        style: TextStyle(fontFamily: "Netflix"),
      )),
      body: new Container(
        height: 370.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['item_name'],
                  style: new TextStyle(fontFamily: "Netflix", fontSize: 20.0),
                ),
                new Text(
                  "Code : ${widget.list[widget.index]['item_code']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Price : Rp. ${widget.list[widget.index]['price']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Stock : ${widget.list[widget.index]['stock']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                new Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: new ElevatedButton(
                        child: new Text(
                          "EDIT",
                          style: TextStyle(
                              fontFamily: "Netflix", color: Colors.white),
                        ),
                        onPressed: () => Navigator.of(context)
                            .pushReplacement(new MaterialPageRoute(
                          builder: (BuildContext context) => new EditData(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                              style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
    ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: new ElevatedButton(
                        child: new Text(
                          "DELETE",
                          style: TextStyle(
                              fontFamily: "Netflix", color: Colors.white),
                        ),
                        onPressed: () => deleteData(),
                              style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
    ),
                      ),
                    ),
                  ],
                ),
                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Return",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
                    },
                          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
    ),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
