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
  Overview(header: 'Total Members', subheader: 'Registered', icon: HeroIcons.users),
  // Overview(header: 'Other Information', subheader: '0', icon: HeroIcons.briefcase),
  // Overview(
  //     header: 'Your Desire Information ',
  //     subheader: '54,00',
  //     icon: HeroIcons.currencyDollar),
  // Overview(
  //     header: 'Example Total Loans', subheader: '100,000', icon: HeroIcons.creditCard),
];
