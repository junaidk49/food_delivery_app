import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["Pizza", "Burgers", "Kebab", "Desert", "Salad"];

  // Foods data with different images, titles, and prices for each category
  Map<String, List<Map<String, dynamic>>> foodsByCategory = {
    "Pizza": [
      {
        "image": "assets/images/Margherita.jpg",
        "title": "Margherita Pizza",
        "price": "\$15.00",
        "isFavorite": false,
      },
      {
        "image": "assets/images/Hawaiian.jpg",
        "title": "Hawaiian Pizza",
        "price": "\$18.00",
        "isFavorite": false,
      },
      {
        "image": "assets/images/Quattro Formaggi.jpg",
        "title": "Quattro Formaggi Pizza",
        "price": "\$12.00",
        "isFavorite": false,
      }
    ],
    "Burgers": [
      {
        "image": "assets/images/Classic CheeseBurger.jpg",
        "title": "Classic Cheeseburger",
        "price": "\$10.00",
        "isFavorite": false,
      },
      {
        "image": "assets/images/Bacon BBQ Burger.jpg",
        "title": "Bacon BBQ Burger",
        "price": "\$14.00",
        "isFavorite": false,
      },
      {
        "image": "assets/images/Mushroom Swiss Burger.jpg",
        "title": "Mushroom Swiss Burger",
        "price": "\$12.00",
        "isFavorite": false,
      }
    ],
    "Kebab": [
      {
        "image": "assets/images/Beef Seekh Kebab.jpg",
        "title": "Beef Seekh Kebab",
        "price": "\$8.00",
        "isFavorite": false,
      },
      {
        "image": "assets/images/Chapli Kebab.jpg",
        "title": "Chapli Kebab",
        "price": "\$9.00",
        "isFavorite": false,
      },
      {
        "image": "assets/images/Shami Kebab.jpg",
        "title": "Shami Kebab",
        "price": "\$10.00",
        "isFavorite": false,
      }
    ],
    "Desert": [
      {
        "image": "assets/images/Chocolate Lava Cake.jpg",
        "title": "Chocolate Lava Cake",
        "price": "\$6.00",
        "isFavorite": false,
      },
      {
        "image": "assets/images/Strawberry CheeseCake.jpg",
        "title": "Strawberry CheeseCake",
        "price": "\$5.00",
        "isFavorite": false,
      },
      {
        "image": "assets/images/Tiramisu.jpg",
        "title": "Tiramisu",
        "price": "\$7.00",
        "isFavorite": false,
      }
    ],
    "Salad": [
      {
        "image": "assets/images/Caesar Salad.jpg",
        "title": "Caesar Salad",
        "price": "\$8.00",
        "isFavorite": false,
      },
      {
        "image": "assets/images/Greek Salad.jpg",
        "title": "Greek Salad",
        "price": "\$9.00",
        "isFavorite": false,
      },
      {
        "image": "assets/images/Caprese Salad.jpg",
        "title": "Caprese Salad",
        "price": "\$7.00",
        "isFavorite": false,
      }
    ],
  };

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: const Icon(null),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Food Delivery',
                    style: TextStyle(
                        color: Colors.grey[80],
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => makeCategory(
                        title: categories[index],
                        index: index,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Free Delivery',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodsByCategory[categories[selectedCategory]]!
                      .length,
                  itemBuilder: (context, index) => makeItem(
                    image: foodsByCategory[categories[selectedCategory]]![index]
                    ["image"],
                    title: foodsByCategory[categories[selectedCategory]]![index]
                    ["title"],
                    price: foodsByCategory[categories[selectedCategory]]![index]
                    ["price"],
                    isFavorite:
                    foodsByCategory[categories[selectedCategory]]![index]
                    ["isFavorite"],
                    index: index,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({required String title, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: selectedCategory == index
              ? Colors.yellow[700]
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selectedCategory == index
                  ? Colors.black
                  : Colors.grey[700],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItem(
      {required String image,
        required String title,
        required String price,
        required bool isFavorite,
        required int index}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: const [.2, .9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        foodsByCategory[categories[selectedCategory]]![index]
                        ["isFavorite"] = !foodsByCategory[
                        categories[selectedCategory]]![index]["isFavorite"];
                      });
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1.5,
                            color: isFavorite ? Colors.red : Colors.transparent,
                          ),
                        ),
                        child: isFavorite
                            ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                            : const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        price,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
