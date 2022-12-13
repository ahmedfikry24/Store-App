import 'package:flutter/material.dart';

class CustomFavoriteProductItem extends StatelessWidget {
  final Map<String, dynamic> getfavorites;
  final int index;
  final bool isFavorites;
  final void Function()? favorites;
  final void Function()? add;
  const CustomFavoriteProductItem(
      {super.key,
      required this.getfavorites,
      required this.index,
      required this.isFavorites,
      this.favorites,
      this.add});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 120,
          width: 120,
          margin: const EdgeInsets.all(10),
          child: Image.network(
            getfavorites['data']['data'][index]['product']['image'],
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getfavorites['data']['data'][index]['product']['name'],
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '\$${getfavorites['data']['data'][index]['product']['price'].toInt()}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (getfavorites['data']['data'][index]['product']
                          ['old_price'] !=
                      getfavorites['data']['data'][index]['product']['price'])
                    Text(
                      '\$${getfavorites['data']['data'][index]['product']['old_price'].toInt()}',
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough),
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
        ),
      ],
    );
  }
}
