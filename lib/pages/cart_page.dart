
import 'package:artisian/pages/models/artModel.dart';
import 'package:artisian/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import 'models/cart.dart';

// Import the payment form
class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    if (cart.getuserCart().isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
        ),
        body: const Center(
          child: Text('Your cart is empty.'),
        ),
      );
    }

    return Consumer<Cart>(
      builder: (context, value, child) {
        double totalPrice = value
            .getuserCart()
            .map((art) => double.parse(art.price))
            .reduce((value, element) => value + element);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              const Text(
                'Art Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),

              const SizedBox(
                height: 20,
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: value.getuserCart().length,
                  itemBuilder: (context, index) {
                    // Get individual art
                    Art individualArt = value.getuserCart()[index];

                    // Return the cart item
                    return CartItem(art: individualArt);
                  },
                ),
              ),

              // Total Price
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // Proceed to Payment Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Proceed to payment logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentForm()),
                      );
                    },
                    child: Text('Proceed to Payment'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
