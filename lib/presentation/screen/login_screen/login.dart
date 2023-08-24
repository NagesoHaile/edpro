import 'package:edir/presentation/screen/home/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  String language = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              'Welcome Back! Glad to see you,Again!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'yourname@gmail.com',
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              obscureText: hidePassword,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                suffixIcon: hidePassword
                    ? IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePassword = false;
                          });
                        },
                      )
                    : TextButton(
                        onPressed: () {},
                        child: Text('Hide'),
                      ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                    'Sign In',
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account? '),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign Up Now',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
