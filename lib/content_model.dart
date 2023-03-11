class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'HealTech',
      image: 'images/1.png',
      discription: "Provides easily accessible information"
          "  about healthcare facilities and healthcare"
          "        professionals"),
  UnbordingContent(
      title: 'Nearby Doctors',
      image: 'images/2.png',
      discription: "Adequate information about doctors"
          " and where to find them "),
  UnbordingContent(
      title: 'Customized Search',
      image: 'images/3.png',
      discription: "Search for doctors or hospitals according"
          "   to your needs and preferences  "),
];
