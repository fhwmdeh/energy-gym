import 'package:energygym/exersizes/challenge1.dart';
import 'package:energygym/widgets/customdivider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWorkout extends StatefulWidget {
  const HomeWorkout({super.key});

  @override
  State<HomeWorkout> createState() => _HomeWorkoutState();
}

class _HomeWorkoutState extends State<HomeWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[50],
        body: CustomScrollView(slivers: [
          SliverAppBar(
            title: Text(
              'Home Workout',
              style: GoogleFonts.averiaLibre(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            expandedHeight: 200, // Adjust as needed
            floating: true, // Set to true if you want the app bar to float
            pinned: true, // Set to true if you want the app bar to be pinned
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/home.png', // Your image URL
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.dstOver,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ]));
  }
}

/*
SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Start Your Home Workout',
                      style: GoogleFonts.abel(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // image
                        const Image(
                          image: AssetImage(
                            'images/fullbodyhome.png',
                          ),
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 5,
                        ),

                        Column(
                          children: [
                            //name of type exersises with bold text
                            Text(
                              'Full Body ',
                              style: GoogleFonts.abel(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //display image by text
                            Text(
                              'In This Exersise You Will upgrade all your body ',
                              style: GoogleFonts.abel(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeFullBody()));
                          },
                          icon: const Icon(
                            Icons.navigate_next_outlined,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                        //nav icon button
                      ],
                    ),
                    const CustomDivider(),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // image
                        const Image(
                          image: AssetImage(
                            'images/fullbodyhome.png',
                          ),
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 5,
                        ),

                        Column(
                          children: [
                            //name of type exersises with bold text
                            Text(
                              'Chest Muscles ',
                              style: GoogleFonts.abel(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //display image by text
                            Text(
                              '''In This Exersise You Will upgrade your chest Muscle ''',
                              style: GoogleFonts.abel(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.navigate_next_outlined,
                              color: Colors.red,
                              size: 40,
                            ))
                        //nav icon button
                      ],
                    ),
                    const CustomDivider(),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // image
                        const Image(
                          image: AssetImage(
                            'images/fullbodyhome.png',
                          ),
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 5,
                        ),

                        Column(
                          children: [
                            //name of type exersises with bold text
                            Text(
                              'Abs Muscles ',
                              style: GoogleFonts.abel(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //display image by text
                            Text(
                              '''In This Exersise You Will upgrade your Abs Muscle ''',
                              style: GoogleFonts.abel(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.navigate_next_outlined,
                              color: Colors.red,
                              size: 40,
                            ))
                        //nav icon button
                      ],
                    ),
                    const CustomDivider(),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // image
                        const Image(
                          image: AssetImage(
                            'images/fullbodyhome.png',
                          ),
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 5,
                        ),

                        Column(
                          children: [
                            //name of type exersises with bold text
                            Text(
                              'Legs Muscles ',
                              style: GoogleFonts.abel(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //display image by text
                            Text(
                              '''In This Exersise You Will upgrade your legs Muscle ''',
                              style: GoogleFonts.abel(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.navigate_next_outlined,
                              color: Colors.red,
                              size: 40,
                            ))
                        //nav icon button
                      ],
                    ),
                    const CustomDivider(),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // image
                        const Image(
                          image: AssetImage(
                            'images/fullbodyhome.png',
                          ),
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 5,
                        ),

                        Column(
                          children: [
                            //name of type exersises with bold text
                            Text(
                              'Arms Muscles ',
                              style: GoogleFonts.abel(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //display image by text
                            Text(
                              '''In This Exersise You Will upgrade your Arms Muscle ''',
                              style: GoogleFonts.abel(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.navigate_next_outlined,
                              color: Colors.red,
                              size: 40,
                            ))
                        //nav icon button
                      ],
                    ),
                    const CustomDivider(),
                  ],
                ),
              )
            ]),
          ),
*/ 