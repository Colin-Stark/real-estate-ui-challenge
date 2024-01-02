import 'package:estate/constant.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String imaglink, location, descrip;
  final double rating, price;

  const Description(
      {super.key,
      required this.imaglink,
      required this.rating,
      required this.location,
      required this.descrip,
      required this.price});

  @override
  Widget build(BuildContext context) {
    Size cz = MediaQuery.of(context).size;
    ValueNotifier<bool> likeNotifier = ValueNotifier<bool>(false);
    int fullStars = rating.floor();
    double remainingStars = rating - fullStars;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(logo),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: cz.height / 3,
                width: cz.width,
                child: Hero(
                  tag: 'loneimage',
                  child: Image.network(
                    imaglink,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: cz.width / 30),
                child: SizedBox(
                  height: cz.height / 15,
                  width: cz.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < fullStars; i++)
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: cz.height / 20,
                        ),

                      if (remainingStars > 0)
                        Stack(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange.shade100,
                              size: cz.height / 20,
                            ),
                            ClipRect(
                              clipper: MyClipper(remainingStars),
                              child: Icon(
                                Icons.star_half,
                                color: Colors.orange,
                                size: cz.height / 20,
                              ),
                            ),
                          ],
                        ),

                      // Remaining grey stars
                      for (int i = fullStars + (remainingStars > 0 ? 1 : 0);
                          i < 5;
                          i++)
                        Icon(
                          Icons.star,
                          color: Colors.orange.shade100,
                          size: cz.height / 20,
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cz.width / 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: cz.height / 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: likeNotifier,
                        builder: (context, value, child) {
                          return IconButton(
                              onPressed: () {
                                likeNotifier.value = !likeNotifier.value;
                              },
                              icon: value
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(Icons.favorite_outline));
                        },
                      ),
                      // Icon(
                      //   Icons.favorite_outline,
                      //   color: likey == true ? Colors.red : Colors.transparent,
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: cz.height / 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: cz.width / 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontSize: cz.height / 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cz.width / 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: cz.height / 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          descrip,
                          style: TextStyle(
                            fontSize: cz.height / 50,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Read More',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: cz.height / 50,
                              color: Color(
                                tealColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cz.width / 20),
                child: SizedBox(
                  height: cz.height / 5,
                  width: cz.width,
                  child: Image.asset(
                    'assets/map.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: cz.width / 20),
                child: SizedBox(
                  height: cz.height / 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Price',
                          ),
                          Text(
                            '\$${price.toInt().toString()}',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: cz.height / 45,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: cz.width / 3,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Color(tealColor),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Pay now',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  final double clipPercentage;

  MyClipper(this.clipPercentage);

  @override
  Rect getClip(Size size) {
    double width = size.width * clipPercentage;
    return Rect.fromLTRB(0.0, 0.0, width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
