import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isCartEmpty = true;

  changeCartStatus() {
    setState(() {
      isCartEmpty = !isCartEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            changeCartStatus();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOutCirc,
            width: isCartEmpty ? 80.0 : 200,
            height: 60.0,
            decoration: BoxDecoration(
              color: isCartEmpty ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(isCartEmpty?10.0:50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  isCartEmpty ? Icons.shopping_cart : Icons.check,
                  color: Colors.white,
                ),
                Visibility(
                  visible: !isCartEmpty,
                  child: const SizedBox(
                    width: 10,
                  ),
                ),
                Visibility(
                  visible: !isCartEmpty,
                  child: const Flexible(
                    child: Text(
                      'Added to Cart',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
