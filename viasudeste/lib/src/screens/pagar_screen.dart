import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/pagar_bloc.dart';

class PagarScreen extends StatefulWidget {
  const PagarScreen({ Key? key }) : super(key: key);

  @override
  State<PagarScreen> createState() => _PagarScreenState();
}

class _PagarScreenState extends State<PagarScreen> {

  late PagarBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = PagarBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento"),
        centerTitle: true,
        backgroundColor: Styles.mainLightGreyColor,
        toolbarHeight: 50,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border: Border.all(
                    color: Styles.mainLightGreyColor
                  )
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _bloc.produtos!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 120,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            elevation: 6.0,
                            child: Row(
                              children: [
                                _bloc.produtos![index].produtoImagem == null
                                ? Image.asset(
                                  'assets/images/viasudeste-logo-preto.png',
                                  width: 90,
                                  height: 120,
                                  fit: BoxFit.contain,
                                )
                                : Image.network(
                                  _bloc.produtos![index].produtoImagem.toString(),
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
                                          _bloc.produtos![index].produtoNome.toString(),
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
                                          _bloc.produtos![index].produtoDescricao.toString(),
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
                                              _bloc.produtos![index].produtoPreco.toString().split(".")[1].length == 1
                                              ? "R\$ " + _bloc.produtos![index].produtoPreco.toString().replaceAll('.', ",") + "0"
                                              : "R\$ " + _bloc.produtos![index].produtoPreco.toString().replaceAll('.', ","),
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
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 5, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Total à ser pago: ",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            _bloc.getTotal().split(".")[1].length == 1
                            ? "R\$ " + _bloc.getTotal().replaceAll('.', ",") + "0"
                            : "R\$ " + _bloc.getTotal().replaceAll('.', ","),
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}