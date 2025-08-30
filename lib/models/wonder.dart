class Wonder{
  final String title;
  final String description;
  final String imageUrl;
  final String country;
  final String region;
  final Coordinates coordinates;

  Wonder( {required this.coordinates,required this.country,required this.region,required this.title, required this.description, required this.imageUrl});
}

class Coordinates{
  double latitude;
  double longitude;

  Coordinates( {required this.latitude, required this.longitude});
}

final wonderOfWorld = [
  Wonder(
    coordinates: Coordinates(latitude: 29.9792, longitude: 31.1342),
    country: 'Egypt',
    region: 'Giza Plateau, Northern Egypt',
    title: "Great Pyramid of Giza",
    description:
    "Located on the Giza Plateau near Cairo, the Great Pyramid is the oldest and largest of the three pyramids in the Giza Necropolis.",
    imageUrl:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Great_Pyramid_of_Giza_-_Pyramid_of_Khufu.jpg/960px-Great_Pyramid_of_Giza_-_Pyramid_of_Khufu.jpg",
  ),
  Wonder(
    coordinates: Coordinates(latitude: 32.5436, longitude: 44.4200),
    country: 'Iraq',
    region: 'Hillah, Babil Province',
    title: "Hanging Gardens of Babylon",
    description:
    "Said to be built in the ancient city of Babylon, the gardens were described as a lush, tiered marvel of engineering.",
    imageUrl:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Hanging_Gardens_of_Babylon.jpg/700px-Hanging_Gardens_of_Babylon.jpg",
  ),
  Wonder(
    coordinates: Coordinates(latitude: 37.6386, longitude: 21.6300),
    country: 'Greece',
    region: 'Olympia, Western Peloponnese',
    title: "Statue of Zeus at Olympia",
    description:
    "A massive seated statue of Zeus, crafted by Phidias around 435 BC, once stood in the Temple of Zeus in Olympia.",
    imageUrl:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Le_Jupiter_Olympien_ou_l%27art_de_la_sculpture_antique.jpg/500px-Le_Jupiter_Olympien_ou_l%27art_de_la_sculpture_antique.jpg",
  ),
  Wonder(
    coordinates: Coordinates(latitude: 37.9497, longitude: 27.3689),
    country: 'Turkey',
    region: 'Selçuk, İzmir Province',
    title: "Temple of Artemis",
    description:
    "Dedicated to the goddess Artemis, this grand temple in Ephesus was rebuilt multiple times before its final destruction.",
    imageUrl:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Miniaturk_009.jpg/500px-Miniaturk_009.jpg",
  ),
  Wonder(
    coordinates: Coordinates(latitude: 37.0379, longitude: 27.4241),
    country: 'Turkey',
    region: 'Bodrum, Muğla Province',
    title: "Mausoleum at Halicarnassus",
    description:
    "Built for Mausolus, a Persian satrap, this tomb was famed for its architectural beauty and sculptural reliefs.",
    imageUrl:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Mausoleum_at_Halicarnassus_at_the_Bodrum_Museum_of_Underwater_Archaeology.jpg/560px-Mausoleum_at_Halicarnassus_at_the_Bodrum_Museum_of_Underwater_Archaeology.jpg",
  ),
  Wonder(
    coordinates: Coordinates(latitude: 36.4510, longitude: 28.2278),
    country: 'Greece',
    region: 'Rhodes Island',
    title: "Colossus of Rhodes",
    description:
    "A towering statue of the sun god Helios, built to celebrate Rhodes' victory over invaders in 280 BC.",
    imageUrl:
    "https://upload.wikimedia.org/wikipedia/commons/7/74/Colossus_of_Rhodes_by_Ferdinand_Knab_%281886%29_cropped.png",
  ),
  Wonder(
    coordinates: Coordinates(latitude: 31.2135, longitude: 29.8853),
    country: 'Egypt',
    region: 'Alexandria, Mediterranean Coast',
    title: "Lighthouse of Alexandria",
    description:
    "Built on the island of Pharos, this lighthouse guided sailors safely into the busy port of Alexandria for centuries.",
    imageUrl:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Lighthouse_-_Thiersch.png/500px-Lighthouse_-_Thiersch.png",
  ),
];