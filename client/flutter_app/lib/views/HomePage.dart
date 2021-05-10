import 'package:flutter/material.dart';
import 'result.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController area = new TextEditingController();

  TextEditingController location = new TextEditingController();

  List rooms = ['1','2','3','4','5'];

  String bhk;
  String bathroom;


  String bmiresult = "20";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff212121),
        body: SafeArea(
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
                controller: area,
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
                onChanged: (value) {},
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
              child: ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                title: Text(
                  'Location',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 17.0,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),

            Card(
              color: Colors.green,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(bmiResult: bmiresult)),

                  );
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
        )),
      ),
    );
  }
}




















