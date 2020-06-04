import 'package:flutter/material.dart';
import 'package:shoeapp/screen/shoe_page.dart';

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
    return AnimatedBuilder(
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
                  color: Color.fromARGB(255, 50, 190, 156),
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
                            icon: Icons.shopping_cart, title: 'Shopping Cart'),
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
                                        color:
                                            Color.fromARGB(255, 50, 190, 156),
                                      ),
                                    ),
                                  ),
                                  Image(
                                    height: 70.0,
                                    image: AssetImage(
                                        'assets/images/main_logo.png'),
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
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              padding: EdgeInsets.only(left: 20.0, top: 5.0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 240, 240),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                              ),
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
                            SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                                      color: Color.fromARGB(255, 182, 220, 210),
                                      imageSrc: 'assets/images/shoe6a.png',
                                      shoeName: 'Shoe 1',
                                      price: '299',
                                      heroTag: 'shoe1',
                                    ),
                                    ShoeCollectionCard(
                                      color: Color.fromARGB(255, 225, 225, 225),
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
                                      price: '349',
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
                                      color: Color.fromARGB(255, 182, 220, 210),
                                      imageSrc: 'assets/images/shoe6a.png',
                                      shoeName: 'Shoe 1',
                                      price: '299',
                                      heroTag: 'shoe8',
                                    ),
                                    ShoeCollectionCard(
                                      color: Color.fromARGB(255, 225, 225, 225),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                                color: Colors.yellow,
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
    );
  }
}

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
                      )));
        },
        child: Container(
          width: 180.0,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: heroTag,
                child: Image(
                  image: AssetImage(imageSrc),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  shoeName,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '\$ $price',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const DrawerListTile({
    this.icon,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 200.0,
      child: Align(
        alignment: Alignment.topLeft,
        child: InkWell(
          onTap: () {
            print('$title clicked');
          },
          child: Container(
            height: 40.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
