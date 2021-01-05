import 'package:flutter/material.dart';

class MyOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            width:MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .40,
            
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 10,
                    child: ExpansionTile(title: 
                    Align(
                      alignment: Alignment.topRight,
                      child: Text("Dubai-B-2834", style: TextStyle(
                                    color: Color.fromRGBO(45, 97, 135, 2),
                                    fontSize: 14),)),
                      subtitle:Align(alignment:Alignment.topRight,  child:Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Total:", style: TextStyle(
                                        color: Color.fromRGBO(45, 97, 135, 2),
                                        fontSize: 14),),
                                         Align(
                                           alignment: Alignment.topRight,
                                                                                  child: Text("60 Aed", style: TextStyle(
                                        color: Color.fromRGBO(45, 97, 135, 2),
                                        fontSize: 14),),
                                         ),
                        ],
                      )) ,
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Text("Dodge challenger", style: TextStyle(
                                        color: Color.fromRGBO(45, 97, 135, 2),
                                        fontSize: 14),),
                                         Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Text("2/10/2020", style: TextStyle(
                                        color: Color.fromRGBO(45, 97, 135, 2),
                                        fontSize: 14),),
                                         ),
              ],
            ),
            children: <Widget>[
              Text("dubai", style: TextStyle(
                                    color: Color.fromRGBO(45, 97, 135, 2),
                                    fontSize: 14),),
            ],),
          );
      }),
        ),
        
      ),
    );
  }
}