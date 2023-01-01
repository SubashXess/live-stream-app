import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Container(
          width: size.width,
          height: 46.0,
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.deepPurple,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06))],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/live.svg',
                height: 24.0,
                width: 24.0,
                color: Colors.white,
              ),
              const SizedBox(width: 10.0),
              const Text(
                'Go Live',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade50,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            titleSpacing: 16.0,
            leadingWidth: 0.0,
            floating: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 16.0,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Back to Edit',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              height: size.height / 4.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.shade300,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                  ),
                ],
              ),
              child: Icon(
                Icons.image_rounded,
                size: 56.0,
                color: Colors.grey.shade500,
              ),
              // child: Image.network(
              //   'https://cdn.pixabay.com/photo/2022/10/03/23/41/house-7497001__340.png',
              //   fit: BoxFit.fill,
              // ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 94.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: false,
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.deepPurple.shade50,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/live.svg',
                            height: 24.0,
                            width: 24.0,
                            color: Colors.deepPurple,
                          ),
                          const SizedBox(width: 10.0),
                          const Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                TextSpan(text: 'Start on '),
                                TextSpan(
                                  text: 'December 31 at 20:00',
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 16.0),
                  const Text(
                    'It\'s Cool To Be Kind - Full Live Full Live Full Live Full Live',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    'description'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
