import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailFood extends StatelessWidget {
  const DetailFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argsFood =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<String> ingrediens = argsFood['ingredients'];
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Column(
          children: [
            Text(
              argsFood['title'],
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ingredients",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text('${ingrediens.length} items'),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ingrediens.length,
                itemBuilder: (context, index) {
                  final ing = ingrediens[index];
                  return Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(ing),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
