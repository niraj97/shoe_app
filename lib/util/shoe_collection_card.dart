import 'package:flutter/material.dart';
import 'package:shoeapp/screen/shoe_page.dart';

class ShoeCollectionCard extends StatelessWidget {
  final Color color;
  final String imageSrc;
  final String shoeName;
  final String price;
  final String heroTag;
  const ShoeCollectionCard({
    this.color,
    this.imageSrc,
    this.shoeName,
    this.price,
    this.heroTag,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          //function
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShoePage(
                        imageSrc: imageSrc,
                        heroTag: heroTag,
                        shoeName: shoeName,
                        price: price,
                      )));
        },
        child: Container(
          width: 180.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Stack(
            children: <Widget>[
              Hero(
                tag: heroTag,
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(imageSrc),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        shoeName,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                      Text(
                        '\$ $price',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
