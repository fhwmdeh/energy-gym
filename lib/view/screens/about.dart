import 'package:energygym/widgets/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AbouApp extends StatelessWidget {
  const AbouApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.info,
                size: 60,
              ),
              const SizedBox(
                height: 15,
              ),
              Text('ABOUT OUR APPLICATION'),
              const SizedBox(
                height: 15,
              ),
              CustomContainer(
                color: Colors.white,
                wedgets: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '''This App Was Built For Gyms ,To Make Connection Between Coachs And Trainers , Give Them Exercises ,Send Them Messages And Tips  ''',
                    style: GoogleFonts.aboreto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                'Contact Us',
                style: GoogleFonts.aboreto(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.facebook,
                        size: 40,
                        color: Colors.blue[900],
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.email,
                        size: 40,
                        color: Colors.red[800],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
