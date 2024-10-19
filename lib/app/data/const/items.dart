import 'package:flutter/material.dart';

final items =[
   Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1)
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/banner/banner1.png'), // Replace with your image asset
                      fit: BoxFit.cover,
                      
                    ),

                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1)
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/banner/banner2.png'), // Replace with your image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1)
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/banner/banner3.png'), // Replace with your image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
];