import 'package:flutter/material.dart';

class ShoePage extends StatelessWidget {
  final String imageSrc;
  final String heroTag;
  ShoePage({this.imageSrc, this.heroTag});
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
                        //function drawer
                      },
                      child: Container(
                        height: 70.0,
                        child: Icon(
                          Icons.menu,
                          color: Color.fromARGB(255, 50, 190, 156),
                        ),
                      ),
                    ),
                    Image(
                      height: 70.0,
                      image: AssetImage('assets/images/main_logo.png'),
                    ),
                    Container(
                      height: 70.0,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Color.fromARGB(255, 50, 190, 156),
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
            ],
          ),
        ),
      ),
    );
  }
}
