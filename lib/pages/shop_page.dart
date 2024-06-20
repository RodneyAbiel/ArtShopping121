
import 'package:artisian/pages/art_tile.dart';
import 'package:artisian/pages/models/artModel.dart';
import 'package:artisian/pages/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addArtToCart(Art art) {
    bool alreadyInCart =
        Provider.of<Cart>(context, listen: false).getuserCart().contains(art);

    if (alreadyInCart) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This item is already in your cart!'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      Provider.of<Cart>(context, listen: false).addItemToCart(art);

      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Successfully Added!"),
          content: Text("Check Cart"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text("Paint your dreams......Your your own artist",
                style: TextStyle(color: Colors.black)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Shop List....😄",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                Text("Check It",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: value.getArtList().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Art art = value.getArtList()[index];
                  return ArtTile(
                    art: art,
                    onTap: () => addArtToCart(art), // Use onTap to add to cart
                  );
                }),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Divider(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
