import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/livros_controller.dart';
import '../Controller/login_controller.dart';
import '../Controller/tela_controller.dart';
import '../model/livros.dart';
import '0_classe_livros.dart';
import '1_tela_login.dart';

class TelaHomeAdmin extends StatefulWidget {
  const TelaHomeAdmin({super.key});

  @override
  State<TelaHomeAdmin> createState() => _TelaHomeAdminState();
}

class _TelaHomeAdminState extends State<TelaHomeAdmin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _opcaoSelecionada = 0;
  var txtimagem = TextEditingController();
  var txttitulo = TextEditingController();
  var txtautor = TextEditingController();

  void _abrirDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      endDrawer: buildEndDrawer(context),
      key: _scaffoldKey,
      body: BackgroundImage(
        imagePath: 'lib/images/Livro.png',
        child: StreamBuilder<QuerySnapshot>(
          stream: LivrosController().listarAdmin().snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Não foi possível conectar.'),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  return GridView.builder(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 15,
                      right: 15
                    ),
                    itemCount: dados.size,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      String id = dados.docs[index].id;
                      dynamic item = dados.docs[index].data();
                      return GestureDetector(
                        onTap: () {
                            txtimagem.text = item['imagem'];
                            txttitulo.text = item['titulo'];
                            txtautor.text = item['autor'];
                            salvarLivro(context, docId: id);
                          },
                          onLongPress: () {
                            LivrosController().excluir(context, id);
                          },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                item['imagem'],
                                height: 170,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['titulo'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      item['autor'],
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ); 
                    },
                  );
                } else {
                  return Center(
                    child: Text('Nenhuma tarefa encontrada.'),
                  );
                }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          salvarLivro(context);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _opcaoSelecionada,
        onTap: (opcao){
          setState(() {
            _opcaoSelecionada = opcao;
          });

          if (opcao == 1)
            Navigator.popAndPushNamed(context, 'favorito');
          if (opcao == 2) 
            Navigator.popAndPushNamed(context, 'reserva');
          if (opcao == 3) _abrirDrawer();
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.black, size: 40),
            label: 'Início',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, color: Colors.black, size: 40),
            label: 'Favorito',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined, color: Colors.black, size: 40),
            label: 'Reserva',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.black, size: 40),
            label: 'Menu',
            backgroundColor: Colors.white,
          ),
        ],
      ),

    );
  }
  //
  // ADICIONAR LIVROS
  //
  void salvarLivro(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text("Adicionar Livros"),
          content: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: txtimagem,
                  decoration: InputDecoration(
                    labelText: 'URL da Imagem',
                    prefixIcon: Icon(Icons.menu_book_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txttitulo,
                  decoration: InputDecoration(
                    labelText: 'Titulo do Livro',
                    prefixIcon: Icon(Icons.menu_book_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtautor,
                  decoration: InputDecoration(
                    labelText: 'Autor do Livro',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          actions: [
            TextButton(
              child: Text("fechar"),
              onPressed: () {
                txtimagem.clear();
                txttitulo.clear();
                txtautor.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("adicionar"),
              onPressed: () {
                var l = Livro(
                  LoginController().idUsuario(),
                  txtimagem.text,
                  txttitulo.text,
                  txtautor.text,
                );
                txtimagem.clear();
                txttitulo.clear();
                txtautor.clear();
                if (docId == null) {
                  //
                  // ADICIONAR LIVRO
                  //
                  LivrosController().adicionar(context, l);
                } else {
                  //
                  // ATUALIZAR LIVRO
                  //
                  LivrosController().atualizar(context, docId, l);
                }
              },
            ),
          ],
        );
      },
    );
  }
}