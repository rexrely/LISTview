import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = '學生資訊';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final bool _customTileExpanded = false;
  var person = <String>['Mia','Jeff','Paul','Ali','Kyle','Jenny','Sofia','Henry'];
  var number = <String>['1','2','3','4','5','6','7','8'];
  var gender = <String>['female','male','male','female','male','female','female','male',];
  var pictures =<String>[
    'images/woman.png',
    'images/man.jpeg',
    'images/man.jpeg',
    'images/woman.png',
    'images/man.jpeg',
    'images/woman.png',
    'images/woman.png',
    'images/man.jpeg'
  ] ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      ListView.separated(
        itemBuilder: (context,index) =>
            Card(
              child:
              ExpansionTile(
                leading: CircleAvatar(backgroundImage: AssetImage(pictures[index])),
                title: Text(person[index]),
                subtitle: Text(gender[index]),
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.arrow_drop_down_circle
                      : Icons.arrow_drop_down,
                ),
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name:'+person[index],style: TextStyle(fontSize: 20),),
                      Text('Number:'+number[index],style: TextStyle(fontSize: 20)),
                      Text('Gender:'+gender[index],style: TextStyle(fontSize: 20)),
                    ],
                  )
                ],
              ),
            ),
        separatorBuilder: (context,index) => const Divider(),
        itemCount: person.length,
      )
      ,
    );
  }
}
