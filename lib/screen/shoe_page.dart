import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShoePage extends StatelessWidget {
  final String imageSrc;
  final String heroTag;
  final String shoeName;
  ShoePage({this.imageSrc, this.heroTag, this.shoeName});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
