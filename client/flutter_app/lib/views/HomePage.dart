import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapp/Utilities/constants.dart';
import 'LoadingScreen.dart';
import 'result.dart';
import 'package:http/http.dart'as http;
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  Future getEstimate(double area,int bhk, int bathroom, String location)async{

    print("1************");
    try {
      print("try++++++++++");
      final response = await http.get(Uri.parse(
          'http://127.0.0.1:5000/predict_home_price?location=$location&total_sqft=$area&bhk=$bhk&bath=$bathroom'));
      print("api parsed sucessfully");
      if (response.statusCode == 200) {
        print("2***********");
        String data = response.body;
        var decodedata = jsonDecode(data);
        print(decodedata['estimated_price']);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ResultsPage(bmiResult: decodedata['estimated_price'])),);
        return decodedata['estimated_price'];
      } else {
        print("3++++++++++++++++++");
        print(response.statusCode);
      }
    }
    catch(e){
      print("in catch ");
      print(e);
    }

  }



  List rooms = ['1','2','3','4','5'];
  String area;
  String bhk;
  String bathroom;
  String location;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff212121),
        body: SafeArea(

              child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

                Image.asset(
                  'assets/house.png',
                  height: 100,
                ),
                // CircleAvatar(
                //   radius: 50.0,
                //   backgroundImage: AssetImage("assets/house.png"),
                // ),

                Container(
                  //height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/house.png"),
                          fit: BoxFit.fitHeight)),
                ),

                SizedBox(
                  height: 20.0,
                  width: 150.0,
//                  child: Divider(
//                    color: Colors.white,
//                  ),
                ),
                Text(
                  "Bangalore House Price",
                  //args.user_name,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                  width: 150.0,
//                  child: Divider(
//                    color: Colors.white,
//                  ),
                ),
                Text(
                  "Made with ❤ by Arunoday Kumar",
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.white,
                    fontSize: 10.0,
                    letterSpacing: 2.5,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),












                Card(
                  color: Color(0xff373737),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),

                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: TextField(
                   //controller: area,
                    style: TextStyle(
                      color: Colors.white,
                    ),

                    decoration: InputDecoration(
//                  enabledBorder: const OutlineInputBorder(
//                    borderSide: const BorderSide(color: Colors.grey, width: 0.0),
//                  ),
                      prefixIcon: Icon(
                        Icons.square_foot,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Color(0xff373737),
                      labelText: "Area (Square Feet)",
                      labelStyle: TextStyle(

                          color: Colors.grey,

                      ),


                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.green, width: 0.0),
                      )
                    ),
                    onChanged: (value) {
                      area = value;
                    },
                  ),

                  ),




                Card(
                  color: Color(0xff373737),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        child: Icon(
                          Icons.king_bed,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text("BHK",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          dropdownColor: Colors.grey,



                          icon: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_drop_down,

                            ),
                          ),
                          iconSize: 36,

                          //isExpanded: false,
                          underline: SizedBox(),
                          value: bhk,
                          onChanged: (newValue){
                            setState(() {
                              bhk = newValue;
                            });
                          },
                          items: rooms.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(
                                valueItem,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),


                            );
                          }).toList(),
                      ),),
                    ],


                  ),
                ),


                Card(
                  color: Color(0xff373737),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        child: Icon(
                        Icons.bathtub,
                        color: Colors.white,
                      ),
                      ),

                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text("Bathroom",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                          ),
                          dropdownColor: Colors.grey,



                          icon: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_drop_down,

                            ),
                          ),
                          iconSize: 36,

                          //isExpanded: false,
                           underline: SizedBox(),
                          value: bathroom,
                      onChanged: (newValue){
                        setState(() {
                          bathroom = newValue;
                        });
                      },

                            items: rooms.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem,
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                        );
                      }).toList(),


                        ),
                      ),
                    ],


                  ),
                ),

                Card(
                  color: Color(0xff373737),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text("Location",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          dropdownColor: Colors.grey,



                          icon: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_drop_down,

                            ),
                          ),
                          iconSize: 36,

                          //isExpanded: false,
                          underline: SizedBox(),
                          value: location,
                          onChanged: (newValue){
                            setState(() {
                              location = newValue;
                            });
                          },

                          items: locations.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem,
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                            );
                          }).toList(),


                        ),
                      ),
                    ],


                  ),
                ),



                Card(
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
                  child: ListTile(
                    onTap: () {
                      print(area);
                      print(bhk);
                      print(location);
                      print(bathroom);

                      print("going to navigate to loading screen");

                      //showAlertDialog(context);
                      int area_int = int. parse(area);
                      int bhk_int = int. parse(bhk);
                      int bathroom_int = int. parse(bathroom);


                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoadingScreen(area: area_int, bhk: bhk_int, bathroom: bathroom_int, location: location)),);
                    },
                    title: Center(
                      child: Text(
                        'Estimate Price',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ),
                ),
          ],
        ),
              ),
            ),
      ),
    );
  }
}


showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = Row(
    children: [
      TextButton(
        child: Text("ok"),
        onPressed: () {Navigator.pop(context);},
      ),
      TextButton(
        child: Text("Again"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()),);
        },
      )
    ],
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete"),
    content: Text("is the Predicted price in Lakhs"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

















