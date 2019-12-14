import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helenus Fast Foods'),
      ),      
      body: Stack(
          children: <Widget>[
            Center(
              child: new Image.asset(
                'assets/images/foodbg.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: '  Welcome',
                      style: TextStyle(
                        fontFamily: 'AbrilFatFace',
                        fontSize: 60,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: '             to',
                      style: TextStyle(
                        fontFamily: 'AbrilFatFace',
                        fontSize: 45,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: '  Helenus Fast Foods',
                      style: TextStyle(
                        fontFamily: 'AbrilFatFace',
                        fontSize: 67,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),            
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
        tooltip: 'Scan the Menu',
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
