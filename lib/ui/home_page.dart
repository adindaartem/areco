import 'package:aquatic_ar_app/logic/bloc/aquatic/aquatic_bloc.dart';
import 'package:aquatic_ar_app/logic/repository/aquatic_repository.dart';
import 'package:aquatic_ar_app/ui/list_page.dart';
import 'package:aquatic_ar_app/ui/scan_page.dart';
import 'package:aquatic_ar_app/widget/theme/color_theme.dart';
import 'package:aquatic_ar_app/widget/theme/text_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  final AquaticRepository _repository = AquaticRepository();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AquaticBloc(_repository)..add(AquaticGetAllType()),
        child: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();
  int activeIndex = 0;

  void animateToSlide(int index) => _controller.animateToPage(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleJustDark,
        centerTitle: true,
        title: Text(
          'ARECO',
          style: headerTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<AquaticBloc, AquaticState>(
          builder: (context, state) {
            if (state is AquaticLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CarouselSlider.builder(
                        carouselController: _controller,
                        itemCount: state.aquatics.length,
                        options: CarouselOptions(
                          initialPage: 0,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          enableInfiniteScroll: true,
                          viewportFraction: 1,
                          height: 550,
                          onPageChanged: (index, reason) => setState(() {
                            activeIndex = index;
                          }),
                        ),
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = state.aquatics[index].imgUrl;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListPage(
                                            animals:
                                                state.aquatics[index].animals!,
                                            environment:
                                                state.aquatics[index].title!,
                                          )));
                            },
                            child: Stack(children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: urlImage!.contains("http")
                                          ? NetworkImage(urlImage)
                                              as ImageProvider
                                          : AssetImage(urlImage),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(
                                          0.8), // gradually darkens
                                    ],
                                    stops: const [
                                      0.0,
                                      0.7
                                    ], // Start the gradient at 0% and end at 70% of the container height
                                  ),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 280,
                                      ),
                                      Text(
                                        state.aquatics[index].title!,
                                        style: headerTextStyle.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        state.aquatics[index].desc!,
                                        style: contentTextStyle.copyWith(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        textAlign: TextAlign.justify,
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          );
                        },
                      ),
                      Positioned(
                        left: 5,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onPressed: () => _controller.previousPage(),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                          onPressed: () => _controller.nextPage(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  buildIndicator(state.aquatics),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScanPage(
                                        environment: state
                                            .aquatics[activeIndex].title!)));
                          },
                          icon: const Icon(Icons
                              .document_scanner_outlined), // Or any other scanner icon you prefer
                          label: const Text('SCAN'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust as desired
                              ),
                              backgroundColor: purpleJustDark,
                              foregroundColor: Colors.white
                              // Add other styling options here (optional)
                              ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            if (state is AquaticError) {
              return Center(
                child: Text(state.error),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget buildIndicator(imgList) => AnimatedSmoothIndicator(
      onDotClicked: animateToSlide,
      activeIndex: activeIndex,
      count: imgList.length,
      effect: ExpandingDotsEffect(
        spacing: 10,
        dotWidth: 10,
        dotHeight: 10,
        activeDotColor: purpleColor900,
        dotColor: purpleColor400,
        paintStyle: PaintingStyle.stroke,
      ));
}
