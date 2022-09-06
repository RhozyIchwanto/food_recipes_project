import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgetswork.dart';
import 'package:food_recipes_project/dummy_data.dart';
import 'package:food_recipes_project/models/food.dart';

class Recipe extends StatefulWidget {
  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsRecipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<Food> filteredFood = dummy_food.where((food) {
      return food.category.contains(argsRecipe['id']);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          argsRecipe['title'],
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: filteredFood.length,
          itemBuilder: (context, index) {
            final food = filteredFood[index];
            return GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, '/detail-food', arguments: {
                  'title': food.title,
                  'ingredients': food.ingredients,
                });
              }),
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(bottom: 20),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(food.imageUrl),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Text(food.duration.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    '${food.duration} mins',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFav = !isFav;
                                    food.isFavorite = isFav;
                                  });
                                  print(food.isFavorite);
                                },
                                icon: Icon(
                                  food.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.redAccent,
                                  size: 30,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
