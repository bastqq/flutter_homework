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
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          'Оцінка візиту до магазину',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Container(
                height: 100,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 32.0,
                    right: 32.0,
                    bottom: 16.0,
                  ),
                  child: StarsRating(),
                ),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Яку оціночку поставите відділам?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ),
              // SizedBox(height: 20),
              ProductCard(titler: 'Випічка'),
              ProductCard(titler: 'Лавка традицій'),
              BottomExpressions(),
              BottomAppBar(
                height: 80,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 12.0,
                      bottom: 0.0,
                    ),
                    child: ElevatedButton(
                      //коли робив то не було в завданні постійної видимості
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 35, 88, 209),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Надіслати',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomExpressions extends StatelessWidget {
  const BottomExpressions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Column(
            spacing: 18,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Є ще що додати?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Поділіться загальним враженням',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StarsRating extends StatelessWidget {
  const StarsRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 4,
      children: [
        StarRatingIcon(),
        StarRatingIcon(),
        StarRatingIcon(),
        StarRatingIcon(),
        Icon(
          Icons.star_border,
          color: Color.fromARGB(255, 223, 223, 223),
          size: 48,
          shadows: [
            Shadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ],
    );
  }
}

class StarRatingIcon extends StatelessWidget {
  const StarRatingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Color.fromARGB(255, 255, 130, 0),
      size: 48,
      shadows: [
        Shadow(
          color: Color.fromARGB(255, 255, 130, 0).withValues(alpha: 0.5),
          blurRadius: 50,
          offset: const Offset(2, 4),
        ),
      ],
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                titler,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
            Container(child: Row()),

            Container(child: ProductRating(title: 'Обслуговування')),

            Container(child: ProductRating(title: 'Асортимент')),

            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Розкажіть докладніше',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool isTaped = false;

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(238, 242, 252, 1),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isTaped = !isTaped;
          });
          // Handle tap event
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 270,
                height: 58,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(title, style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color:
                      isTaped
                          ? Color.fromARGB(255, 35, 88, 209)
                          : Color.fromARGB(
                            255,
                            19,
                            19,
                            30,
                          ).withValues(alpha: 0.04),
                ),
                child: Image.asset(
                  'images/Activated_Dislike.png',
                  width: 48,
                  height: 48,
                  color: Colors.grey,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color:
                      !isTaped
                          ? Color.fromARGB(255, 35, 88, 209)
                          : Color.fromARGB(
                            255,
                            19,
                            19,
                            30,
                          ).withValues(alpha: 0.04),
                ),
                child: Image.asset(
                  'images/Default_Like.png',
                  opacity: AlwaysStoppedAnimation(1.0),
                  width: 48,
                  height: 48,
                  color: Colors.white,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
