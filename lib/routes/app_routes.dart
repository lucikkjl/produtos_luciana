import 'package:flutter/material.dart';
import '../screens/lista_produtos_screen.dart';
import '../screens/cadastro_produto_screen.dart';

class AppRoutes {
  static const home = '/';
  static const cadastro = '/cadastro';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const ListaProdutosScreen(),
    cadastro: (_) => const CadastroProdutoScreen(),
  };
}