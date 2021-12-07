import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycoin/cubit/coinDTO/coindto_cubit.dart';
import 'package:mycoin/data/dto/coin_dto.dart';

class BottomSheetSearchCoin extends StatefulWidget {
  BottomSheetSearchCoin({Key? key}) : super(key: key);

  @override
  State<BottomSheetSearchCoin> createState() => _BottomSheetSearchCoinState();
}

class _BottomSheetSearchCoinState extends State<BottomSheetSearchCoin> {
  TextEditingController controller = TextEditingController();
  late List<CoinDTO> coinsDTO;
  late List<CoinDTO> coinsDTOFilter;
  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      String keyWord = controller.text;
      setState(() {
        coinsDTOFilter = coinsDTO
            .where((element) =>
                element.name!.contains(keyWord) ||
                element.symbol!.contains(keyWord.toUpperCase()))
            .toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinDTOCubit, CoinDTOState>(
      builder: (context, state) {
        if (state is CoinDTOInitial) {
          BlocProvider.of<CoinDTOCubit>(context).getAllCoins();
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            height: 600,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        if (state is CoinDTOLoading) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            height: 600,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        coinsDTO = (state as CoinDTOLoaded).coinsDTO;
        if (controller.text == "") {
          coinsDTOFilter = coinsDTO;
        }
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          height: 600,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      hintText: 'Search Coin symbol ex: BTC'),
                  controller: controller,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 490,
                  child: ListView.builder(
                      itemCount: coinsDTOFilter.length,
                      itemBuilder: (context, index) {
                        // return Text(coinsDTOFilter[index].symbol.toString());
                        return Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "https://s2.coinmarketcap.com/static/img/coins/64x64/${coinsDTOFilter[index].id}.png",
                                width: 48,
                                height: 48,
                              ),
                              SizedBox(
                                  height: 100,
                                  width: 50,
                                  child: Center(
                                      child: Text(
                                    coinsDTOFilter[index].symbol.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ))),
                              IconButton(
                                color: Colors.deepPurple.shade900,
                                icon: const Icon(Icons.favorite_border),
                                onPressed: () => {},
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
