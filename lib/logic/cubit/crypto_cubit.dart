import 'dart:convert';
import 'dart:developer';
import 'package:crypto_app/data/model/cryptocurrency_price_model.dart';
import 'package:crypto_app/logic/cubit/crypto_ticker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

class CryptocurrencyCubit extends Cubit<CryptoTickerState> {
  late WebSocketChannel _channel;
  List<CryptocurrencyPriceModel> _prices = [];

  CryptocurrencyCubit() : super(CryptoTickerInitialState()) {
    _connectWebSocket();
  }

  void _connectWebSocket() {
    try {
      emit(CryptoTickerLoadingState(state.tickers));

      _channel = WebSocketChannel.connect(
        Uri.parse('ws://prereg.ex.api.ampiy.com/prices'),
      );

      _channel.sink.add('{"method": "SUBSCRIBE", "params": ["all@ticker"], "cid": 1}');

      _channel.stream.listen((data) {
        _handleWebSocketData(data);
      });
    } catch (e) {
      emit(CryptoTickerErrorState(state.tickers, 'Failed to connect to WebSocket: $e'));
    }
  }

 
  void _handleWebSocketData(dynamic data) {
    try {
     
      final jsonData = jsonDecode(data);

      if (jsonData['data'] != null && jsonData['data'] is List) {
        final priceList = (jsonData['data'] as List<dynamic>)
            .map((item) => CryptocurrencyPriceModel.fromJson(item))
            .toList();

        _prices = priceList;
        emit(CryptoTickerLoadedState(_prices));
      } else {
        // Handle the case where 'data' is null or not a list
        emit(CryptoTickerLoadingState(state.tickers));  // Stay in the loading state
      }
    } catch (e) {
 
      emit(CryptoTickerErrorState(state.tickers, 'Error processing WebSocket data: $e'));
    }
  }

  @override
  Future<void> close() {
    _channel.sink.close();
    return super.close();
  }
}
