import 'package:flutter/material.dart';

class SlotsText extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final int slots_no;
  SlotsText(this.slots_no);
  @override
  _SlotsTextState createState() => _SlotsTextState();
}

class _SlotsTextState extends State<SlotsText> {
  int slot;
  @override
  void initState() {
    setState(() {
      //slot = widget.slots_no+1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
       slot = widget.slots_no+1;
    });
    return Text("Slot $slot",style:TextStyle(color: Colors.white));
  }
}
