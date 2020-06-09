import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShoePage extends StatelessWidget {
  final String imageSrc;
  final String heroTag;
  final String shoeName;
  final String price;
  ShoePage({this.imageSrc, this.heroTag, this.shoeName, this.price});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            //do someting
                          },
                          child: Container(
                            height: 70.0,
                            child: Icon(
                              Icons.menu,
                              color: Colors.black,
//                                              Color.fromARGB(255, 50, 190, 156),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/nike-logo.svg',
                          height: 70.0,
                        ),
                        Container(
                          height: 70.0,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Hero(
                    tag: heroTag,
                    child: Image(
                      width: 3 * MediaQuery.of(context).size.width / 4,
                      image: AssetImage(imageSrc),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          shoeName,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[400],
                          blurRadius: 30.0,
                          spreadRadius: 5.0),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '\$ $price',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.teal,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Center(
                                child: Text('Add to Cart'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
