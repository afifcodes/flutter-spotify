import 'package:flutter/material.dart';
import 'package:flutter_spotify/utils/system_ui.dart';
import 'package:ionicons/ionicons.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLike = false;
  bool isPlay = false;
  @override
  Widget build(BuildContext context) {
    systemUi();
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 96,
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Ionicons.chevron_down,
                              color: Colors.white),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('PLAYING FROM YOUR PLAYLIST',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                              SizedBox(
                                height: 2,
                              ),
                              Text('Liked Songs',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          const Icon(Ionicons.ellipsis_vertical,
                              color: Colors.white)
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://i.scdn.co/image/ab67616d0000b2730ed2184bf3fb4466d623a874'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Sunroof',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Nikcy Youre, dazy',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLike = !isLike;
                                });
                              },
                              child: isLike
                                  ? const Icon(
                                      Ionicons.heart,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Ionicons.heart_outline,
                                      color: Colors.white,
                                    ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SliderTheme(
                          data: SliderThemeData(
                              trackHeight: 2.5,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white.withOpacity(0.2),
                              trackShape: CustomTrackShape(),
                              thumbColor: Colors.white,
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 4)),
                          child: Slider(
                            min: 0,
                            max: 100,
                            value: 32,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Transform.translate(
                          offset: const Offset(0, -12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '0:19',
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text('2:43',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Ionicons.shuffle,
                              color: Colors.green,
                            ),
                            const Icon(
                              Ionicons.play_skip_back,
                              color: Colors.white,
                              size: 32,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPlay = !isPlay;
                                });
                              },
                              child: Icon(
                                isPlay
                                    ? Ionicons.pause_circle
                                    : Ionicons.play_circle,
                                color: Colors.white,
                                size: 72,
                              ),
                            ),
                            const Icon(
                              Ionicons.play_skip_forward,
                              color: Colors.white,
                              size: 32,
                            ),
                            const Icon(
                              Ionicons.stop_circle_outline,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Ionicons.headset_outline,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'AFIF\'S AIRPODS',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 12),
                            ),
                            Spacer(),
                            Icon(
                              Ionicons.share_social_outline,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Lyrics',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 7, right: 6, left: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                    color: Colors.black.withOpacity(0.3)),
                                child: const Center(
                                  child: Icon(
                                    Ionicons.share_social_outline,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 7, right: 6, left: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                    color: Colors.black.withOpacity(0.3)),
                                child: const Center(
                                  child: Icon(
                                    Ionicons.resize_outline,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('La da, la da da, la la la',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700)),
                              Text('La da, la da di da da, la la la la la',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700)),
                              Text('La da, la da da, la la la',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700)),
                              Text('La da, la da di da',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700)),
                              Text('I got my head out the sunroof',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700)),
                              Text('I\'m blasting our favorite',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RectangularSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
