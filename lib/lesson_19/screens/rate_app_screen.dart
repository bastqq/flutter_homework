import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/lesson_19/bloc/rate_app_cubit.dart';
import 'package:flutter_homework/main.dart';

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
        centerTitle: true,
        title: Text('Flutter lab', style: TextStyle(color: Colors.white)),

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
          child: SingleChildScrollView(
            child: Column(
              spacing: 10.0,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text(
                    'How would you rate our app?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),

                Builder(
                  builder: (BuildContext context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: BlocBuilder<RatingCubit, int>(
                            builder: (context, state) {
                              return IconButton(
                                icon: Icon(
                                  size: 32,
                                  color: Colors.amber,

                                  // Icons.star,
                                  index >= state && state != -2
                                      ? Icons.star_border
                                      : Icons.star,
                                ),
                                onPressed: () {
                                  print(index);
                                  context.read<RatingCubit>().setRating(index);
                                },
                              );
                            },
                          ),
                        );
                      }),
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),

                  child: BlocBuilder<RatingCubit, int>(
                    builder: (context, state) {
                      // final isSaveStatus = context.select(
                      // (RatingCubit c) => c.saveStatus,);
                      if (state != -2) {
                        return UnsavedRatingRow();
                      } else {
                        return Container(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(27, 61, 112, 1),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              context.read<RatingCubit>().resetRating();
                            },
                            child: const Text('Rate again'),
                          ),
                        );
                      }
                    },
                  ),

                  //UnsavedRatingRow(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UnsavedRatingRow extends StatelessWidget {
  const UnsavedRatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
      child: Row(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(27, 61, 112, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: BlocBuilder<RatingCubit, int>(
                builder: (context, state) {
                  //if (context.select((RatingCubit c) => c.saveStatus) == 0) {
                  if (state > -1) {
                    return const Text('Submit rating');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              onPressed: () async {
                context.read<RatingCubit>().saveRating();
                await Future<void>.delayed(const Duration(seconds: 3));

                context.read<RatingCubit>().savedRating();

                if (context.mounted) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 3),
                        content: RatingSnackRow(),
                        backgroundColor: Colors.blue,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );

                  Navigator.of(context).push<String>(
                    MaterialPageRoute(
                      builder: (pageContext) {
                        return const HomeScreen();
                      },
                    ),
                  );
                }
              },
            ),
          ),

          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(65, 166, 244, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                context.read<RatingCubit>().resetRating();
                print(context.read<RatingCubit>().state);
              },
              child: Text('Reset'),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingSnackRow extends StatelessWidget {
  const RatingSnackRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Image.asset('images/Vector.png', width: 24, height: 24),
        const Text('Rating submitted successfully'),
        Image.asset('images/Vector.png', width: 24, height: 24),
      ],
    );
  }
}
