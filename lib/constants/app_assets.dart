abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  final String noAvatar = 'assets/images/bitmap/no_avatar.png';

  final String logoImage = 'assets/images/bitmap/splash_logo.png';
  final String noPorudctFound = 'assets/images/bitmap/failure.jpg';
}

class _Svg {
  const _Svg();
  final String account = 'assets/images/svg/account.svg';
  final String password = 'assets/images/svg/password.svg';
}
