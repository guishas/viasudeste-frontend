import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/vend_my_products_bloc.dart';
import 'package:viasudeste/src/models/produto_model.dart';

class VendedorMeusProdutos extends StatefulWidget {
  const VendedorMeusProdutos({ Key? key }) : super(key: key);

  @override
  State<VendedorMeusProdutos> createState() => _VendedorMeusProdutosState();
}

class _VendedorMeusProdutosState extends State<VendedorMeusProdutos> {

  late VendedorMeusProdutosBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = VendedorMeusProdutosBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text("Meus produtos"),
        centerTitle: true,
        backgroundColor: Styles.mainLightGreyColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<List<ProdutoModel>?>(
          stream: _bloc.produtosList.stream,
          builder: (context, snapshot) {
            return snapshot.hasData
              ? _bloc.produtosList.value!.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _bloc.produtosList.value!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            ObjMem.objetoHelp1 = ProdutoModel.fromJson(_bloc.produtosList.value![index].toJson());

                            var ret = await Navigator.pushNamed(context, Flows.produto);

                            if (ret != null) {
                              ObjMem.objetoHelp1 = null;
                            }
                          },
                          child: Container(
                            height: 120,
                            child: Card(
                              elevation: 6.0,
                              child: Row(
                                children: [
                                  _bloc.produtosList.value![index].produtoImagem == null
                                  ? Image.asset(
                                    'assets/images/viasudeste-logo-preto.png',
                                    width: 90,
                                    height: 120,
                                    fit: BoxFit.contain,
                                  )
                                  : Image.network(
                                    _bloc.produtosList.value![index].produtoImagem.toString(),
                                    width: 60,
                                    height: 120,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            _bloc.produtosList.value![index].produtoNome.toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            _bloc.produtosList.value![index].produtoDescricao.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                _bloc.produtosList.value![index].produtoPreco.toString().split(".")[1].length == 1
                                                ? "R\$ " + _bloc.produtosList.value![index].produtoPreco.toString().replaceAll('.', ",") + "0"
                                                : "R\$ " + _bloc.produtosList.value![index].produtoPreco.toString().replaceAll('.', ","),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Você ainda não possui nenhum produto!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushReplacementNamed(context, Flows.criar_produto);
                            }, 
                            child: Text(
                              'Criar um produto',
                              style: TextStyle(
                                fontFamily: 'Cutive Mono',
                                fontWeight: FontWeight.bold,
                                color: Styles.mainBlackColor,
                                fontSize: 16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Styles.mainLightPinkColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                              fixedSize: Size(MediaQuery.of(context).size.width * 0.6, 45),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              : Center(
                  child: CircularProgressIndicator(
                    color: Styles.mainPinkColor,
                  ),
                );
          },
        ),
      ),
    );
  }
}