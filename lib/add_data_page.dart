
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/ListMapProvider.dart';

class AddDataPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),

      body: Center(
        child: IconButton(onPressed: (){
          context.read<ListMapProvider>().addData({
            'Name': 'Allmeen',
            'Contact no.': '80096564996'
          });
        }, icon: Icon  ( Icons.add),
      )
      )
    );

  }
}