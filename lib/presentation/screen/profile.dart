import 'package:flutter/material.dart';
import 'package:submission_flutter_dasar/presentation/widget/glassmorphism/glassmorphism.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlassMorphism(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://media.licdn.com/dms/image/D5603AQGFT_V2AlWLWA/profile-displayphoto-shrink_800_800/0/1690521213571?e=1700697600&v=beta&t=LqEmPqyvC_QlnuuxtZJ4DEWko4-L8NNcpL9fWqn8g6w"),
                      radius: 60,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Text("Muhammad Ramdhon")),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.network(
                                    "https://w7.pngwing.com/pngs/276/472/png-transparent-linkedin-computer-icons-blog-logo-watercolor-butterfly-angle-text-rectangle.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text("Muhammad Ramdhon")
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.network(
                                    "https://w7.pngwing.com/pngs/914/758/png-transparent-github-social-media-computer-icons-logo-android-github-logo-computer-wallpaper-banner-thumbnail.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text("inspironCons")
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
