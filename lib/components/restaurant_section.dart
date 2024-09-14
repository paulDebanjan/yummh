import 'package:flutter/material.dart';
//1
import 'restaurant_landscape_card.dart';
import '../models/restaurant.dart';

class RestaurantSection extends StatelessWidget {
  //2
  final List<Restaurant> restaurants;

  const RestaurantSection({
    super.key,
    required this.restaurants,
  });


  @override
  Widget build(BuildContext context) {
    //3
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //4
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            //5
            child: Text(
              'Food near me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // TODO: Add Restaurant ListView
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 300,
                  child:RestaurantLandscapeCard(restaurant: restaurants[index])
                );
              }
            )
          ),
          //6
          // Container(
          //   height: 400,
          //   // TODO: Add ListView here
          //   color: Colors.grey,
          // ),
        ]
      )
    );
  }
}
