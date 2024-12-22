import 'package:flutter/material.dart';

class CartControl extends StatefulWidget {

  final void Function(int) addToCart;

  const CartControl({super.key,required this.addToCart});

  @override
  State<CartControl> createState() => _CartControlState();
}

class _CartControlState extends State<CartControl> {
  int _cart_number = 1;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // TODO: Add Cart Control Components
        _buildMinusButton(),
        _buildCartNumberContainer(colorScheme),
        _buildPlusButton(),
        const Spacer(),
        _buildAddCartButton(),
      ],
    );
  }
// TODO: Build Minus Button
Widget _buildMinusButton() {
    return IconButton(
      icon: const Icon(Icons.remove),
      onPressed: () {
        setState(() {
          if (_cart_number > 1) {
            _cart_number--;
          }
        });
      },
      tooltip: 'Decrease Cart Count',
    );
}
// TODO: Build Cart Number
Widget _buildCartNumberContainer(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: colorScheme.onPrimary,
      child: Text(_cart_number.toString()),
    );
}
// TODO: Build Plus Button
Widget _buildPlusButton() {
    return IconButton(onPressed: (){
      setState(() {
        _cart_number++;
      });
    }, icon: const Icon(Icons.add), tooltip: 'Increase Cart Count',);
}

// TODO: Build Add Cart Button
Widget _buildAddCartButton(){
    return FilledButton(onPressed: (){widget.addToCart(_cart_number);}, child: const Text('Add to Card'));
}
}
