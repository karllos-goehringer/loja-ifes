import 'package:flutter/material.dart';
import 'package:loja/perfil.dart';



class FormPerfil extends StatefulWidget {
  final PerfilData perfil; // objeto passado com os dados iniciais

  const FormPerfil({super.key, required this.perfil});

  @override
  State<FormPerfil> createState() => _CadastroPessoaPageState();
}

class _CadastroPessoaPageState extends State<FormPerfil> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nomeController;
  late TextEditingController _idadeController;
  late TextEditingController _emailController;
  late TextEditingController _telefoneController;
  late TextEditingController _enderecoController;
  late TextEditingController _profissaoController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.perfil.nome);
    _idadeController = TextEditingController(text: widget.perfil.idade.toString());
    _emailController = TextEditingController(text: widget.perfil.email);
    _telefoneController = TextEditingController(text: widget.perfil.telefone);
    _enderecoController = TextEditingController(text: widget.perfil.endereco);
    _profissaoController = TextEditingController(text: widget.perfil.profissao);
  }

  void _salvarFormulario() {
    if (_formKey.currentState!.validate()) {
      final perfil = PerfilData(
        nome: _nomeController.text,
        idade: int.tryParse(_idadeController.text) ?? 0,
        email: _emailController.text,
        telefone: _telefoneController.text,
        endereco: _enderecoController.text,
        profissao: _profissaoController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil atualizado com sucesso!')),
      );
      Navigator.pop(context, perfil);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome completo'),
                validator: (v) => v!.isEmpty ? 'Informe o nome' : null,
              ),
              TextFormField(
                controller: _idadeController,
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _telefoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
              ),
              TextFormField(
                controller: _enderecoController,
                decoration: const InputDecoration(labelText: 'Endereço'),
              ),
              TextFormField(
                controller: _profissaoController,
                decoration: const InputDecoration(labelText: 'Profissão'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvarFormulario,
                child: const Text('Salvar Alterações'),
                style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 150, 240, 156),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}