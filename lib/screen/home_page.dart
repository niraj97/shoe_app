import 'package:flutter/material.dart';

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
              Container(
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
                              backgroundImage:
                                  AssetImage('assets/images/profile_photo.png'),
                              radius: 30.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Niraj Gupta',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
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
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    if (isToggleed) toggle();
                  },
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: toggle,
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
                                  image:
                                      AssetImage('assets/images/main_logo.png'),
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
                                  Card(
                                    color: Colors.blue,
                                    child: Container(
                                      width: 200.0,
                                      child: Column(
                                        children: <Widget>[
                                          Image(
                                            image: AssetImage(
                                                'assets/images/shoe1.png'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.yellow,
                                    child: Container(
                                      width: 200.0,
                                      child: Column(
                                        children: <Widget>[
                                          Shadow(
                                            offset: Offset(10, 10),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/shoe3.png'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(
                                      width: 200.0,
                                      child: Column(
                                        children: <Widget>[
                                          Image(
                                            image: AssetImage(
                                                'assets/images/shoe2.png'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.red,
                                    child: Container(
                                      width: 200.0,
                                      child: Column(
                                        children: <Widget>[
                                          Image(
                                            image: AssetImage(
                                                'assets/images/shoe4.png'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.yellow,
                                    child: Container(
                                      width: 200.0,
                                      child: Column(
                                        children: <Widget>[
                                          Image(
                                            image: AssetImage(
                                                'assets/images/shoe5.png'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.yellow,
                                    child: Container(
                                      width: 200.0,
                                      child: Column(
                                        children: <Widget>[
                                          Image(
                                            image: AssetImage(
                                                'assets/images/shoe6.png'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: Colors.yellow,
                                    child: Container(
                                      width: 200.0,
                                      child: Column(
                                        children: <Widget>[
                                          Image(
                                            image: AssetImage(
                                                'assets/images/shoe7.png'),
                                          ),
                                        ],
                                      ),
                                    ),
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
            ],
          ),
        );
      },
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

class Shadow extends StatelessWidget {
  final double opacity;
  final double scale;
  final Widget child;
  final Offset offset;

  Shadow({
    this.opacity,
    @required this.child,
    this.scale,
    this.offset,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: offset ?? Offset(5, 5),
          child: Transform.scale(
            scale: scale ?? 1,
            child: Opacity(opacity: opacity ?? 0.5, child: child),
          ),
        ),
        child,
      ],
    );
  }
}
