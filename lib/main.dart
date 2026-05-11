import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   var wtcontroller = TextEditingController();
   var ftcontroller = TextEditingController();
   var inccontroller = TextEditingController();

   var result = "";
   var bgcolor = Colors.purple.shade50;


   


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text("BMI Calculater" ,style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),)),
      ),
      body: Container(
        // color: bgcolor,

        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xffffecd2),Color(0xfffcb69f),Color(0xfff9b7e)
                  // Colors.orange,
                  // Colors.pink,
                  // Colors.green
                ],
              begin: FractionalOffset(1.0, 0.5),
                end: FractionalOffset(0.0, 0.5),
              stops: [0.0,0.5,1.0]

            )
        ),

        child: Center(

          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("BMI" , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                SizedBox(height: 12,),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    label: Text("Enter the Weight"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                )
                ,
                SizedBox(height: 12,),

                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                      label: Text("Enter the Height"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 12,),
                TextField(
                  controller: inccontroller,
                  decoration: InputDecoration(
                      label: Text("Enter the height in Inchs"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                ElevatedButton(onPressed: (){
                  var wt = wtcontroller.text.toString();
                  var ht = ftcontroller.text.toString();
                  var inchs = inccontroller.text.toString();


                  if(wt!="" && ht!="" && inchs!=""){


                    var iwt = int.parse(wt);
                    var ift = int.parse(ht);
                    var iinch = int.parse(inchs);

                    var tInch = (ift*12) + iinch;
                    var tcms = tInch*2.54;
                    var tm = tcms/100;

                    var bmi = iwt/(tm+tm);
                    var  msg = "";


                    if(bmi > 25 ){
                      msg = "You are overweight";
                      bgcolor = Colors.orange;

                    }else if (bmi < 18) {
                      msg = "You are underweight";
                      bgcolor = Colors.pink;

                    }else{
                      msg = "You are Good";
                      bgcolor = Colors.green;
                    }

                    setState(() {
                      result = "$msg \n Your Bmi is: ${bmi.toStringAsFixed(2)}";
                    });



                  }else{
                    setState(() {
                      result = "Please enter all the value";
                    });


                  }




                }
                    , child: Text("Calculate" )),
                Text(result , style: TextStyle(fontSize: 15),)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
