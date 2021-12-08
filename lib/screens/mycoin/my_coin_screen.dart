import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycoin/cubit/history_coin/history_coin_cubit.dart';
import 'package:mycoin/cubit/user/user_cubit.dart';
import 'package:mycoin/data/model/history_coin.dart';
import 'package:mycoin/data/model/user.dart';

class MyCoinScreen extends StatelessWidget {
  const MyCoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCoinCubit, HistoryCoinState>(
      builder: (context, state) {
        if (state is HistoryCoinInitial || state is HistoryCoinSaveDone) {
          BlocProvider.of<HistoryCoinCubit>(context).getHistoryCoin("1");
          return Container(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        }
        if (state is HistoryCoinLoading) {
          return Container(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        }
        List<HistoryCoin> listHistoryCoin = (state as HistoryCoinLoaded).list;
        return RefreshIndicator(
          onRefresh: () {
            return Future(() {
              BlocProvider.of<HistoryCoinCubit>(context).getHistoryCoin("1");
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: double.infinity,
              child: ListView.builder(
                  itemCount: listHistoryCoin.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 80,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              "https://s2.coinmarketcap.com/static/img/coins/64x64/${listHistoryCoin[index].cid}.png",
                              width: 48,
                              height: 48,
                            ),
                            SizedBox(
                                height: 100,
                                width: 50,
                                child: Center(
                                    child: Text(
                                  listHistoryCoin[index].symbolCoin.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ))),
                            SizedBox(
                              height: 100,
                              width: 125,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                        color: Colors.yellow.shade700,
                                      ),
                                      Text(
                                        listHistoryCoin[index]
                                            .totalMoney
                                            .toStringAsFixed(2),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.pie_chart_outline,
                                        color: Colors.cyan,
                                      ),
                                      Text(
                                        listHistoryCoin[index]
                                            .profit
                                            .toStringAsFixed(2),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              (listHistoryCoin[index].profit <
                                                      0)
                                                  ? Colors.red
                                                  : Colors.green,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              color: Colors.blue.shade900,
                              icon: const Icon(Icons.info_outline),
                              onPressed: () => {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        behavior: SnackBarBehavior.fixed,
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.orange.shade400,
                                        content: Row(
                                          children: [
                                            Icon(
                                              Icons.local_fire_department,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              'Comming Soon!',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        )))
                              },
                            )
                          ],
                        ));
                  }),
            ),
          ),
        );
      },
    );
  }
}
