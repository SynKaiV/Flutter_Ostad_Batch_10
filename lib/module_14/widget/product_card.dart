import 'package:first_class/module_14/models/productModel.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final Data product;

  const ProductCard({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.4),
      child: Column(
        children: [
          Container(
            height: 170,
            child: Image.network(
              height: 100,
                fit: BoxFit.cover,
                product.img.toString()
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(product.productName.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text('Price: ${product.unitPrice} | Quantity: ${product.qty}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: onEdit,
                    icon: Icon(Icons.edit, size: 25, color: Colors.orange)
                ),

                SizedBox(width: 10),

                IconButton(
                    onPressed: onDelete,
                    icon: Icon(Icons.delete, size: 25, color: Colors.red)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}