import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../routes/app_routes.dart'; 
import 'detalhes_produto_screen.dart';

class ListaProdutosScreen extends StatefulWidget {
  const ListaProdutosScreen({super.key});

  @override
  State<ListaProdutosScreen> createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {
  List<Produto> produtos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
        backgroundColor: const Color.fromARGB(255, 155, 117, 95),
        foregroundColor: Colors.white,
      ),
      body: produtos.isEmpty
          ? const Center(
              child: Text(
                'Nenhum produto cadastrado.\nClique no botão + para adicionar.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(produto.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalhesProdutoScreen(produto: produto),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 155, 117, 95),
        foregroundColor: Colors.white,
        onPressed: () async {
          final Produto? novoProduto = await Navigator.pushNamed(
            context, 
            AppRoutes.cadastro
          ) as Produto?;

          if (novoProduto != null) {
            setState(() {
              produtos.add(novoProduto);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}