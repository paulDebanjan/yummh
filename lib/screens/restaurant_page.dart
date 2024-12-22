//1
import 'package:flutter/material.dart';
import 'package:yummh/components/item_details.dart';
import 'package:yummh/models/cart_manager.dart';
import 'package:yummh/models/order_manager.dart';
import 'package:yummh/screens/checkout_page.dart';
import '../models/restaurant.dart';
import '../components/restaurant_item.dart';

//2
class RestaurantPage extends StatefulWidget {
  final OrderManager orderManager;
  final CartManager cartManager;

  final Restaurant restaurant;
//3
  const RestaurantPage({
    super.key,
    required this.restaurant,
    required this.orderManager,
    required this.cartManager,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

//4
class _RestaurantPageState extends State<RestaurantPage> {
  // TODO: Add Desktop Threshold
  static const desktopThreshold = 700;
  // TODO: Define Scaffold Key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // TODO: Add Constraint Properties
  // TODO: Calculate Constrained Width
  // TODO: Add Calculate Column Count
  // TODO: Define Drawer Max Width
  static const double drawerWidth = 375.0;

  int calculateColumnCount(double screenWidth) {
    return screenWidth > desktopThreshold ? 2 : 1;
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
                      left: 16.0,
                      right: 16.0,
                      top: 64.0,
                    ),
                    //7
                    child: Stack(children: [
                      //8
                      Container(
                          margin: const EdgeInsets.only(bottom: 30.0),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(16.0),
                              //9
                              image: DecorationImage(
                                image: AssetImage(widget.restaurant.imageUrl),
                                fit: BoxFit.cover,
                              ))),
                      //10
                      const Positioned(
                          bottom: 0,
                          left: 16.0,
                          child: CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.store, color: Colors.white),
                          ))
                    ])))));
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //7
              Text(
                restaurant.name,
                style: textTheme.headlineLarge,
              ),
              Text(
                restaurant.address,
                style: textTheme.bodySmall,
              ),
              Text(
                restaurant.getRatingAndDistance(),
                style: textTheme.bodySmall,
              ),
              Text(
                restaurant.attributes,
                style: textTheme.labelSmall,
              )
            ])));
  }

  // TODO: Build Grid Item
  Widget _buildGridItem(int index) {
    final item = widget.restaurant.items[index];
    return InkWell(
      onTap: () => _showBottomSheet(item),
      child: RestaurantItem(item: item),
    );
  }

  // TODO: Build Section Title
  Widget _sectionTitle(String title) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ));
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
                children: [_sectionTitle(title), _buildGridView(columns)])));
  }
  // TODO: Replace build method

  //Show Bottom Sheet
  void _showBottomSheet(Item item) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        constraints: const BoxConstraints(maxWidth: 480),
        builder: (context) => ItemDetails(
            item: item,
            cartManager: widget.cartManager,
            quantityUndated: () {
              setState(() {});
            }));
  }

  // TODO: Create Drawer
  Widget _buildEndDrawer() {
    return SizedBox(
      width: drawerWidth,
      // TODO: Replace with Checkout Page

      child: Drawer(
        child: CheckoutPage(
          cartManager: widget.cartManager,
          didUpdate: () {
            setState(() {
              
            });
          },
          onSubmit: (order) {
            widget.orderManager.addOrder(order);
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
    );
  }

  // TODO: Open Drawer
  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  // TODO: Create Floating Action Button
  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: openDrawer,
      tooltip: 'Cart',
      icon: const Icon(Icons.shopping_cart),
      label: Text('${widget.cartManager.items.length} items in cart'),
    );
  }

  @override
  Widget build(BuildContext context) {
    //5
    return Scaffold(
        // TODO: Add Scaffold Key
        key: scaffoldKey,

        // TODO: Apply Drawer
        endDrawer: _buildEndDrawer(),
        // TODO: Apply Floating Action Button
        floatingActionButton: _buildFloatingActionButton(),
        body: Center(
          child: _buildCustomScrollView(),
        ));
  }
}
