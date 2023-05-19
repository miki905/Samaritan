

import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(milliseconds: 2500), (){
      Navigator.popUntil(context, ModalRoute.withName("/"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.white,
      child: Center(
        child: SvgPicture.asset('assets/icons/submit-success.svg',
            height: 300, color: Colors.green)),

    );
  }
}
