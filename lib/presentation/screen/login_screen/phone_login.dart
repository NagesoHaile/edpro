import 'package:edir/presentation/screen/login_screen/otp_verification.dart';
import 'package:edir/presentation/screen/registration_screen/register.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  String language = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 30.0,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'eDir',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        // centerTitle: true,
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
                          const Divider(),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  language = 'አማርኛ';
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('አማርኛ')),
                          const Divider(),
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
                const Icon(Icons.arrow_drop_down_circle)
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 40.0, bottom: 10.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(color: Colors.green, fontSize: 24.0),
              ),
              const Text('Enter your phone number'),
              const SizedBox(
                height: 80.0,
              ),
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'ET',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              const SizedBox(
                height: 40.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const OtpVerification();
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
                      'Send OTP via SMS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                  'By creating an account you are accepting eDir\'s Terms and Conditions and privacy policy.'),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Terms,Conditions and Privacy policy.',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  )),
              Row(
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Register();
                      }));
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18.0,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 100.0,
              ),
              Text(
                  '@${DateTime.now().year.toString()}. All Rights Reserved. Designed and Developed by eDir Android Application Development Team.'),
            ],
          ),
        ),
      ),
    );
  }
}
