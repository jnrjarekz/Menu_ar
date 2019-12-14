import 'package:arcore_plugin/arcore_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ArCoreViewController arCoreViewController;
  String recongizedImage;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: <Widget>[
              /// replace the placeholder with the arcore view
              /// you want to implement
              Positioned.fill(child: ArCoreView(
                focusBox: Container(
                  width: screenSize.width * 0.5,
                  height: screenSize.width * 0.5,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, style: BorderStyle.none)
                  ),
                ),
                onImageRecognized: _onImageRecognized,
                onArCoreViewCreated: _onTextViewCreated,
              )),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'AR Food',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Spacer(),

                  /// Add more buttons here
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10)
                ],
              ),

              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.centerRight,
                  width: 150,
                  height: screenSize.height,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(15),
                    children: List.generate(
                        10,
                        (i) => Container(
                              width: 120,
                              height: 120,
                              child: InkWell(
                                onTap: () => showModal(''),
                                child: Card(
                                  elevation: 6,
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.primaries[i],
                                  child: Center(child: Text(i.toString())),
                                ),
                              ),
                            )).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTextViewCreated(ArCoreViewController controller) {
    arCoreViewController = controller;
    controller.getArCoreView();
  }

  void _onImageRecognized(String recImgName) {
    print("image recongized: $recImgName");
    // you can pause the image recognition via arCoreViewController.pauseImageRecognition();
    // resume it via arCoreViewController.resumeImageRecognition();
  }

  showModal(data) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
          data,
        );
      },
    );
  }
}

class BottomSheet extends StatelessWidget {
  final data;
  BottomSheet(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[],
      ),
    );
  }
}
