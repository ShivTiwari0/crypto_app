import 'package:crypto_app/data/model/cryptocurrency_price_model.dart';

abstract class CryptoTickerState {
  final List<CryptocurrencyPriceModel> tickers;

  CryptoTickerState(this.tickers);
}

class CryptoTickerInitialState extends CryptoTickerState {
  CryptoTickerInitialState() : super([]);
}

class CryptoTickerLoadingState extends CryptoTickerState {
  CryptoTickerLoadingState(super.tickers);
}

class CryptoTickerLoadedState extends CryptoTickerState {
  CryptoTickerLoadedState(super.tickers);
}

class CryptoTickerErrorState extends CryptoTickerState {
  final String message;
  CryptoTickerErrorState(super.tickers, this.message);
}
