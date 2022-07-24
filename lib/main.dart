import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'formresults.dart';

void main() {
  runApp(MaterialApp(home:  MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool checkstate = false;

  //const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> fromstate = GlobalKey();
    TextEditingController controller = TextEditingController();
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    TextEditingController controller5 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Forms'),
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Form(
            key: fromstate,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Required Value';
                      }else if(value.length < 3){
                        return "your content must be more than 3 characters";
                      }
                    },
                    controller: controller ,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                      hintText: 'Name',

                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Required Value';
                      }else if(value.length < 10){
                        return "your content must be more than 10 characters";
                      }
                    },
                    controller: controller1 ,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                      hintText: 'E-mail',

                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 230,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Required Value';
                          }else if(value.length == 10){
                            return "your content must be 10 numbers";
                          }
                        },
                        controller: controller2 ,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Colors.grey.withOpacity(0.2),
                          filled: true,
                          hintText: 'Phone',

                        ),
                      ),
                    ),
                    CountryCodePicker(
                      initialSelection: 'ps',
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Required Value';
                      }else if(value.length < 3){
                        return "your content must be more than 3 characters";
                      }
                    },
                    controller: controller3 ,
                    decoration: InputDecoration(
                      labelText: 'Country',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                      hintText: 'Country',

                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Required Value';
                      }else if(value.length < 3){
                        return "your content must be more than 3 characters";
                      }
                    },
                    controller: controller5 ,
                    decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                      hintText: 'City',

                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Accept Conditions',style: TextStyle(fontSize: 17),),
                      Checkbox(
                        value: checkstate,
                        onChanged: (value){
                          checkstate = value!;
                          setState((){});
                        },
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    if(fromstate.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return FormResults();
                      }));
                      controller.text = "";
                      controller1.text = "";
                      controller2.text = "";
                      controller3.text = "";
                      controller4.text = "";
                      checkstate = false;
                    }
                  },
                  child: const Text('Confirm Your Form'),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}