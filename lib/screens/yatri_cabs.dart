import 'package:flutter/material.dart';
import 'package:yatri_cab/screens/widgets/carousel_image.dart';
import 'package:yatri_cab/screens/widgets/trip_option.dart';

class YatriCabsPage extends StatefulWidget {
  const YatriCabsPage({super.key});

  @override
  State<YatriCabsPage> createState() => _YatriCabsPageState();
}

class _YatriCabsPageState extends State<YatriCabsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/yatri_cabs_logo.png', 
          width: 200,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
              color: Color.fromARGB(255, 250, 250, 250),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: const TextSpan(
                text: "India's Leading ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Inter-City\n',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  TextSpan(
                    text: 'One Way',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  TextSpan(
                    text: ' Cab Service Provider',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            const CarouselImage(),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            TripOptions(),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 398, 
                height: 180,
                padding:
                    const EdgeInsets.all(30), 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), 
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/download.png',
                    ), 
                    fit: BoxFit.fill, 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        backgroundColor: Colors.green,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'My Trip',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_outlined),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
