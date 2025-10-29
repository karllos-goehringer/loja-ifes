import 'package:flutter/material.dart';
import 'package:flutter_application_1/cadastrarproduto.dart';
import 'package:flutter_application_1/carrinho.dart';
import 'package:flutter_application_1/dataset.dart';

int _selectedIndex = 0;
List carrinho = [];
List produtos = [
  Produto.fromMap({
    "id": 1,
    "nome": "Lápis HB",
    "desc": "Lápis HB da Castell",
    "valor": 19.75,
    "qtd": 200,
    "qtdSelecionada": 1,
  }),
  Produto.fromMap({
    "id": 2,
    "nome": "Lápis 2B",
    "desc": "Lápis 2B da Castell",
    "valor": 15.00,
    "qtd": 200,
    "qtdSelecionada": 1,

  }),
  Produto(
    id: 3,
    nome: "Lápis 6B",
    desc: "Lápis 6B da Castell",
    valor: 18.75,
    qtd: 200,
    qtdSelecionada: 1,
  ),
];

void carregarPagina(index, BuildContext context) {
  _selectedIndex = index;

  switch (_selectedIndex) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Lojinha IFES'),
        ),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ComprasPage(title: 'Carrinho Compras'),
        ),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CadastroProdutoPage(title: 'Cadastrar Produto'),
        ),
      );
      break;
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lojinha IFES', 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: const MyHomePage(title: 'Lojinha IFES'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  _adicionarCarrinhoComQuantidade(produto) {
    setState(() {
      Produto pAux = Produto(
        id: produto.id,
        nome: produto.nome,
        desc: produto.desc,
        valor: produto.valor,
        qtd: produto.qtd,
        qtdSelecionada: produto.qtdSelecionada,
      );
      carrinho.add(pAux);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lojinha IFES')),
      body: Center(
        child: ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {},
              leading: Text(
                'R\$ ${produtos[index].valor.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              title: Text(produtos[index].nome),
              subtitle: Text(produtos[index].desc),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        if (produtos[index].qtdSelecionada > 1) {
                          produtos[index].qtdSelecionada--;
                        }
                      });
                    },
                  ),
                  Text(
                    produtos[index].qtdSelecionada
                        .toString(), 
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.green),
                    onPressed: () {
                      setState(() {
                        if (produtos[index].qtdSelecionada <
                            produtos[index].qtd) {
                          produtos[index].qtdSelecionada++;
                        }
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      _adicionarCarrinhoComQuantidade(produtos[index]);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            carregarPagina(index, context);
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Principal',
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
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
