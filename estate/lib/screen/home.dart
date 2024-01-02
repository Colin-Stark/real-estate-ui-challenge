import 'dart:ui';

import 'package:estate/constant.dart';
import 'package:estate/screen/desc.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final List<Map<String, dynamic>> mydata = [
    {
      "imageLink":
          "https://images.unsplash.com/photo-1507089947368-19c1da9775ae?q=80&w=2076&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "Location": "Abu Dhabi, Dubai",
      "Price": 400.00,
      "payment-type": "Monthly",
      "Star": 3.8
    },
    {
      "imageLink":
          "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "Location": "Toronto, Canada",
      "Price": 1500.00,
      "payment-type": "Monthly",
      "Star": 4.0,
      "description":
          "Nestled in the vibrant city of Toronto, Canada, this property offers a perfect blend of comfort and style. The monthly rental rate is \$1500, providing an affordable and convenient living option. The accommodation boasts a commendable 4.0-Star rating, reflecting the quality and satisfaction it offers to residents. With a prime location and a visually appealing ambiance, this property is an ideal choice for those seeking a delightful living experience in Toronto."
    },
    {
      "imageLink":
          "https://images.unsplash.com/photo-1519643381401-22c77e60520e?q=80&w=2073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "Location": "North Carolina, USA",
      "Price": 800.00,
      "payment-type": "Monthly",
      "Star": 4.4
    },
    {
      "imageLink":
          "https://images.unsplash.com/photo-1505843513577-22bb7d21e455?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "Location": "Santorini, Greece",
      "Price": 35000.00,
      "payment-type": "Yearly",
      "Star": 4.7
    },
    {
      "imageLink":
          "https://images.unsplash.com/photo-1506126279646-a697353d3166?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "Location": "Miami florida, USA",
      "Price": 55000.00,
      "payment-type": "Yearly",
      "Star": 5.0
    },
    {
      "imageLink":
          "https://images.unsplash.com/photo-1590725121839-892b458a74fe?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "Location": "Birmingham, England",
      "Price": 45000.00,
      "payment-type": "Yearly",
      "Star": 2.9
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size cz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Image.asset(logo),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              Icons.notifications_none_outlined,
              size: cz.height / 25,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cz.width / 15),
          child: Column(
            children: [
              SizedBox(
                height: cz.height / 20,
              ),
              SizedBox(
                height: cz.height / 10,
                width: cz.width,
                child: GestureDetector(
                  onTap: () {},
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search',
                      prefix: SizedBox(
                        width: cz.width / 15,
                      ),
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.multiply,
                    ),
                    child: Container(
                      height: cz.height / 8,
                      width: cz.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(mydata.first["imageLink"]),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: cz.height / 8,
                    width: cz.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: cz.width / 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Let\'s buy a house \nhere',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: cz.height / 45,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Diskon 10%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: cz.height / 55,
                                ),
                              ),
                              Text(
                                '31 December 2023',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: cz.height / 55,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: cz.height / 35),
                child: InkWell(
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Description(
                        imaglink: mydata[1]["imageLink"].toString(),
                        rating: mydata[1]["Star"],
                        location: mydata[1]["Location"],
                        descrip: mydata[1]['description'],
                        price: mydata[1]["Price"],
                      ),
                    ),
                    (route) => route.isFirst,
                  ),
                  child: Container(
                    height: cz.height / 4,
                    width: cz.width,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Hero(
                            tag: 'loneimage',
                            child: Image.network(
                              mydata[1]["imageLink"],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: 0.33,
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5,
                                  sigmaY: 5,
                                ),
                                child: Container(
                                  width: cz.width,
                                  color: Colors.black.withOpacity(0.3),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: cz.width / 20,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              mydata[1]["Location"],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: cz.height / 55,
                                              ),
                                            ),
                                            ActionChip(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              avatar: const Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                              ),
                                              label: Text(
                                                mydata[1]["Star"].toString(),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$ ${mydata[1]["Price"].toInt().toString()} / ${mydata[1]["payment-type"]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: cz.height / 55,
                                              ),
                                            ),
                                            Text(
                                              '1 room mate',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: cz.height / 55,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
