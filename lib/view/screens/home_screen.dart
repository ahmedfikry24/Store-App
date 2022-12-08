import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/core/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.black54,
                )),
          )
        ],
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(color: AppTheme.primaryColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(height: 200, child: Card());
              },
            ),
          ),
        ],
      ),
    );
  }
}
