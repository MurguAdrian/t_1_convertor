import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int input = 0;
  final TextEditingController controller = TextEditingController();
  String? doarnr;
  double converteste = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Convertor',
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 25,
                  decorationStyle: TextDecorationStyle.solid,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 8,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                  'https://media-beta.romaniatv.net/unsafe/1280x720/smart/filters:contrast(5):format(jpg):quality(80)/https://www.economica.net/wp-content/uploads/2014/10/bani_100_lei_467653_11611200_16436000.jpg'),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
                controller: controller,
                onChanged: (String value) {
                  setState(() {
                    final int? numar = int.tryParse(value);
                    if (numar == null) {
                      doarnr = 'Introdu doar NUMERE';
                    } else {
                      input=numar;
                      doarnr = null;
                    }
                  });
                },
                decoration: InputDecoration(
                  errorText: doarnr,
                  labelText: 'Introdu un numar',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        converteste=0;
                        input = 0;
                        controller.clear();
                      });
                    },
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('converteste',style: TextStyle(fontSize: 25),),
                onPressed: () {
                  setState(() {
                    converteste=input *4.95;
                  });
                },
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Text('$converteste',style: TextStyle(fontSize: 25),),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: Center(
            child: Text(
              'Puyu',
              style: TextStyle(color: Colors.blue, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
