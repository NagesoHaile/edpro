import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String language = 'English';
  String username = "Negeso";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hello,',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      '${username}!',
                      style:
                          const TextStyle(color: Colors.green, fontSize: 20.0),
                    )
                  ],
                ),
                Text(
                  'Save for a better tomorrow!',
                  style: TextStyle(color: Colors.grey.shade600),
                )
              ],
            ),
          ),
        ));
  }
}
