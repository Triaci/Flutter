
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_2/home_controller.dart';

/* class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = HomeController.of(context);
    final size = MediaQuery.of(context).size;
    final navigation = Navigator.of(context);
    final theme = Theme.of(context)
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Flutterando ${controller.value}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          controller.increment();
        }),
    );
  }
}

 */

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final names = ['joao','ana', 'maria', 'juliana'];
      return Scaffold(
        appBar: AppBar(
        title: Text('Curso Flutter'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index){
               final name = names[index];
               return ListTile(
                 title: Text(name),
               );
            },
            
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {  
          });
        }
       ),
    );
  }
}