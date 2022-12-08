import 'package:flutter/material.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://d30l99xc13l2t1.cloudfront.net/media/catalog/product/cache/24068b64fbac9f2de6c79723b87209a3/B/4/B4290_100_1.JPG',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const Text('shoes'),
          Row(
            children: [
              const Text(r'$225'),
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
