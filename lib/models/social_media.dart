class SocialMedia {
  final String filePath;
  final String socialName;
  final String codeName;

  const SocialMedia({
    required this.filePath,
    required this.socialName,
    required this.codeName,
  });
}

List<SocialMedia> socialMedias = [
  const SocialMedia(
    filePath: "assets/images/instagram.png",
    socialName: "Instagram",
    codeName: 'instagram',
  ),
  const SocialMedia(
    filePath: "assets/images/linkedin.png",
    socialName: "Linked In",
    codeName: 'linkedin',
  ),
  const SocialMedia(
    filePath: "assets/images/snapchat.png",
    socialName: "Snapchat",
    codeName: 'snapchat',
  ),
  const SocialMedia(
    filePath: "assets/images/facebook.png",
    socialName: "Facebook",
    codeName: 'facebook',
  ),
  const SocialMedia(
    filePath: "assets/images/x.png",
    socialName: "Twitter(X)",
    codeName: 'twitter',
  )
];
