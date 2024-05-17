import 'package:energygym/widgets/custombutton.dart';
import 'package:energygym/widgets/customcontainer.dart';
import 'package:energygym/widgets/customdivider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeOne extends StatefulWidget {
  const ChallengeOne({super.key});

  @override
  State<ChallengeOne> createState() => _ChallengeOneState();
}

class _ChallengeOneState extends State<ChallengeOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        expandedHeight: 50,
        title: const Text('Challenges'),
        centerTitle: true,
        floating: true,
        forceElevated: true,
        collapsedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            'images/home.png', // Your image URL
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.dstOver,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Start Your Challenge',
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
                            'images/exersizes/chest/chestDip.gif',
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
                              'Chest Dip',
                              style: GoogleFonts.abel(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //display image by text
                            Text(
                              ' 13*4 ',
                              style: GoogleFonts.abel(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 30,
                            ))
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
                            'images/exersizes/chest/flyAgainsChains.gif',
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
                              'Fly Agains Chains ',
                              style: GoogleFonts.abel(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //display image by text
                            Text(
                              '14*3',
                              style: GoogleFonts.abel(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 30,
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
                            'images/exersizes/chest/PlankPushUp.gif',
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
                              'Plank Push Up',
                              style: GoogleFonts.abel(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //display image by text
                            Text(
                              '14*3',
                              style: GoogleFonts.abel(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 30,
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
                            'images/exersizes/back/BarBell.gif',
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
                              'Bar Bell',
                              style: GoogleFonts.abel(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            //display image by text
                            Text(
                              '14*3',
                              style: GoogleFonts.abel(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 30,
                            ))
                        //nav icon button
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.red[900],
                              content: CustomText(
                                  text:
                                      'Congratulation , you have been done your challenge 🥳',
                                  fontSize: 20),
                              contentPadding: EdgeInsets.all(20),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: CustomText(text: 'Done'),
                                ),
                              ],
                              elevation: 2,
                              shadowColor: Colors.white,
                            );
                          },
                        );
                      },
                      text: 'Done',
                    )
                  ]),
            ),
          ],
        ),
      )
    ]));
  }
}
