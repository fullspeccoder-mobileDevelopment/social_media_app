class SocialMedia {
  final String filePath;
  final String socialName;

  const SocialMedia({required this.filePath, required this.socialName});
}

List<SocialMedia> socialMedias = [
  const SocialMedia(
    filePath: "assets/images/instagram.png",
    socialName: "Instagram",
  ),
  const SocialMedia(
    filePath: "assets/images/linkedin.png",
    socialName: "Linked In",
  ),
  const SocialMedia(
    filePath: "assets/images/snapchat.png",
    socialName: "Snapchat",
  ),
  const SocialMedia(
    filePath: "assets/images/facebook.png",
    socialName: "Facebook",
  ),
  const SocialMedia(
    filePath: "assets/images/x.png",
    socialName: "Twitter(X)",
  )
];
