import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/cart_manager.dart';
import '../models/restaurant.dart';
import 'cart_control.dart';

class ItemDetails extends StatefulWidget {
  final Item item;
  final CartManager cartManager;
  final void Function() quantityUndated;
  const ItemDetails({
    super.key,
    required this.item,
    required this.cartManager,
    required this.quantityUndated,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);
    final colorTheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.name,
                style: textTheme.headlineMedium,
              ),
              // TODO: Add Liked Badge
              const SizedBox(height: 16,),
              _mostLikedBadge(colorTheme),
              const SizedBox(height: 16,),
              Text(widget.item.description),
              // TODO: Add Item Image
              const SizedBox(height: 16,),
              _itemImage(widget.item.imageUrl),
              const SizedBox(height: 16,),
              // TODO: Add Cart Control
              _addToCartControl(widget.item),
            ],
          )
        ],
      ),
    );
  }
// TODO: Create Most Liked Badge
Widget _mostLikedBadge(ColorScheme colorTheme) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(4),
        color: colorTheme.onPrimary,
        child: const Text(
          '#1 Most Liked'
        )
      ),
    );
}
// TODO: Create Item Image
Widget _itemImage(String imageUrl) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: NetworkImage(imageUrl),
        fit: BoxFit.cover),
      )
    );
}
// TODO: Create Cart Control
Widget _addToCartControl(Item item) {
    return CartControl(addToCart: (number){
      const uuid = Uuid();
      final uuiqueId = uuid.v4();
      final cardItem = CartItem(id: uuiqueId, name: item.name, price: item.price, quantity: number);
      setState(() {
        widget.cartManager.addItem(cardItem);
      });
      Navigator.pop(context);
    });
}
}
