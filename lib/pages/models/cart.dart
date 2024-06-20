
import 'package:artisian/pages/models/artModel.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
//List of art for sale
  List<Art> artShop = [
    Art(
        name: "Mother's Love",
        author: "Tapiwa Mashe",
        price: "230",
        description: "Beautiful Fears",
        imagepath: "images/TapiwaMashe.jpeg"),
    Art(
        name: "My Father",
        author: "Babbington Shoko",
        price: "230",
        description: "An ancient memory",
        imagepath: "images/zim2.jpeg"),
    Art(
        name: "Pirate King (Kaizoku-ō)",
        author: "Eiichiro Oda",
        price: "130",
        description: "To Laughtale",
        imagepath: "images/king2.jpeg"),
    Art(
        name: "Unknown",
        author: "Exile",
        price: "130",
        description: "Forced Mindset",
        imagepath: "images/books.jpeg"),
    Art(
        name: "Depression",
        author: "Anonymous",
        price: "230",
        description: "How to live",
        imagepath: "images/drowning.jpeg"),
    Art(
        name: "African Dreams",
        author: "Justin Mashora",
        price: "250",
        description: "African euphoria",
        imagepath: "images/JustinMashora.jpeg"),
    Art(
        name: "Dreams",
        author: "White Fang",
        price: "133",
        description: "Fields of reminisce",
        imagepath: "images/fields.jpeg"),
    Art(
        name: "My Father",
        author: "Babbington Shoko",
        price: "230",
        description: "An ancient memory",
        imagepath: "images/zim2.jpeg"),
    Art(
        name: "All United",
        author: "Abiel Faith",
        price: "320",
        description: "Granite in its Might",
        imagepath: "images/AfricanShona.jpeg"),
  ];

//list of items in user cart
  List<Art> userCart = [];

//get list of art for sales
  List<Art> getArtList() {
    return artShop;
  }

//get cart
  List<Art> getuserCart() {
    return userCart;
  }

//add items to cart
  void addItemToCart(Art art) {
    userCart.add(art);
    notifyListeners();
  }

//remove item from cart
  void removeItemFromCart(Art art) {
    userCart.remove(art);
    notifyListeners();
  }
}
