import 'package:flutter/material.dart';
import 'package:store_app/core/themes.dart';

class UpdateProductItem extends StatelessWidget {
  const UpdateProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text(
          'Update Product',
          style: TextStyle(color: AppTheme.primaryColor),
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
    );
  }
}
