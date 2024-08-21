import 'package:crypto_app/core/ui.dart';
import 'package:crypto_app/logic/cubit/crypto_cubit.dart';
import 'package:crypto_app/logic/cubit/crypto_ticker_state.dart';
import 'package:crypto_app/presentation/widget/crypto_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptocurrencyScreen extends StatefulWidget {
  const CryptocurrencyScreen({super.key});

  static const routeName= " Crypto Screen";

  @override
  CryptocurrencyScreenState createState() => CryptocurrencyScreenState();
}

class CryptocurrencyScreenState extends State<CryptocurrencyScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text('Coins'), 
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search by code',
                  labelStyle:  
                      TextStyle(color: AppColors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.white), 
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.white),
                  ),
                  prefixIcon: Icon(Icons.search,
                      color: AppColors.white),
                ),
                style: TextStyle(color: AppColors.white),
                cursorColor: AppColors.white, 
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query.toUpperCase();
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<CryptocurrencyCubit, CryptoTickerState>(
                builder: (context, state) {
                  if (state is CryptoTickerLoadingState &&
                      state.tickers.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CryptoTickerLoadedState) {
                    final filteredTickers = state.tickers.where((price) {
                      return price.symbol!.toUpperCase().contains(_searchQuery);
                    }).toList();

                    if (filteredTickers.isEmpty) {
                      return const Center(
                          child: Text('No matching cryptocurrencies.'));
                    }

                    return ListView.builder(
                      itemCount: filteredTickers.length,
                      itemBuilder: (context, index) {
                        final price = filteredTickers[index];
                        return CryptoListTile(
                          cPrice: price.currentPrice,
                          perChnage: price.priceChangePercent,
                          symbol: price.symbol,
                          priceChnage: price.priceChange,
                        );
                      },
                    );
                  } else if (state is CryptoTickerErrorState &&
                      state.tickers.isEmpty) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return const Center(child: Text('No data available.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
