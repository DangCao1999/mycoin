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
          child: Container(
            height: double.infinity,
            child: ListView.builder(
                itemCount: listHistoryCoin.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 80,
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
                                listHistoryCoin[index].cid.toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ))),
                          IconButton(
                            color: Colors.deepPurple.shade900,
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () => {
                              // Navigator.pop(context,coinsDTOFilter[index])
                            },
                          )
                        ],
                      ));
                }),
          ),
        );
      },
    );
  }
}
