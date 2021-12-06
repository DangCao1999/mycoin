import 'package:dio/dio.dart';
import 'package:mycoin/config/enviroment.dart';
import 'package:mycoin/data/model/coin.dart';


class CoinRepository{
  Dio _dio = Dio();
  
  CoinRepository(){
    _dio.options.headers['X-CMC_PRO_API_KEY'] = "f54ac839-b8eb-437b-8bb8-724bae64d64a";
  }

  Future<List<Coin>> fetchCoinTop() async
  {
    List<Coin> coinsData = [];
    var response  = await _dio.get(Enviroment.endPoint + "/v1/cryptocurrency/listings/latest");
    var data = response.data["data"] as List;
    coinsData = data.map((coin) => Coin.fromJson(coin)).toList();
    print(coinsData[0].id);
    return coinsData;
  }
}