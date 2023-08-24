import 'package:edir/presentation/screen/home/home.dart';
import 'package:flutter/material.dart';

import '../login_screen/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String language = 'English';
  bool checked = false;
  void toggleCheckbox(value) {
    setState(() {
      checked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              border: Border.all(color: Colors.green),
            ),
            height: 10,
            width: 10,
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.green,
                ),
              ),
            ),
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
                const SizedBox(
                  width: 3.0,
                ),
                const Icon(Icons.arrow_drop_down_circle)
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Text(
                  'Hello! Register to get started',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Home();
                    }));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    height: 60,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    const SizedBox(
                      width: 8.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Login();
                        }));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.green, fontSize: 16.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
