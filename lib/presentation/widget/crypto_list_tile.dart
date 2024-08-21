import 'package:crypto_app/core/ui.dart';
import 'package:flutter/material.dart';


class CryptoListTile extends StatelessWidget {
  final double? priceChnage;
   final double? perChnage;
   final String? symbol;
   final double? cPrice;
  const CryptoListTile({super.key, this.priceChnage, this.perChnage, this.symbol, this.cPrice});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(padding: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/crypto_logo/$symbol.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),SizedBox(width: size.width*0.04,),
              Column(
                children: [
                  Text(
                    symbol!,
                    style: TextStyles.body2.copyWith(color: AppColors.text),
                  ),
                  Text(
                    '₹ $cPrice',
                    style: TextStyle(color: AppColors.text),
                  ),
                ],
              ),SizedBox(width:size.width*0.2 ,),
              SizedBox(
                width: 150,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, 
                  children: [
                    Text(
                      '₹${priceChnage }',
                      style: TextStyle(
                        color: priceChnage! < 0 ? Colors.red : Colors.green,fontSize: 12
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle, // Makes the container circular
                          border: Border.all(
                            color: AppColors.textLight, // Set the border color
                            width: 2.0, // Set the border width
                          ),
                        ),
                        child: Row(
                          children: [
                            priceChnage! < 0
                                ? const Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Colors.red,
                                    size: 15,
                                  )
                                : const Icon(Icons.arrow_upward,
                                    color: Colors.green, size: 15),
                            Text(
                              '${perChnage}%',
                              style: TextStyle(
                                color: priceChnage! < 0 ? Colors.red : Colors.green,fontSize: 12
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ]
          ),const SizedBox(height: 5,) ,Divider(color: AppColors.textLight,),const SizedBox(height: 5,)
        ],
      ),
    );
  }
}