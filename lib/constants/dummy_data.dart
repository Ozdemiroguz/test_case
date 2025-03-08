// Data storage
import 'package:test_case/constants/colors.dart';
import 'package:test_case/features/profile/domain/models/bonus.dart';
import 'package:test_case/features/profile/domain/models/token_package.dart';

List<Bonus> bonusList = [
  Bonus(title: "Premium Hesap", iconPath: "assets/images/diamond.png"),
  Bonus(title: "Daha Fazla Eşleşme", iconPath: "assets/images/twoheart.png"),
  Bonus(title: "Öne Çıkarma", iconPath: "assets/images/arrow.png"),
  Bonus(title: "Daha Fazla Beğeni", iconPath: "assets/images/oneheart.png"),
];

List<TokenPackage> tokenPackages = [
  TokenPackage(
      color: AppColors.offer1,
      bonus: "+10%",
      oldAmount: "200",
      newAmount: "330",
      price: "₺99,99"),
  TokenPackage(
      color: AppColors.offer2,
      bonus: "+70%",
      oldAmount: "2.000",
      newAmount: "3.375",
      price: "₺799,99"),
  TokenPackage(
      color: AppColors.offer1,
      bonus: "+35%",
      oldAmount: "1.000",
      newAmount: "1.350",
      price: "₺399,99"),
];
