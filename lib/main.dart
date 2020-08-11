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

class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    this.userLiked = !this.userLiked;
    if (userLiked) {
      this.likes += 1;
    } else {
      this.likes -= 1;
    }
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = "asdfasdf0";
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, "Ayaan"));
    });
  }

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
                "Computer Organisation",
              ),
              leading: Icon(Icons.computer),
            ),
            ListTile(
              title: Text("SQL"),
              leading: Icon(Icons.data_usage),
            ),
            ListTile(title: Text("Python"), leading: Icon(Icons.add))
          ],
        )),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Placement Wale"),
          titleSpacing: NavigationToolbar.kMiddleSpacing,
          leading: null,
          automaticallyImplyLeading: true,
          actions: [Image.asset("assets/images/finalusericon.png")],
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
                          child: TextInputWidget(this.newPost)),
                    ),
                    Expanded(
                      child: PostList(posts),
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
                                  margin: EdgeInsets.all(8),
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Hexcolor("#fffff"),
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
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

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        textAlignVertical: TextAlignVertical.center,
        showCursor: false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            hintText: "Search Subjects",
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search",
              splashColor: kBlueColor,
              splashRadius: 30,
              onPressed: this.click,
            ),
            border: UnderlineInputBorder(borderSide: BorderSide.none)),
        controller: this.controller,
      ),
    ]);
  }
}

class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Card(
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(post.body),
                  subtitle: Text(post.author),
                ),
              ),
              Row(children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: post.likePost,
                )
              ])
            ],
          ),
        );
      },
    );
  }
}
