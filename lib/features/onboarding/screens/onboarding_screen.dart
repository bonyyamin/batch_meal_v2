import 'package:batch_meal_v2/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:batch_meal_v2/core/notifiers/onboarding_notifier.dart';
import 'package:batch_meal_v2/core/routes/route_names.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() async {
    if (_currentPage < _pageTitles.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // Mark onboarding as completed
      await ref.read(onboardingProvider.notifier).completeOnboarding();

      if (mounted) {
        context.go(RouteNames.loginScreen);
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pageTitles.length,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder:
                (context, index) => _buildPage(
                  title: _pageTitles[index],
                  description: _pageDescriptions[index],
                  imagePath: _pageImages[index],
                ),
          ),

          // Bottom Navigation (Dots + Button)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: GestureDetector(
                onTap: _nextPage,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Progress Indicator
                    TweenAnimationBuilder(
                      tween: Tween<double>(
                        begin: 0,
                        end: (_currentPage + 1) / _pageTitles.length,
                      ),
                      duration: const Duration(milliseconds: 500),
                      builder: (context, value, child) {
                        return Transform.rotate(
                          angle: 2 * 3.14 / 2,
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: CircularProgressIndicator(
                              value: value,
                              strokeWidth: 5.0,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppTheme.secondaryColor,
                              ),
                              backgroundColor: Colors.grey.shade300,
                            ),
                          ),
                        );
                      },
                    ),

                    // Center Button
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child:
                            _currentPage == _pageTitles.length - 1
                                ? const Text(
                                  "Go",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                                : Image.asset(
                                  'assets/icons/arrow.png',
                                  width: 60,
                                  height: 60,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Added logo at the top center
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Image.asset(
              'assets/images/flat_logo.png', // Path to your logo image
              width: double.infinity,
              height: 100,
            ),
          ),
        ),
        const SizedBox(height: 70), // End of logo addition
        // Added spacing below the logo
        Image.asset(imagePath, width: double.infinity, height: 300),
        const SizedBox(height: 80),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  final List<String> _pageImages = [
    'assets/gifs/1.png',
    'assets/gifs/2.png',
    'assets/gifs/3.png',
  ];

  final List<String> _pageTitles = [
    "Hi! Tired of Kitchen Chaos?",
    "Delicious Meals, Delivered. Your Way.",
    "Eat Well, Live Better!",
  ];

  final List<String> _pageDescriptions = [
    "Say goodbye to bland meals, wasted time, and unreliable cooks. ",
    "Affordable Packages | Easy Customization | Custom Orders | Vacation Mode",
    "saving you time for what matters most!",
  ];
}
