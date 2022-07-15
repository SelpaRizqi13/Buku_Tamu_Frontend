class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'] ?? '')).toList();

var carouselsData = [
  {"image": "assets/images/image1.jpg"},
  {"image": "assets/images/image1.jpg"},
  {"image": "assets/images/image1.jpg"},
];
