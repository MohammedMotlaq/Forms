import 'package:flutter/material.dart';
class FormResults extends StatefulWidget {
  const FormResults({Key? key}) : super(key: key);

  @override
  State<FormResults> createState() => _FormResultsState();
}

class _FormResultsState extends State<FormResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Results'),
      ),
    );
  }
}
