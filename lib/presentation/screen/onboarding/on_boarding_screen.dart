import 'package:edir/presentation/screen/login_screen/phone_login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  bool isLastPage = false;
  String language = 'English';

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30.0,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'eDir',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Column(
                        children: <Widget>[
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  language = 'English';
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('English')),
                          Divider(),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  language = 'አማርኛ';
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('አማርኛ')),
                          Divider(),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  language = 'Afan Oromo';
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Afan Oromo'))
                        ],
                      ),
                    );
                  });
            },
            child: Row(
              children: [
                Text(language),
                SizedBox(
                  width: 3.0,
                ),
                Icon(Icons.arrow_drop_down_circle)
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 2;
                    });
                  },
                  itemCount: demo.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return OnboardingContent(
                      image: demo[index].image,
                      title: demo[index].title,
                      description: demo[index].description,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: demo.length,
                    effect: const WormEffect(
                      dotHeight: 16,
                      dotWidth: 16,
                      activeDotColor: Colors.green,
                      type: WormType.thinUnderground,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 50,
                    child: IconButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: Duration(microseconds: 300),
                            curve: Curves.ease);
                      },
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PhoneLogin();
                  }));
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: const Center(
                    child: Text(
                      'Get started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//model
class Onboard {
  final String image, title, description;
  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<Onboard> demo = [
  Onboard(
    image: 'images/life-insurance.png',
    title: 'Save for a better tomorrow',
    description: 'Save and Join the eDir for a better tomorrow',
  ),
  Onboard(
    image: 'images/health-insurance.png',
    title: 'Prepare for the Time of Trouble',
    description:
        'Those who,think about tomorrow, and start preparing today are wise',
  ),
  Onboard(
    image: 'images/location.png',
    title: 'Get notification',
    description:
        'Manage your contributions and get notifcation easily,from anywhere',
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //const Spacer(),
        Image.asset(
          image,
          height: 250.0,
        ),
        const SizedBox(
          height: 100,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
