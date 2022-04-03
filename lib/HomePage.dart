import 'package:clubhoseclone/MODAL/CardModal.dart';
import 'package:clubhoseclone/UTILS/AppColors.dart';
import 'package:clubhoseclone/UTILS/CardData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  List<CardModal> list = cardList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ClubHouse',
            style: TextStyle(
                color: Colors.white60,
                fontFamily: 'SourceSansPro-Bold'),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(CupertinoIcons.search),
            onPressed: () {
              Navigator.of(context).pushNamed('/explore');
            },
          ),
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.envelope_open),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(CupertinoIcons.calendar),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(CupertinoIcons.bell),
              onPressed: () {
                Navigator.of(context).pushNamed('/activity');
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    width: 30,
                    height: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        'https://robohash.org/c1d5c8fd6bebe69a340254e5b4ad7b89?set=set4&bgset=&size=400x400',
                        fit: BoxFit.fitWidth,
                        width: 100,
                        height: 100,
                      ),
                    )),
              ),
            )
          ],
        ),
        body: Stack(alignment: Alignment.center, children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 120.0),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return card(list[index], context);
            },
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                          color: AppColor.secondryColor,
                          borderRadius: BorderRadius.circular(20.0)),
                      height: MediaQuery.of(context).size.height / 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Wrap(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        width: 100,
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.network(
                                            'https://picsum.photos/seed/692/600',
                                            fit: BoxFit.fitWidth,
                                            width: 60,
                                            height: 60,
                                          ),
                                        )),
                                    Text(
                                      "Open",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                        width: 100,
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.network(
                                            'https://picsum.photos/seed/692/600',
                                            fit: BoxFit.fitWidth,
                                            width: 60,
                                            height: 60,
                                          ),
                                        )),
                                    Text(
                                      "Social",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                        width: 100,
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.network(
                                            'https://picsum.photos/seed/692/600',
                                            fit: BoxFit.fitWidth,
                                            width: 60,
                                            height: 60,
                                          ),
                                        )),
                                    Text(
                                      "Closed",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            Text("Start a room Open to everyone"),
                            RaisedButton(
                              onPressed: () {},
                              textColor: Colors.white,
                              color: AppColor.green,
                              child: Text("Let's go",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 13.6,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColor.green,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child: Icon(
                      CupertinoIcons.add,
                      size: 20,
                      color: Colors.white,
                    )),
                    TextSpan(
                        text: ' Start a room',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ))
                  ])),
                )),
          ),
          Positioned(
              bottom: 60.0,
              left: 50.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/available');
                      },
                      icon: Icon(CupertinoIcons.circle_grid_3x3_fill)),
                  Positioned(
                      right: 4.0,
                      bottom: 11.0,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.green,
                        ),
                      )),
                ],
              )),
          Positioned(
              bottom: 60.0,
              right: 50.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/chat');
                      },
                      icon: Icon(Icons.send)),
                ],
              )),
        ])

        // Center(
        //   child: Container(
        //     height: 200.0,
        //     width: 200.0,
        //     child: Text("Hello World"),
        //     decoration: BoxDecoration(
        //         color: Theme.of(context).accentColor,
        //         borderRadius: BorderRadius.circular(25.0)),
        //   ),
        // ),
        );
  }
}

Widget card(CardModal item, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed('/room');
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200.0,
        width: 200.0,
        decoration: BoxDecoration(
            color: AppColor.secondryColor,
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: EdgeInsets.only(left: 30, top: 5.0, bottom: 4.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      item.heading,
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(
                      Icons.home,
                      color: AppColor.green,
                    ),
                  ],
                ),
                Text(item.mainHeading,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Stack(clipBehavior: Clip.none, children: <Widget>[
                    Positioned(
                      top: 20,
                      left: 10,
                      child: Container(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              'https://picsum.photos/seed/692/600',
                              fit: BoxFit.fitWidth,
                              width: 100,
                              height: 100,
                            ),
                          )),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:
                            Image.network('https://picsum.photos/seed/901/600'),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.speakerNames[0]),
                        Text(item.speakerNames[1]),
                        Text(item.speakerNames[2]),
                        Text(item.speakerNames[3]),
                        Row(
                          children: [
                            Text(item.listenersNumber.toString()),
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 25,
                            ),
                            Text("/"),
                            Text(item.speakersNumber.toString()),
                            Icon(Icons.chat, color: Colors.grey)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ])
              ]),
        ),
      ),
    ),
  );
}
