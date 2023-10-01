import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: primary100,
        dotsDecorator: dotsDecorator(),
        dotsContainerDecorator: dotsContainerDecorator(),
        showSkipButton: false,
        showBackButton: true,
        pages: <PageViewModel>[
          PageViewModel(
            decoration: pageDecoration(),
            title: 'Directorio de flores',
            body: 'Consulta las 38 flores de Bach y todos sus beneficios',
            image: Lottie.asset('assets/animations/animation_1.json'),
          ),
          PageViewModel(
            decoration: pageDecoration(),
            title: 'Creación de diagnósticos',
            body: 'Crea un diagnóstico personalizado con base en tus emociones',
            image: Lottie.asset('assets/animations/animation_2.json'),
          ),
          PageViewModel(
            decoration: pageDecoration(),
            title: 'Visualiza tus diagnósticos',
            body: 'Observa los diagnósticos en tu historial, editalos, o '
                'eliminalos',
            image: Lottie.asset('assets/animations/animation_3.json'),
          ),
        ],
        done: const Text('Iniciar', style: TextStyle(color: Colors.white)),
        onDone: () {
          storeOnBoardInfo();
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        next: const Icon(Icons.arrow_forward, color: Colors.white),
        back: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }

  void storeOnBoardInfo() async {
    int viewed = 0;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('onBoarding', viewed);
  }

  DotsDecorator dotsDecorator() =>
      const DotsDecorator(activeColor: primary50, color: Colors.white);

  PageDecoration pageDecoration() => const PageDecoration(
        pageColor: primary100,
        imagePadding: EdgeInsets.symmetric(vertical: 24),
        imageFlex: 2,
      );

  ShapeDecoration dotsContainerDecorator() => const ShapeDecoration(
        color: primary100,
        shape: ContinuousRectangleBorder(),
      );
}
