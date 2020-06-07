import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shoeapp/util/drawer_list_tile.dart';
import 'package:shoeapp/util/shoe_collection_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animation;
  bool isToggleed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  void toggle() {
    if (animation.isDismissed) {
      isToggleed = true;
      animation.forward();
    } else {
      isToggleed = false;
      animation.reverse();
    }
  }

  final double maxSlide = 225.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          double slide = maxSlide * animation.value;
          double scale = 1 - (animation.value * 0.3);
          return Material(
            child: Stack(
              children: <Widget>[
                AbsorbPointer(
                  absorbing: !isToggleed,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color(0xFF1F1B34),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 70.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 33.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/profile_photo.png'),
                                  radius: 30.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'Niraj Gupta',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          DrawerListTile(
                              icon: Icons.perm_identity, title: 'Profile'),
                          DrawerListTile(
                              icon: Icons.shopping_cart,
                              title: 'Shopping Cart'),
                          DrawerListTile(
                              icon: Icons.favorite_border, title: 'Favourite'),
                          DrawerListTile(
                              icon: Icons.notifications, title: 'Notification'),
                          DrawerListTile(icon: Icons.forward, title: 'Log out'),
                        ],
                      ),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      if (isToggleed) toggle();
                    },
                    child: AbsorbPointer(
                      absorbing: isToggleed,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(50.0 * animation.value)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: toggle,
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
//                            Container(
//                              margin: EdgeInsets.symmetric(horizontal: 20.0),
//                              padding: EdgeInsets.only(left: 20.0, top: 5.0),
//                              decoration: BoxDecoration(
//                                color: Color.fromARGB(255, 240, 240, 240),
//                                borderRadius: BorderRadius.all(
//                                  Radius.circular(30.0),
//                                ),
//                              ),
                              Neumorphic(
                                style: NeumorphicStyle(
                                  depth: -15,
                                  lightSource: LightSource.topLeft,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                padding: EdgeInsets.only(left: 20.0, top: 5.0),
                                child: TextField(
                                  cursorColor: Colors.black,
                                  style: TextStyle(fontSize: 16.0),
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    //TextField onChanged
                                  },
                                ),
                              ),
//                            ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  'New Collection',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      ShoeCollectionCard(
                                        color:
                                            Color.fromARGB(255, 182, 220, 210),
                                        imageSrc: 'assets/images/shoe6a.png',
                                        shoeName: 'Shoe 1',
                                        price: '299',
                                        heroTag: 'shoe1',
                                      ),
                                      ShoeCollectionCard(
                                        color:
                                            Color.fromARGB(255, 225, 225, 225),
                                        imageSrc: 'assets/images/shoe7a.png',
                                        shoeName: 'Shoe 2',
                                        price: '399',
                                        heroTag: 'shoe2',
                                      ),
                                      ShoeCollectionCard(
                                        color: Colors.red,
                                        imageSrc: 'assets/images/shoe4a.png',
                                        shoeName: 'Shoe 3',
                                        price: '349',
                                        heroTag: 'shoe3',
                                      ),
                                      ShoeCollectionCard(
                                        color: Colors.grey,
                                        imageSrc: 'assets/images/shoe5a.png',
                                        shoeName: 'Shoe 4',
                                        price: '399',
                                        heroTag: 'shoe4',
                                      ),
                                      ShoeCollectionCard(
                                        color: Colors.blue[700],
                                        imageSrc: 'assets/images/shoe1a.png',
                                        shoeName: 'Shoe 5',
                                        price: '249',
                                        heroTag: 'shoe5',
                                      ),
                                      ShoeCollectionCard(
                                        color: Color.fromARGB(255, 250, 63, 56),
                                        imageSrc: 'assets/images/shoe3a.png',
                                        shoeName: 'Shoe 6',
                                        price: '299',
                                        heroTag: 'shoe6',
                                      ),
                                      ShoeCollectionCard(
                                        color: Color.fromARGB(255, 110, 20, 50),
                                        imageSrc: 'assets/images/shoe2a.png',
                                        shoeName: 'Shoe 7',
                                        price: '149',
                                        heroTag: 'shoe7',
                                      ),
                                      ShoeCollectionCard(
                                        color:
                                            Color.fromARGB(255, 182, 220, 210),
                                        imageSrc: 'assets/images/shoe6a.png',
                                        shoeName: 'Shoe 1',
                                        price: '299',
                                        heroTag: 'shoe8',
                                      ),
                                      ShoeCollectionCard(
                                        color:
                                            Color.fromARGB(255, 225, 225, 225),
                                        imageSrc: 'assets/images/shoe7a.png',
                                        shoeName: 'Shoe 2',
                                        price: '399',
                                        heroTag: 'shoe9',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  'New Collection',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Container(
                                          width: 240.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0)),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('Shoe 1'),
                                                    Text(
                                                      '\$ 349',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/shoe4d.png'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Container(
                                          width: 240.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0)),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('Shoe 2'),
                                                    Text(
                                                      '\$ 299',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/shoe3d.png'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Container(
                                          width: 240.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0)),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('Shoe 3'),
                                                    Text(
                                                      '\$ 249',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/shoe1d.png'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Container(
                                          width: 240.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0)),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('Shoe 4'),
                                                    Text(
                                                      '\$ 299',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/shoe6d.png'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Container(
                                          width: 240.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0)),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('Shoe 5'),
                                                    Text(
                                                      '\$ 399',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/shoe7d.png'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
