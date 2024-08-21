import 'package:crypto_app/core/extension.dart';
import 'package:crypto_app/core/ui.dart';
import 'package:crypto_app/logic/cubit/crypto_cubit.dart';
import 'package:crypto_app/logic/cubit/crypto_ticker_state.dart';
import 'package:crypto_app/presentation/screens/crypto_screens.dart';
import 'package:crypto_app/presentation/widget/crypto_list_tile.dart';
import 'package:crypto_app/presentation/widget/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [Icon(Icons.notifications)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome To AMPIY',
              style: TextStyles.heading3,
            ),
            SizedBox(
              height: context.height() * 0.01,
            ),
            Text(
              'Buy your first crypto Asset today',
              style: TextStyles.body1,
            ),
            SizedBox(
              height: context.height() * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
              child: PrimaryButton(
                text: "Verify Account",
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: context.height() * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                icons(Icons.add_circle, "Buy"),
                icons(CupertinoIcons.minus_circle_fill, "Sell"),
                icons(CupertinoIcons.profile_circled, "Referral"),
                icons(CupertinoIcons.video_camera_solid, "Tutorial"),
              ],
            ),
            SizedBox(
              height: context.height() * 0.025,
            ),
            Container(
              width: context.width() * 0.95,
              height: context.height() * 0.17,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 27, 34, 58),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Wealth with SP",
                          style: TextStyle(color: AppColors.white),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Invest Grow Repeat. Groe wour with\nSIP now",
                          style: TextStyle(
                              color: AppColors.textLight, fontSize: 12),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(AppColors.accent),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Start a SIP",
                                style: TextStyle(color: AppColors.white),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Image.asset('assets/crypto_logo/GirlWatering.png')
                ],
              ),
            ),
            SizedBox(
              height: context.height() * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  box(context,
                      title: "Sip Calculator",
                      subtitle: "Calculate interest and\nReturns",
                      icon1: Icons.calculate,
                      icon2: Icons.keyboard_arrow_right),
                  box(context,
                      title: "Deposit INR",
                      icon1: Icons.food_bank,
                      icon2: Icons.keyboard_arrow_right,
                      subtitle: "Use Upi or bank accound to trade or buy SIP")
                ],
              ),
            ),
            BlocBuilder<CryptocurrencyCubit, CryptoTickerState>(
              builder: (context, state) {
                if (state is CryptoTickerLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CryptoTickerLoadedState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      final data = state.tickers[index];
                      return CryptoListTile(
                        cPrice: data.currentPrice,
                        perChnage: data.priceChangePercent,
                        priceChnage: data.priceChange,
                        symbol: data.symbol,
                      );
                    },
                  );
                }
                return const Center(child: Text("No data Found"));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                text: "View All",
                color: const Color.fromARGB(255, 27, 34, 58),
                onPressed: () {
                  Navigator.pushNamed(context, CryptocurrencyScreen.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget icons(IconData? icon, String? name) {
  return Column(
    children: [
      Icon(
        icon,
        color: AppColors.accent,
      ),
      Text(
        name!,
        style: TextStyle(color: AppColors.white, fontSize: 12.5),
      )
    ],
  );
}

Widget box(BuildContext context,
    {String? title, String? subtitle, IconData? icon1, IconData? icon2}) {
  return Container(
    height: context.height() * 0.17,
    width: context.width() * 0.45,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 27, 34, 58),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(color: AppColors.text),
          ),
          Text(
            subtitle!,
            style: TextStyle(color: AppColors.textLight, fontSize: 12),
            maxLines: 2,
          ),
          SizedBox(
            height: context.height() * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon1,
                color: AppColors.accent,
              ),
              Icon(
                icon2,
                color: AppColors.accent,
              )
            ],
          )
        ],
      ),
    ),
  );
}
