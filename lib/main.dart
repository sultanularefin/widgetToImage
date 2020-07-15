import 'dart:async';

//import 'package:flutter/material.dart' hide Image;
import 'package:flutter/material.dart';


/* classes added */
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
//import 'package:image/image.dart' as armada;



// classes added ends here.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey _globalKey = GlobalKey();

  Uint8List bytesArefins ;
  final uint8LIstController =  StreamController<Uint8List>();
  Stream<Uint8List> get getUint8ListStream => uint8LIstController.stream;




  Future<void> _capturePng() async {
    try {
      print('inside:: ');
      RenderRepaintBoundary boundary =
      _globalKey.currentContext.findRenderObject();

      print('boundary: $boundary');

      ui.Image image2 = await boundary.toImage(pixelRatio: 3.0);


//      final ui.Image image2 = await boundary.toImage(pixelRatio: imageSize.width / logicalSize.width);

      ByteData byteData =
      await image2.toByteData(format: ui.ImageByteFormat.png);

      print('byteData: $byteData');

      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget widget= new  Directionality(
      textDirection: TextDirection.rtl,
      child:
      Container(

        width:  50,
        height: 60,

        decoration: BoxDecoration(
          border: Border.all(

            color: Colors.black,
            style: BorderStyle.solid,
            width: 1.0,

          ),
          shape: BoxShape.circle,

        ),

        child: Icon(
//        getIconForName(orderTypeName),
//        IconData:
          Icons.phone_in_talk,
//        FontAwesomeIcons.bookmark,
          color: Color(0xffFC0000),
          size: 40,

        ),


      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget To Image demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tapping button below should capture placeholder image capture the placeholder image',
            ),
            RepaintBoundary(
              key: _globalKey,
              child: Offstage(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Placeholder(),
                ),
              ),
            ),
            StreamBuilder<Uint8List>(
                stream: getUint8ListStream,
                initialData: bytesArefins,
                builder: (context, snapshot) {

                  if(snapshot.hasData){
                    final Uint8List bytes = snapshot.data;
//                    final Uint8List bytes = data.buffer.asUint8List();
//                    final Image image = decodeImage(bytes);

//                    final Image image = armada.decodeImage(bytes);
                    return Image.memory(
                        bytes
                    );
//                    snapshot.hasData
//                    final Image image = decodeImage(bytes);
//                    return Text('capture Image');
                  }
                  else{
                    return RaisedButton(
                      child: Text('capture Image'),
//              onPressed: _capturePng,
//                      onPressed: createImageFromWidget,
                      onPressed:()=> createImageFromWidget(widget),
                    );
                  }

                }
            ),
          ],
        ),
      ),
    );
  }

  /// Creates an image from the given widget by first spinning up a element and render tree,
  /// then waiting for the given [wait] amount of time and then creating an image via a [RepaintBoundary].
  ///
  /// The final image will be of size [imageSize] and the the widget will be layout, ... with the given [logicalSize].
//  Future<Uint8List> createImageFromWidget(
  Future<void> createImageFromWidget(
      Widget widget,
      {Duration wait,
        Size logicalSize,
        Size imageSize}) async {
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

    logicalSize ??= ui.window.physicalSize / ui.window.devicePixelRatio;
    imageSize ??= ui.window.physicalSize;

    assert(logicalSize.aspectRatio == imageSize.aspectRatio);

    final RenderView renderView = RenderView(
      window: null,
      child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        size: logicalSize,
        devicePixelRatio: 1.0,
      ),
    );

    final PipelineOwner pipelineOwner = PipelineOwner();
    final BuildOwner buildOwner = BuildOwner();

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final RenderObjectToWidgetElement<RenderBox> rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: widget,
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);

    if (wait != null) {
      await Future.delayed(wait);
    }

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final ui.Image image = await repaintBoundary.toImage(pixelRatio: imageSize.width / logicalSize.width);
    final ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    final Uint8List bytes =  byteData.buffer.asUint8List();

//    final Uint8List bytes = data.buffer.asUint8List();
//    final Image image = decodeImage(bytes);
//
//    final Image oneImage = armada.decodeImage(bytes);
    // decodePng(bytes);
//    decodeImage(bytes)

    bytesArefins = bytes;
    uint8LIstController.sink.add(bytesArefins);

    return
      byteData.buffer.asUint8List();

//  return;
  }

  @override
  void dispose() {
//    _orderController.close();
//    _expandedSelectedFoodController.close();
//    _savedSelectedFoodController.close();
//    _orderTypeController.close();
//    _paymentTypeController.close();
//    _devicesController.close();
//    _restaurantController.close();
//    _customerInformationController.close();
//    _multiSelectForFoodController.close();
    uint8LIstController.close();

  }
}
