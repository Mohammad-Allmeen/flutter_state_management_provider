import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/ListMapProvider.dart';
import 'package:statemanagement/list_page.dart';

import 'counter.dart';

void main() {
  runApp(MultiProvider(providers:
      [
      ChangeNotifierProvider(create: (context)=> ListMapProvider(),),
      ChangeNotifierProvider(create: (context)=> CounterProvider(),)
  ],
  child: MyApp()
  ));
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListPage(),
      // ChangeNotifierProvider(
      //   create: (_)=>CounterProvider(),// create has a call back and we will have to give object of the other class or provider class
      //   child:  ListPage(),
    );
  }
}

class HomePage  extends StatelessWidget{


// StatefulWidget {
//
//   const HomePage({super.key});
//
// @override
//
//   State<HomePage> createState()=> _HomePageState();
//
// }
//
// class _HomePageState extends State<HomePage>{



  get floatingActionButton => null; //   underscore is to make method variable or class as private
  @override
  Widget build(BuildContext context){
    print('build function called');
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider>( // consumer is used when we only need to rebuild some parts of widgets or page not the whole page
              builder: (ctx, _,__){ // _ for provider, __ for child, because we do not need right now
                print ("Consumer builder called");
                return Text(
                //  "${Provider.of<CounterProvider>(ctx, listen: true).getCount()}", //below line is the alternative of this line
                  '${ctx.watch<CounterProvider>().getCount()}',
                  //context.watch - used when we need to make any changes or modfications
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.green),);
                //Provider.of context is used to call ancestor widget and in its parent widget there must be a provider
                // whenever there will be change in data, provider will listen and with the help of context it will reach to Widget and say that there has been an modify in data we need to rebuild the UI



              },
            ),
            SizedBox(
            height: 20,
          ),
          ],
        ),
      ),
            floatingActionButton : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                FloatingActionButton(onPressed: (){
                 //Provider.of<CounterProvider>(context, listen: false).incrementCount(); // listen false because button does not need any change it is used to make changes, not using listen false will result in error
                  //alternative of not using listen
                  context.read<CounterProvider>().incrementCount(5);
                },

                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 100,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(onPressed: ()
                  {
                    context.read<CounterProvider>().decrementCount(2);
                  },
                    child: Icon(Icons.remove),
                  ),
                )
              ],
            )
    );
  }
}



/*

flutter is a declarative programming

in flutter - we have to always re-build the state whenever there is change in the UI

whenever we change the data the ui consume the

whenever we nee to change the data we call the state and it rebuild the whole UI or components of the app

setState- rebuilds the UI this is why we call set state function whenever there is the change in UI

Two states in the flutter-

1. Local State -
this is used to make the changes in the same page of the app or locally in the widget

But what if we are making changes in the 1st page and it is reflecting the changes to the 2nd or any other page of the app

then we use the concept of the Global state management

Global State - in flutter it is used to make changes in any other part of the app.



likewise for every house we follow architecture made by civil to make our perfect home
similarly we follow a proper architecture when creating the app or software

ex of architecture- MVP, MVC, MVVM

MVVM- (Model View View model) it is currently mostly used architecture

for building the best and scalable app, the app should be independent or loosely coupled means the data or Ui should not
be dependent or tightly coupled

our Ui and data should be managed separately, basically the logic of UI and Data must be separate and must be interlinked
this that when we make change in the Ui we do not have to do much changes in the data, this time saving and reducing the work required

this is called separation of concerns and to implement this MVVM is used

model - data related work is done
view - UI related work is done
view mode - it the part where UI and Data is interlinked and we must ensure that they are loosely coupled,
          in view model we ensure that if data is changed then UI must change this kind of work is done is view model
whenever there is change in data it notifies the UI and Ui rebuilds its state

this is call done in State management

In State management two Important functions are used-

1. context.read - it ony update the data through function does not impacts the UI,it only read but does not listen the data
2. context.watch - it continuously reads listens watches the data and whenever there is change it rebuild the state to change the UI



*/