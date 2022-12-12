import 'package:flutter/material.dart';

class CustomProductItem extends StatelessWidget {
  final Map<String, dynamic> allProducts;
  final int index;
  final void Function()? favorites;
  final void Function()? add;
  const CustomProductItem(
      {super.key,
      required this.allProducts,
      required this.index,
      this.favorites,
      this.add});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            allProducts['data']['products'][index]['image'],
            height: 100,
            width: 100,
            fit: BoxFit.fill,
          ),
          const Spacer(),
          Text(
            allProducts['data']['products'][index]['name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Text(
                  '\$${allProducts['data']['products'][index]['price'].toInt()}'),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.grey[400],
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.blue[800],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
