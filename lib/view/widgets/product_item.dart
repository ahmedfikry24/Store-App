import 'package:flutter/material.dart';

class CustomProductItem extends StatelessWidget {
  final Map<String, dynamic> allProducts;
  final int index;
  final bool isFavorites;
  final void Function()? favorites;
  final void Function()? add;
  const CustomProductItem(
      {super.key,
      required this.allProducts,
      required this.index,
      this.favorites,
      this.add,
      required this.isFavorites});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                allProducts['data']['products'][index]['image'],
                height: 150,
                width: 150,
                fit: BoxFit.fill,
              ),
              if (allProducts['data']['products'][index]['old_price'] !=
                  allProducts['data']['products'][index]['price'])
                Container(
                  width: 60,
                  color: Colors.red,
                  child: const Text(
                    'Discount',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
            ],
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
                '\$${allProducts['data']['products'][index]['price'].toInt()}',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              if (allProducts['data']['products'][index]['old_price'] !=
                  allProducts['data']['products'][index]['price'])
                Text(
                  '\$${allProducts['data']['products'][index]['old_price'].toInt()}',
                  style:
                      const TextStyle(decoration: TextDecoration.lineThrough),
                ),
              const Spacer(),
              IconButton(
                  onPressed: favorites,
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorites == true
                        ? Colors.red.withOpacity(.9)
                        : Colors.grey[400],
                  )),
              IconButton(
                  onPressed: add,
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
