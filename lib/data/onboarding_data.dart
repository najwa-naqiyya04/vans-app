class OnboardingData {
  final String image;
  final String title;
  final String description;

  const OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

const List<OnboardingData> onboardingPages = [
  OnboardingData(
    image: 'assets/onboarding_1.png',
    title: 'More Than Sneakers.\nA Lifestyle.',
    description:
        'Discover your style with our collection of iconic sneakers.',
  ),

  OnboardingData(
    image: 'assets/onboarding_2.png',
    title: 'Find Your\nOwn Style.',
    description:
        'Explore different styles and find the perfect pair for you.',
  ),

  OnboardingData(
    image: 'assets/onboarding_3.png',
    title: 'Step Into\nYour Style.',
    description:
        'Get your favorite sneakers and start your journey with Vans.',
  ),
];