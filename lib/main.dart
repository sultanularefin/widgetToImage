import 'dart:async';

//import 'package:flutter/material.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

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


  Size displaySize(BuildContext context) {
//  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
//  debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
//  debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;

//  I/flutter ( 5454): Width = 800.0
//  I/flutter ( 5454): Height = 1232.0
  }


  @override
  Widget build(BuildContext context) {

    Path customPath = Path()
      ..moveTo(20, 20)
      ..lineTo(50, 100)
      ..lineTo(20, 200)
      ..lineTo(100, 100)
      ..lineTo(20, 20);

    Path customPath2 = Path()
//    final p1 = Offset(50, 20);
//    final p2 = Offset(5, 20);
      ..moveTo(30, 20)
      ..lineTo(0, 20);

    Path customPath3 = Path()
//    final p1 = Offset(50, 20);
//    final p2 = Offset(5, 20);
      ..moveTo(displayWidth(context)/2, 120)
      ..lineTo(0, 120);



    Widget firstTest= new  Directionality(
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
          size:60,

        ),


      ),
    );


    Widget paidDelivery = new  Directionality(
      textDirection: TextDirection.ltr,
      child:
      Container(
        color:Colors.yellow,
        width:  displayWidth(context) / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(

//            color:Colors.yellow,

//            color:Colors.yellowAccent,
              height: 100,

              decoration: BoxDecoration(
                border: Border.all(

                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1.0,

                ),
                shape: BoxShape.circle,
                color: Colors.black,


              ),

              child: Icon(
//        getIconForName(orderTypeName),
//        IconData:
                Icons.thumb_up,
//        FontAwesomeIcons.bookmark,
                color: Colors.white,
                size: 80,

              ),


            ),

            //rounded rectangle border and text conted inside it begins here.


            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 3.6,
                ),
//                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(35.0),
//                    color: Colors.black,

              ),

              width:displayWidth(context)/3,
              height: 50,
              padding: EdgeInsets.fromLTRB(0,0,0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <
                    Widget>[
                  //  SizedBox(width: 5,),
                  Container(
                    padding: EdgeInsets.fromLTRB(0,3,0,0),
                    child: Text(
                      'paid',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
//                          color: Color(0xffF50303),
                        fontSize: 22, fontFamily: 'Itim-Regular',),
                    ),
                  ),
                  Text(
                    'delivery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
//                        color: Color(0xffF50303),
                      fontSize: 22, fontFamily: 'Itim-Regular',),
                  ),
                ],
              ),
            ),

            //rounded rectangle border and text conted inside it ends here.


          ],
        ),
      ),
    );

    Widget companyNameCustomerInformation = new  Directionality(

      textDirection: TextDirection.ltr,
      child:
      Container(
//        color:Colors.green,
        height:180,
        decoration: BoxDecoration(
          border: Border.all(

            color: Colors.black,
            style: BorderStyle.solid,
            width: 1.0,

          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(35.0),

        ),

//        margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
        width:  displayWidth(context) / 2,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[



              //rounded rectangle border and text conted inside it begins here.


                    Container(
                      height: 50,
                      child:
                          Container(
                            padding: EdgeInsets.fromLTRB(0,3,0,0),
                            child: Text(
                                'FoodItemName'.toLowerCase(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
//                                                      color: Colors.white
                                  color: Colors
                                      .black,
                                  fontFamily: 'Itim-Regular',

                                )
                            ),
                          ),


                      ),


                    // 1st row ends here.


                    Container(
                      height: 50,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <
                            Widget>[
                          //  SizedBox(width: 5,),
                          Container(
                            padding: EdgeInsets.fromLTRB(0,3,0,0),
                            child: Text(
                              'paid',
                              textAlign: TextAlign.center,
                              style: TextStyle(
//                        fontWeight: FontWeight.bold,
                                color: Colors.grey,
//                          color: Color(0xffF50303),
                                fontSize: 22, fontFamily: 'Itim-Regular',),
                            ),
                          ),
                          Text(
                            'delivery',
                            textAlign: TextAlign.center,
                            style: TextStyle(
//                      fontWeight: FontWeight.bold,
                              color: Colors.grey,
//                        color: Color(0xffF50303),
                              fontSize: 22, fontFamily: 'Itim-Regular',),
                          ),
                        ],
                      ),
                    ),


              /*
              DottedBorder(
//                dashPattern: [6, 3,2, 3],
                dashPattern: [9, 6,],
                customPath: (size) => customPath2,
                child: Text('abc',style:TextStyle(
                  color:Colors.indigo,
                )
                  ,),
              ),

              */
              /*
              DottedBorder(
                customPath: (size) => customPath, // PathBuilder
                color: Colors.indigo,
                dashPattern: [8, 4],
                strokeWidth: 2,
                child: Container(
                  height: 220,
                  width: 120,
                  color: Colors.green.withAlpha(20),
                ),
              ),

*/

//              DottedBorder(
//              child:StrokeCap.Butt),


              //2nd row ends here.


              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(0,0,0,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <
                      Widget>[
                    //  SizedBox(width: 5,),
                    Container(
                      padding: EdgeInsets.fromLTRB(0,3,0,0),
                      child: Text(
                        'paid',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
//                          color: Color(0xffF50303),
                          fontSize: 22, fontFamily: 'Itim-Regular',),
                      ),
                    ),
                    Text(
                      'delivery',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
//                        color: Color(0xffF50303),
                        fontSize: 22, fontFamily: 'Itim-Regular',),
                    ),
                  ],
                ),
              ),

              // total ends here.





            ],
          ),

      ),
    );

    Widget subTotalTotalDeliveryCost = new  Directionality(

      textDirection: TextDirection.ltr,
      child:
      Container(
//        color:Colors.green,
        height:180,

//        margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
        width:  displayWidth(context) / 2,
        child:
        DottedBorder(
          dashPattern: [9, 6,],
          color: Colors.black,
          strokeWidth: 3.6,
          borderType: BorderType.RRect,
          radius: Radius.circular(35),
//          strokeCap:StrokeCap.butt,
//        strokeCap: StrokeCap.round,
//          strokeCap: StrokeCap.square,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[



              //rounded rectangle border and text conted inside it begins here.


              DottedBorder(
//                dashPattern: [6, 3,2, 3],
                dashPattern: [9, 6,],
                customPath: (size) => customPath3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <
                            Widget>[
                          //  SizedBox(width: 5,),
                          Container(
                            padding: EdgeInsets.fromLTRB(0,3,0,0),
                            child: Text(
                              'paid',
                              textAlign: TextAlign.center,
                              style: TextStyle(
//                            fontWeight: FontWeight.bold,
                                color: Colors.grey,
//                          color: Color(0xffF50303),
                                fontSize: 22, fontFamily: 'Itim-Regular',),
                            ),
                          ),
                          Text(
                            'delivery',
                            textAlign: TextAlign.center,
                            style: TextStyle(
//                          fontWeight: FontWeight.bold,
                              color: Colors.grey,
//                        color: Color(0xffF50303),
                              fontSize: 22, fontFamily: 'Itim-Regular',),
                          ),
                        ],
                      ),
                    ),

                    // 1st row ends here.


                    Container(
                      height: 50,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <
                            Widget>[
                          //  SizedBox(width: 5,),
                          Container(
                            padding: EdgeInsets.fromLTRB(0,3,0,0),
                            child: Text(
                              'paid',
                              textAlign: TextAlign.center,
                              style: TextStyle(
//                        fontWeight: FontWeight.bold,
                                color: Colors.grey,
//                          color: Color(0xffF50303),
                                fontSize: 22, fontFamily: 'Itim-Regular',),
                            ),
                          ),
                          Text(
                            'delivery',
                            textAlign: TextAlign.center,
                            style: TextStyle(
//                      fontWeight: FontWeight.bold,
                              color: Colors.grey,
//                        color: Color(0xffF50303),
                              fontSize: 22, fontFamily: 'Itim-Regular',),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /*
              DottedBorder(
//                dashPattern: [6, 3,2, 3],
                dashPattern: [9, 6,],
                customPath: (size) => customPath2,
                child: Text('abc',style:TextStyle(
                  color:Colors.indigo,
                )
                  ,),
              ),

              */
              /*
              DottedBorder(
                customPath: (size) => customPath, // PathBuilder
                color: Colors.indigo,
                dashPattern: [8, 4],
                strokeWidth: 2,
                child: Container(
                  height: 220,
                  width: 120,
                  color: Colors.green.withAlpha(20),
                ),
              ),

*/

//              DottedBorder(
//              child:StrokeCap.Butt),


              //2nd row ends here.


              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(0,0,0,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <
                      Widget>[
                    //  SizedBox(width: 5,),
                    Container(
                      padding: EdgeInsets.fromLTRB(0,3,0,0),
                      child: Text(
                        'paid',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
//                          color: Color(0xffF50303),
                          fontSize: 22, fontFamily: 'Itim-Regular',),
                      ),
                    ),
                    Text(
                      'delivery',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
//                        color: Color(0xffF50303),
                        fontSize: 22, fontFamily: 'Itim-Regular',),
                    ),
                  ],
                ),
              ),

              // total ends here.





            ],
          ),
        ),
      ),
    );



    Widget unPaidDinningRoom = new  Directionality(
      textDirection: TextDirection.ltr,
      child:
      Container(
        color:Colors.blue,
        width:  displayWidth(context) / 1.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(

//            color:Colors.yellow,

//            color:Colors.yellowAccent,
              height:55,
              width:55,

              decoration: BoxDecoration(
                border: Border.all(

                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1.0,

                ),
                shape: BoxShape.circle,
                color: Colors.black,


              ),

              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,0,5,5),
                child: Icon(
//        getIconForName(orderTypeName),
//        IconData:
                  Icons.pan_tool,
//        FontAwesomeIcons.bookmark,
                  color: Colors.white,
                  size:40,

                ),
              ),


            ),

            //rounded rectangle border and text conted inside it begins here.


            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 3.6,
                ),
//                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(35.0),
//                    color: Colors.black,

              ),

              width:displayWidth(context)/3,
              height: 50,
              padding: EdgeInsets.fromLTRB(0,0,0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <
                    Widget>[
                  //  SizedBox(width: 5,),
                  Container(
                    padding: EdgeInsets.fromLTRB(0,3,0,0),
                    child: Text(
                      'unpaid',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
//                          color: Color(0xffF50303),
                        fontSize: 22, fontFamily: 'Itim-Regular',),
                    ),
                  ),
                  Text(
                    'dinning room',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
//                        color: Color(0xffF50303),
                      fontSize: 22, fontFamily: 'Itim-Regular',),
                  ),
                ],
              ),
            ),

            Container(

//            color:Colors.yellow,

//            color:Colors.yellowAccent,
              height:55,
              width:55,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
//                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                shape: BoxShape.circle,
                color: Colors.black,
              ),

              child: Icon(
//        getIconForName(orderTypeName),
//        IconData:
                Icons.local_dining,
//        FontAwesomeIcons.bookmark,
                color: Colors.white,
                size:40,

              ),


            ),

            //rounded rectangle border and text conted inside it ends here.


          ],
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
//                      onPressed:()=> createImageFromWidget(firstTest),
//                      onPressed:()=> createImageFromWidget(paidDelivery),
//                      onPressed:()=> createImageFromWidget(subTotalTotalDeliveryCost),

//                      onPressed:()=> createImageFromWidget(unPaidDinningRoom),
                      onPressed:()=> createImageFromWidget(companyNameCustomerInformation),

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
