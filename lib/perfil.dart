import 'package:flutter/material.dart';
import 'package:loja/editar-perfil.dart';
import 'package:loja/main.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class PerfilData {
  String nome;
  int idade;
  String email;
  String telefone;
  String endereco;
  String profissao;

  PerfilData({
    required this.nome,
    required this.idade,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.profissao,
  });
}

PerfilData perfil = PerfilData(
  nome: 'Nome Padrão',
  idade: 0,
  email: 'email@email.com',
  telefone: '(00) 00000-0000',
  endereco: 'Seu endereço, 123',
  profissao: 'Sua profissão',
);

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil'), centerTitle: true),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListView(padding: const EdgeInsets.all(16), children: [
                const SizedBox(height: 20),
               Container(
                alignment: Alignment.center,
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://mercadohoje.uai.com.br/wp-content/uploads/2022/02/venda-vasco-1280x720.jpg'),
                
                ),
                
               ),
                _info('Nome', perfil.nome),
                _info('Idade', '${perfil.idade}'),
                _info('E-mail', perfil.email),
                _info('Telefone', perfil.telefone),
                _info('Endereço', perfil.endereco),
                _info('Profissão', perfil.profissao),
                const SizedBox(height: 24),
                Center(
                    child: ElevatedButton.icon(
                        icon: const Icon(Icons.edit),
                        label: const Text('Editar Perfil'),
                        style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 150, 240, 156),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),)),
                        onPressed: () async {
                          final resultado = await Navigator.push(
                          context,
                           MaterialPageRoute(
                          builder: (context) => FormPerfil(perfil: perfil),
                          
                          ),
                          );
                           if (resultado != null && resultado is PerfilData) {
                             setState(() {
                              perfil = resultado;
                           });
                           }

                        }
                    )
                  )
                ]
              )
            )
          ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
          BottomNavigationBarItem(
            label: 'Meu Perfil',
            icon: const Icon(Icons.person_outlined),
            activeIcon: const Icon(Icons.person),
            backgroundColor: Colors.green[600],
          ),
        ],
      ),
    );
  }
  Widget _info(String label, String value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          Text(value,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 12),
        ],
      );
}
