import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class ComprasPage extends StatefulWidget {
  final String title;
  const ComprasPage({super.key, required this.title});
  @override
  State createState() => _ComprasPageState();
}

class _ComprasPageState extends State {
  _removerCarrinho(index) {
    setState(() {
      carrinho.removeAt(index);
    });
  }

  double _calcularTotal() {
    double total = 0.0;
    for (var item in carrinho) {
      total += item.valor * item.qtdSelecionada;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Carrinho')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: carrinho.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    'R\$ ${carrinho[index].valor.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  title: Text(carrinho[index].nome),
                  subtitle: Text(carrinho[index].desc),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Qtd: ${carrinho[index].qtdSelecionada}'),
                      const SizedBox(width: 8), // Add some spacing
                      IconButton(
                        onPressed: () {
                          _removerCarrinho(index);
                        },
                        icon: const Icon(
                          Icons.remove_shopping_cart,
                          color: Colors.red,
                        ),
                        tooltip: 'Remover do carrinho', 
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.green[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'R\$ ${_calcularTotal().toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (int index) {
          setState(() {
            carregarPagina(index, context);
          });
        },
        items: [
          const BottomNavigationBarItem(
            label: 'Principal',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Compras',
            icon: const Icon(Icons.shopping_bag_outlined),
            activeIcon: const Icon(Icons.shopping_bag),
            backgroundColor: Colors.green[600],
          ),
          BottomNavigationBarItem(
            label: 'Cadastrar Produto',
            icon: const Icon(Icons.bookmark_add_outlined),
            activeIcon: const Icon(Icons.bookmark_add),
            backgroundColor: Colors.green[600],
          ),
        ],
      ),
    );
  }
}
