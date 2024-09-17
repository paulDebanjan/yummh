//1
import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../components/restaurant_item.dart';
//2
class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
//3
  const RestaurantPage({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}
//4
class _RestaurantPageState extends State<RestaurantPage> {
  // TODO: Add Desktop Threshold
  static const desktopThreshold = 700;
  // TODO: Add Constraint Properties
  // TODO: Calculate Constrained Width
  // TODO: Add Calculate Column Count
  int calculateColumnCount(double screenWidth) {
    return screenWidth >desktopThreshold ? 2 : 1;
  }
  // TODO: Build Custom Scroll View
  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        // TODO: Add Sliver App Bar
        _buildSliverAppBar(),
        // TODO: Add Restaurant Info Section

        _buildInfoSection(),
        // TODO: Add Menu Item Grid View Section
        _buildGridViewSection('Menu')
      ],
    );
  }
  // TODO: Build Sliver App Bar
  SliverAppBar _buildSliverAppBar() {
    //1
    return SliverAppBar(
      //2
      pinned: true,
      //3
      expandedHeight: 300.0,
      //4
      flexibleSpace: FlexibleSpaceBar(
        //5
        background: Center(
          //6
          child: Padding(
            padding: const EdgeInsets.only(
              left:16.0,
              right: 16.0,
              top: 64.0,
            ),
            //7
            child: Stack(
              children: [
               //8
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  //9
                    image: DecorationImage(image: AssetImage(widget.restaurant.imageUrl),fit: BoxFit.cover,
                    )
                  )
                ),
                //10
                const Positioned(
                  bottom: 0,
                  left: 16.0,
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.store, color: Colors.white),
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
  // TODO: Build Info Section
  //1
  SliverToBoxAdapter _buildInfoSection() {
    //2
    final textTheme = Theme.of(context).textTheme;
    //3
    final restaurant = widget.restaurant;
    //4
    return SliverToBoxAdapter(
      //5
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        //6
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //7
            Text(
              restaurant.name, style: textTheme.headlineLarge,
            ),
            Text(
              restaurant.address, style: textTheme.bodySmall,
            ),
            Text(
              restaurant.getRatingAndDistance(), style: textTheme.bodySmall,
            ),
            Text(restaurant.attributes, style: textTheme.labelSmall,)
          ]
        )
      )
    );
  }
  // TODO: Build Grid Item
  Widget _buildGridItem(int index) {
    final item = widget.restaurant.items[index];
    return InkWell(
      onTap: () {

      },
      child: RestaurantItem(item: item),
    );
  }
  // TODO: Build Section Title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )
    );
  }
  // TODO: Build Grid View
  GridView _buildGridView(int columns) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3.5,
        crossAxisCount: columns,
      ),
      itemBuilder: (context, index) => _buildGridItem(index),
      itemCount: (widget.restaurant.items.length),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
  // TODO: Build Grid View Section
  SliverToBoxAdapter _buildGridViewSection(String title) {
    final columns = calculateColumnCount(MediaQuery.of(context).size.width);
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(title),
            _buildGridView(columns)
          ]
        )
      )
    );
  }
  // TODO: Replace build method

  @override
  Widget build(BuildContext context) {
   //5
    return Scaffold(
      body: Center (
        child: _buildCustomScrollView(),
      )
    );
  }
}
