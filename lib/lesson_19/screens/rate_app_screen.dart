import 'package:flutter/material.dart';

class RateAppScreen extends StatefulWidget {
  const RateAppScreen({super.key});

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 224, 255, 1),
      appBar: AppBar(
        title: Text('Rate App', style: TextStyle(color: Colors.white)),

        backgroundColor: const Color.fromRGBO(27, 61, 112, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),

            color: Color.fromRGBO(114, 193, 250, 1),
          ),
          height: 214,
          child: Column(
            spacing: 24.0,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Text('How would you rate our app?'),
              ),

              Builder(
                builder: (BuildContext context) {
                  return Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            Icons.star,
                            //  index < state.rating ? Icons.star : Icons.star_border,
                          ),
                          onPressed: () {
                            // context.read<RatingCubit>().setRating(index + 1);
                          },
                        );
                      }),
                    ),
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        // context.read<RatingCubit>().submitRating();
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //context.read<RatingCubit>().submitRating();
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
