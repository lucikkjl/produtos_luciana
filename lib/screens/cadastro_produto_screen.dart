import 'package:flutter/material.dart';
import '../models/produto.dart';

class CadastroProdutoScreen extends StatefulWidget {
  const CadastroProdutoScreen({super.key});

  @override
  State<CadastroProdutoScreen> createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _descricaoController = TextEditingController(); 

  void _salvarProduto() {
    final String nome = _nomeController.text;
    final String precoTexto = _precoController.text.replaceAll(',', '.');
    final double? preco = double.tryParse(precoTexto);
    final String descricao = _descricaoController.text;

    if (nome.isNotEmpty && preco != null && preco > 0 && descricao.isNotEmpty) {
      final novoProduto = Produto(
        nome: nome, 
        preco: preco, 
        descricao: descricao 
      );
      Navigator.pop(context, novoProduto);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos corretamente!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Produto'),
        backgroundColor: const Color.fromARGB(255, 155, 117, 95),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Produto', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(labelText: 'Preço (R\$)', border: OutlineInputBorder()),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição do Produto', border: OutlineInputBorder()),
              maxLines: 3, 
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 155, 117, 95), foregroundColor: Colors.white),
                onPressed: _salvarProduto,
                child: const Text('Salvar Produto', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}