import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/ListMapProvider.dart';
import 'package:statemanagement/add_data_page.dart';

class ListPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),),

    body: Consumer<ListMapProvider>(
      builder: (ctx, provider, __){
        var alldata= provider.getData();
        return
          //ctx.watch<ListMapProvider>().getData();
        alldata.isNotEmpty ? ListView.builder(
            itemCount: alldata.length,
            itemBuilder: (_, index){
          return ListTile(
            title: Text('${alldata[index]['Name']}'),
            subtitle: Text('${alldata[index]['Contact no.']}'),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    context.read<ListMapProvider>().updateData({
              'Name': 'Arshi',
            'Contact no.': '348728973'
            }, index);
                  }, icon: Icon(Icons.update),color: Colors.blue,),

                  IconButton(onPressed: (){
                    context.read<ListMapProvider>().delData( index);
                  }, icon: Icon(Icons.delete),color: Colors.red,)
                ],
              ),
            ),
          );
        }): Center(child: Text("No Data Available"),) ;//alternative of above line
      },
    ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // context.read<ListMapProvider>().addData({
        //   "Name": "Allmeen",
        //   "Contact no." : '8009656496',
        // });
        // context.read<ListMapProvider>().addData({
        //   'Name': 'Arshi',
        //   'Contact no.' : '29238493284',
        // });

        Navigator.push(context, MaterialPageRoute( builder: (context)=> AddDataPage(),));

      },
        child: Icon(Icons.add),


      ),

    );
    
  }
}