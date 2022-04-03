import 'package:clubhoseclone/MODAL/RoomModal.dart';
import 'package:clubhoseclone/UTILS/RoomData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Room extends StatefulWidget {
  const Room({Key? key}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  List<RoomModal> list = roomList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text("Hallway"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.doc)),
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
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  list[index].roomName,
                  style: TextStyle(fontSize: 10),
                ),
              );
            }
            if (index == 1) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Social Media Expert",
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
            if (index == 2) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 170,
                            childAspectRatio: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        shrinkWrap: true,
                        itemCount: list[0].speakers.length,
                        itemBuilder: (context, i) {
                          return Container(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(list[0].speakers[i]),
                            ),
                          );
                        }),
                  ],
                ),
              );
            }
            if (index == 3) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Followed by speaker"),
              );
            }
            if (index == 4) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:
                            Image.asset('assets/images/img1.jpg'),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:
                        Image.asset('assets/images/img2.jpg'),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:
                        Image.asset('assets/images/img3.jpg'),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:
                        Image.asset('assets/images/img4.jpg'),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:
                        Image.asset('assets/images/img5.jpg'),
                      ),
                    )
                  ],
                ),
              );
            }
            if (index == 5) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Others in the room"),
              );
            }
            if (index == 6) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:
                        Image.asset('assets/images/img6.jpg'),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:
                        Image.asset('assets/images/img7.jpg'),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:
                        Image.asset('assets/images/img8.jpg'),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child:
                        Image.asset('assets/images/img9.jpg'),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Text("....");
          }),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget bottomNavBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Chip(
              label: Text(
                'Leave quietly',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              avatar: CircleAvatar(),
            ),
          ),
          Row(
            children: [
              Chip(avatar: Icon(Icons.add), label: Text('')),
              Chip(
                avatar: Icon(Icons.handyman),
                label: Text(''),
              )
            ],
          )
        ],
      ),
    );
  }
}
