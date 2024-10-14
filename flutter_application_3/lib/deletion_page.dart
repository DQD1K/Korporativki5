import 'package:flutter/material.dart';
import 'main.dart';

class DeletionPage extends StatelessWidget {
  final Product product;
  final Function onDelete;

  const DeletionPage({required this.product, required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подтверждение удаления'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вы уверены, что хотите удалить "${product.name}"?',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onDelete(); 
                Navigator.of(context).pop(); 
                Navigator.of(context).pop(); 
              },
              child: const Text('Удалить'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
          ],
        ),
      ),
    );
  }
}
