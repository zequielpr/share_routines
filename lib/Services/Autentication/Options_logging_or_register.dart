import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../MediaQuery/MediaQuery.dart';

class OptionsLoggingOrRegister extends StatefulWidget {
  const OptionsLoggingOrRegister({Key? key}) : super(key: key);

  @override
  State<OptionsLoggingOrRegister> createState() =>
      _OptionsLoggingOrRegisterState();
}

class _OptionsLoggingOrRegisterState extends State<OptionsLoggingOrRegister> {
  var pLeftRight;
  var mTop;
  final TRANSPARENT = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    pLeftRight = M_Query.getpercentageScreedSize(5, context, 'x');
    mTop = M_Query.getpercentageScreedSize(2, context, 'y');
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: pLeftRight, right: pLeftRight),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _getSizedBox(15),
            getIntroduction(),
            _getSizedBox(15),
            getOptionLoggin('p', context),
            getOptionLoggin('g', context),
            getOptionLoggin('a', context),
            getOptionLoggin('f', context),
            _getSizedBox(10),
            getTerms()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _getFooter(),
    );
  }

  Widget _getSizedBox(double p){
    return SizedBox(
      height: M_Query.getpercentageScreedSize(p, context, 'y'),
    );
  }

  Widget getIntroduction(){
    return SizedBox(child: Column(children: [
      SizedBox(
        width:  M_Query.getpercentageScreedSize(90, context, 'x'),
        child: Column(
          children: const [
            Text(
              'Inicia sesion en Share Routines',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.5,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),

      SizedBox(
        width: M_Query.getpercentageScreedSize(70, context, 'x'),
        child: Text(
          'Inicia sesion en Share Routines, crea y'
              ' comparte rutinas con tus amigos',
          style:TextStyle(
              color: Colors.black,
              fontSize: 15.5,
              fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
      )
    ],),);
  }


  //Get optionLoggin
  Widget getOptionLoggin(String option, BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: mTop),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: const BorderSide(color: Colors.black26, width: 0.5),
      ),
      child: ListTile(
        leading: _getIcon(option),
        title: _getTitle(option, context),
        onTap: () => _invocateMethod(option),
        dense: true,
        minVerticalPadding: 0,
        visualDensity: VisualDensity.comfortable,
      ),
    );
  }

  Widget _getIcon(String option) {
    var sizeImg = M_Query.getpercentageScreedSize(3, context, 'x');
    switch (option) {
      case 'p':
        return CircleAvatar(
          backgroundColor: TRANSPARENT,
          maxRadius: sizeImg,
          backgroundImage: AssetImage('lib/imgs/img_logo_provicional.png'),
        );
      case 'g':
        return CircleAvatar(
          backgroundColor: TRANSPARENT,
          maxRadius: sizeImg,
          backgroundImage: AssetImage('lib/imgs/img_google.png'),
        );
      case 'a':
        return CircleAvatar(
          backgroundColor: TRANSPARENT,
          maxRadius: sizeImg + 1,
          backgroundImage: AssetImage('lib/imgs/img_apple.png'),
        );
      case 'f':
        return CircleAvatar(
          backgroundColor: TRANSPARENT,
          maxRadius: sizeImg,
          backgroundImage: AssetImage('lib/imgs/img_facebook.png'),
        );
      default:
        return Text('');
    }
  }

//Get title
  Widget _getTitle(option, BuildContext context) {
    var wordSize = M_Query.getpercentageScreedSize(5, context, 'x');
    var styleTxt = TextStyle(fontSize: wordSize);

    switch (option) {
      case 'p':
        return Text(
          'Continuar con usuario y contraseña',
          style: styleTxt,
        );
      case 'g':
        return Text('     Continuar con Google', style: styleTxt);
      case 'a':
        return Text('        Continuar con Apple', style: styleTxt);
      case 'f':
        return Text('      Continuar con Facebook', style: styleTxt);
      default:
        return Text('     ha ocurrido un herror', style: styleTxt);
    }
  }

//Invocation method
  void _invocateMethod(String option) {
    switch (option) {
      case 'p':
        return;
      case 'g':
        return;
      case 'a':
        return;
      case 'f':
        return;
      default:
        return;
    }
  }

  Widget getTerms() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          style: TextStyle(color: Colors.black),
          text: 'Al continuar, aceptas nuestros ',
          children: <TextSpan>[
            TextSpan(
              text: ' Terminos del servicios ',
              style: const TextStyle(
                color: Color.fromARGB(236, 231, 64, 122),
              ),
              recognizer: TapGestureRecognizer()..onTap = _terminosDelServicio,
            ),
            const TextSpan(text: 'y confirmas haber leido la '),
            TextSpan(
                text: 'politica de privacidad.',
                style:
                    const TextStyle(color: Color.fromARGB(236, 231, 64, 122)),
                recognizer: TapGestureRecognizer()
                  ..onTap = _politicaDePrivacidad),
          ]),
    );
  }

  Widget _getFooter() {
    return Container(
      height: M_Query.getpercentageScreedSize(8, context, 'y'),
      color: const Color.fromARGB(202, 217, 217, 217),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {},
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: '¿No tienes una cuenta?',
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: '   Registrarse',
                      style: TextStyle(color: Colors.pinkAccent))
                ]),
              ))
        ],
      ),
    );
  }

  void _terminosDelServicio() {}

  void _politicaDePrivacidad() {}
}
