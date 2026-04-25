import 'package:flutter/material.dart';

class WidgetsP2 extends StatefulWidget {
  const WidgetsP2({super.key});

  @override
  State<WidgetsP2> createState() => _WidgetsP2State();
}

class _WidgetsP2State extends State<WidgetsP2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 242, 252, 1),
      appBar: AppBar(title: Text('Оцінка візиту до магазину')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.06),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star_border),
                ],
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Яку оціночку поставите відділам?',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ProductCard(titler: 'Випічка'),
            ProductCard(titler: 'Лавка традицій'),
            Container(
              child: Column(
                children: [
                  Text('Є що додати?'),
                  Text('Поділіться загальним враженням'),
                ],
              ),
            ),
            BottomAppBar(
              child: Container(
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('Надіслати'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({required this.titler, super.key});

  final String titler;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  String get titler => widget.titler;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(titler),
        Container(child: Row()),

        Container(child: ProductRating(title: 'Обслуговування')),

        Container(child: ProductRating(title: 'Асортимент')),
      ],
    );
  }
}

class ProductRating extends StatefulWidget {
  const ProductRating({required this.title, super.key});

  final String title;

  @override
  State<ProductRating> createState() => _ProductRatingState();
}

class _ProductRatingState extends State<ProductRating> {
  String get title => widget.title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title),
        Image.asset('images/Default_Like.png'),
        Image.asset('images/Activated_Dislike.png'),
      ],
    );
  }
}
