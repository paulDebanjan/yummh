import 'package:flutter/material.dart';
import 'package:yummh/models/cart_manager.dart';
import 'package:yummh/models/order_manager.dart';

import '../api/mock_yummy_service.dart';
import '../components/restaurant_section.dart';
import '../components/category_section.dart';
import '../components/post_section.dart';

class ExplorePage extends StatefulWidget {
  final CartManager cartManager;
  final OrderManager orderManager;

  const ExplorePage({
    super.key,
    required this.cartManager,
    required this.orderManager,
  });

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late Future<ExploreData> _exploreDataFuture;
  final mockService = MockYummyService();
  @override
  void initState() {
    super.initState();
    _exploreDataFuture = mockService.getExploreData(); // Load data once
  }
  //1
  @override
  Widget build(BuildContext context) {
    // TODO: Add Listview Future Builder
    //1
    return FutureBuilder(
      //2
      future: _exploreDataFuture,
      //3
      builder: (context, AsyncSnapshot<ExploreData> snapshot){
        //4
        if(snapshot.connectionState == ConnectionState.done){
          //5
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ??[];
          final posts = snapshot.data?.friendPosts ?? [];
          // TODO: Replace this with restaurant section
          // TODO: Wrap in a ListView
          //1
          return ListView(
            //2
            shrinkWrap: true,
            //3
            scrollDirection: Axis.vertical,
            //4
            children: [
              RestaurantSection(restaurants: restaurants,cartManager: widget.cartManager,orderManager: widget.orderManager,),
              // TODO: Add Category Section
              CategorySection(categories: categories),
              //TODO: Add Post Section
              PostSection(posts: posts),
            ]
          );
        } else {
          //6
          return const Center(
            child:  CircularProgressIndicator(),
          );
        }
      }
    );
  }
}
