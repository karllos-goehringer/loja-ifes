import 'package:flutter/material.dart';
import 'package:flutter_application_1/dataset.dart';
import 'package:flutter_application_1/main.dart'; 

class CadastroProdutoPage extends StatefulWidget {
  final String title;
  const CadastroProdutoPage({super.key, required this.title});
  @override
  State<CadastroProdutoPage> createState() => _CadastroProdutoPageState();
}

class _CadastroProdutoPageState extends State<CadastroProdutoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descController = TextEditingController();
  final _valorController = TextEditingController();
  final _qtdController = TextEditingController();

  void _salvarProduto() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        produtos.add(
          Produto(
            id: produtos.length + 1,
            nome: _nomeController.text,
            desc: _descController.text,
            qtd: int.parse(_qtdController.text),
            valor: double.parse(_valorController.text),
          ),
        );
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Produto cadastrado com sucesso!'),
          backgroundColor: Color.fromARGB(255, 165, 226, 167),
        ),
      );
      _nomeController.clear();
      _descController.clear();
      _valorController.clear();
      _qtdController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do Produto',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.shopping_bag),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o nome do produto';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                  TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe uma descrição';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _qtdController,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.confirmation_number),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a quantidade';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Digite um número inteiro válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _valorController,
                  decoration: const InputDecoration(
                    labelText: 'Valor (R\$)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o valor';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Digite um valor numérico válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _salvarProduto,
                    icon: const Icon(Icons.save),
                    label: const Text(
                      'Salvar Produto',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 150, 240, 156),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
