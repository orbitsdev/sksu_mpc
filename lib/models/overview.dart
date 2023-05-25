

import 'package:heroicons/heroicons.dart';

class Overview {


final String header;
final String subheader;
final HeroIcons  icon;
  Overview({
    required this.header,
    required this.subheader,
    required this.icon,
  });
}


List<Overview> overview = [
 Overview(header: 'Total Shares', subheader: '54,00' , icon: HeroIcons.chartPie),
 Overview(header: 'Total Loan', subheader: '54,00' , icon: HeroIcons.briefcase ),
 Overview(header: 'Total Time Deposit', subheader: '54,00' , icon: HeroIcons.currencyDollar ),
 Overview(header: 'Total Widrawal', subheader: '100,000' , icon: HeroIcons.creditCard ),
];
