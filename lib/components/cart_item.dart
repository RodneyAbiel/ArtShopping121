import 'package:artisian/pages/models/artModel.dart';
import 'package:artisian/pages/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  Art art;
  CartItem({super.key, required this.art});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
//remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.art);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.art.imagepath),
        title: Text(widget.art.name),
        subtitle: Text(widget.art.price),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
