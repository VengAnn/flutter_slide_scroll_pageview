import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var listImage = [
    'https://heresajoke.com/wp-content/uploads/2023/06/Jokes-About-Basketball.jpg',
    'https://st3.depositphotos.com/3333565/19256/v/1600/depositphotos_192569576-stock-illustration-beach-volleyball-cartoon-people-character.jpg',
    'https://img.freepik.com/premium-photo/boy-red-shirt-with-number-2-it-walks-with-soccer-ball_853677-4637.jpg'
  ];

  int mySlideIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slide with image'),
      ),

      //body
      body: Column(
        children: [
          //
          const SizedBox(
            height: 200,
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.28,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      mySlideIndex = value;
                    });
                  },
                  itemCount: listImage.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(listImage[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          //

          //one more row
          SizedBox(
            //width: MediaQuery.of(context).size.width * 0.04,
            //height: MediaQuery.of(context).size.height * 0.02,
            height: 60,
            width: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listImage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index == mySlideIndex ? Colors.amber : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
