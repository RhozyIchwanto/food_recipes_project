// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_recipes_project/recipe.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;

  const CategoryItem({
    Key? key,
    required this.id,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context, '/recipes',
          arguments: {'id': id, 'title': title},
          // MaterialPageRoute(
          //   builder: (context) => Recipe(
          //     idCategory: id,
          //     title: title,
          //   ),
          // ),
        );
      },
      child: Container(
        // child: Text(title),
        decoration: BoxDecoration(
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(126, 183, 183, 184),
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(0, 5)),
          ],
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
          image: DecorationImage(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            image: NetworkImage(image),
          ),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.2, 0.5],
            ),
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
