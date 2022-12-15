import 'package:flutter/material.dart';

class CustomCartProductItem extends StatelessWidget {
  final Map<String, dynamic> getcart;
  final int index;
  final bool iscart;
  final void Function()? add;
  const CustomCartProductItem(
      {super.key,
      required this.getcart,
      required this.index,
      this.add,
      required this.iscart});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 120,
          width: 120,
          margin: const EdgeInsets.all(10),
          child: Image.network(
            getcart['data']['cart_items'][index]['product']['image'],
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
                getcart['data']['cart_items'][index]['product']['name'],
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '\$${getcart['data']['cart_items'][index]['product']['price'].toInt()}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (getcart['data']['cart_items'][index]['product']
                          ['old_price'] !=
                      getcart['data']['cart_items'][index]['product']['price'])
                    Text(
                      '\$${getcart['data']['cart_items'][index]['product']['old_price'].toInt()}',
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough),
                    ),
                  const Spacer(),
                  IconButton(
                      onPressed: add,
                      icon: Icon(
                        iscart == true ? Icons.check_circle_sharp : Icons.add,
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
