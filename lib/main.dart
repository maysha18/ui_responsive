import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
    await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(320 ,780),
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter ScreenUtil Demo',
          home: MyHomePage(title: 'Flutter ScreenUtil Demo'),
        );
  });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isIncrementTrue=false;

TextEditingController textEditingController=TextEditingController();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _incHide();
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _incHide();
  }

void _incHide() {
    setState(() {
      isIncrementTrue = !isIncrementTrue;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title:
        Text(
  'Hello, Flutter!',
  style: TextStyle(fontSize: 24.sp),
)
        ,
      ),
      body: Center(
       
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100.w,
              height: 140.h,
              child: TextField(
                controller: textEditingController ,
              decoration: InputDecoration(
                labelText: "Enter text here..",
               
                
              
              ),
              ),
              
            ),
             Text(
              '$_counter',
              style: TextStyle(fontSize: 50.sp),
              
            ),
          ],
        ),
      ),
         floatingActionButton: Container(
        height: 140,
        child: Stack(
          children: <Widget>[
            Container(),
        isIncrementTrue?
           Align(
              alignment:isIncrementTrue? Alignment.bottomRight: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            )
           :
            Align(
              alignment:isIncrementTrue?Alignment.bottomRight : Alignment.topRight,
              child: FloatingActionButton(
                onPressed: _resetCounter,
                tooltip: 'Reset',
                child: Icon(Icons.refresh),
              ),
            )
          ],
        ),
      ),
    );
  }
}
