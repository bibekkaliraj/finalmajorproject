class DownloadBookModel {
  String title, author, image;
  int color;

  DownloadBookModel(
      {required this.title,
      required this.author,
      required this.image,
      required this.color});
}

List<DownloadBookModel> downloads = [
  DownloadBookModel(
      title: "AI Introductory Course",
      author: "Sikander Sultan",
      image: "assets/images/ai.jpg",
      color: 0xFFFFD3B6),
  DownloadBookModel(
      title: "Microprocessor",
      author: "Anokh Singh",
      image: "assets/images/micro.jpg",
      color: 0xFF2B325C),
  DownloadBookModel(
      title: "probability & Statistics",
      author: "T.T. Soong",
      image: "assets/images/probability.jpg",
      color: 0xFFF7EA4A0)
];
