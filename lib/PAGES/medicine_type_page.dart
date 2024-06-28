
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class medicine_type extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Add New',
              style: TextStyle(
                  color: Colors.purple.shade700, fontWeight: FontWeight.w500)),
          backgroundColor: Colors.white,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xfff8bbd0),
                      Color(0xfffce4ec),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp)),
            padding: EdgeInsets.all(1.0),
            child: Column(children: [
              TextFormField(
                // maxLength: 12,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Medicine Name',
                  filled: false,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black54,
                      )),
                ),
              ),
              TextFormField(
                // maxLength: 12,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Dosage in mg',
                  filled: false,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black54,
                      )),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Column(children: [
                Text(
                  "Medicine Type",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Row(children: [
                  Column(children: [
                    Container(
                        width: 160.0,
                        height: 80.0,
                        child: Image(
                          image: AssetImage('assests/pill.jpeg'),
                          height: 7.0,
                        )),
                    Container(
                      width: 50.0,
                      height: 18.0,
                      decoration: BoxDecoration(
                        color: Colors.pink.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Pill',
                        ),
                      ),
                    )
                  ]),
                  Row(children: [
                    Column(
                        children: [
                          Container(
                              width: 80.0,
                              height: 80.0,
                              child: Image(
                                image: AssetImage('assests/bottle.png'),
                                height: 7.0,
                              )),
                          Container(
                            width: 50.0,
                            height: 18.0,
                            decoration: BoxDecoration(
                              color: Colors.pink.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Bottle',
                              ),
                            ),
                          )
                        ])
                  ]),
                  Row(children: [
                    Column(
                        children: [
                          Container(
                              width: 150.0,
                              height: 80.0,
                              child: Image(
                                image: AssetImage('assests/injection.jpeg'),
                                height: 7.0,
                              )),
                          Container(
                            width: 60.0,
                            height: 18.0,
                            decoration: BoxDecoration(
                              color: Colors.pink.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Injection',
                              ),
                            ),
                          )
                        ])
                  ])
                ])
              ]
              )
            ])
        )
    );
  }
}
