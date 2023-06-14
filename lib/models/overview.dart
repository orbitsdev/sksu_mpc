import 'package:heroicons/heroicons.dart';

class Overview {
  final String header;
  final String subheader;
  final HeroIcons icon;
  Overview({
    required this.header,
    required this.subheader,
    required this.icon,
  });
}

List<Overview> overview = [
  Overview(header: 'Total Members', subheader: '24', icon: HeroIcons.users),
  Overview(
      header: 'Typ1 Member  1', subheader: '23', icon: HeroIcons.briefcase),
  Overview(
      header: 'Type2 Member ',
      subheader: '54,00',
      icon: HeroIcons.currencyDollar),
  Overview(
      header: 'Total Loans', subheader: '100,000', icon: HeroIcons.creditCard),
];
