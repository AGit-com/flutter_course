import 'package:flutter_course/model/category.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_course/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_course/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constraints.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Course',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: kBlueColor),
              accountName: Text("Ayaan Javed"),
              accountEmail: Text("ayaanjaved@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Maths",
              ),
              leading: Icon(Icons.assessment),
            ),
            ListTile(
              title: Text("Physics"),
              leading: Icon(Icons.lightbulb_outline),
            )
          ],
        )),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: null,
          automaticallyImplyLeading: true,

          actions: [Image.asset("assets/images/user.png")],
          elevation: 10,
          backgroundColor: Hexcolor('#95a0fc'),
          centerTitle: false,
//          title: Text("Random Classes"),
        ),
        body: Stack(
          children: [
            Row(
              children: [Image.asset("assets/images/Ellipse 1circle.png")],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [Image.asset("assets/images/Ellipse 2circle.png")],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                Icon(Icons.menu),
//                Image.asset("assets/images/user.png")
//              ],
//            ),
//            SizedBox(
//              height: 30,
//            ),
                    Text(
                      "Hey Ayaan,",
                      style: kHeadingextStyle,
                    ),
                    Text(
                      "Find a subject you want to learn",
                      style: kSubheadingextStyle,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Hexcolor('#dfe1f5'),
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          showCursor: false,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 5),
                              hintText: "Search Subjects",
                              suffixIcon: Icon(Icons.search),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subjects",
                          style: kTitleTextStyle,
                        ),
                        Text(
                          "See All",
                          style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: StaggeredGridView.countBuilder(
                            itemCount: categories.length,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            crossAxisCount: 2,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: kBlueColor,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            categories[index].image)),
                                  ));
                            },
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1))),
                  ]),
            )
          ],
        ));
  }
}
