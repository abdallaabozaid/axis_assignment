enum ProfileImageSize {
  small('w45'),
  medium('w185'),
  large('h632'),
  originalSize('original'),
  ;

  const ProfileImageSize(this.size);

  final String size;
}
