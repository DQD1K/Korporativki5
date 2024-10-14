import 'package:flutter/material.dart';
import 'main.dart';
import 'deletion_page.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  final VoidCallback onDelete;

  const ProductDetailPage({super.key, required this.product, required this.onDelete});

  @override _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override Widget build(BuildContext context) {
    const placeholderImage = 'lib/assets/images/not-image.png';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          IconButton(
            icon: Icon(
              widget.product.isLiked ? Icons.favorite : Icons.favorite_border,
              color: widget.product.isLiked ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                widget.product.toggleFavorite();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              widget.product.imageUrl.isNotEmpty ? widget.product.imageUrl : placeholderImage,
              fit: BoxFit.cover,
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Цена: ${widget.product.price}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeletionPage(
                      product: widget.product,
                      onDelete: widget.onDelete,
                    ),
                  ),
                );
              },
              child: const Text('Удалить продукт'),
            ),
          ],
        ),
      ),
    );
  }
}
