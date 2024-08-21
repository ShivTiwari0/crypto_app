class CryptocurrencyPriceModel {
  final String? symbol;
  final double? priceChange;
  final double? priceChangePercent;
  final double? currentPrice;
  final double? openPrice;
  final double ?highPrice;
  final double? lowPrice;
  final double ?bestBidPrice;
  final double? bestAskPrice;

  CryptocurrencyPriceModel({
     this.symbol,
     this.priceChange,
     this.priceChangePercent,
     this.currentPrice,
     this.openPrice,
     this.highPrice,
     this.lowPrice,
     this.bestBidPrice,
     this.bestAskPrice,
  });

  factory CryptocurrencyPriceModel.fromJson(Map<String, dynamic> json) {
    return CryptocurrencyPriceModel(
      symbol: json['s'] as String,
      priceChange: double.tryParse(json['p']),
      priceChangePercent: double.tryParse(json['P']),
      currentPrice: double.tryParse(json['c']),
      openPrice: double.tryParse(json['o']),
      highPrice: double.tryParse(json['h']),
      lowPrice: double.tryParse(json['l']),
      bestBidPrice: double.tryParse(json['b']),
      bestAskPrice: double.tryParse(json['a']),
    );
  }
}
