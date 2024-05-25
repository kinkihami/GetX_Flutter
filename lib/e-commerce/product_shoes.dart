List shoeList = [
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/7fb3501a-ed53-422a-a454-1bf116a13324/impact-4-basketball-shoes-CcJxBx.png',
      title: 'Nike Impact 4',
      id: 1,
      description: 'Basket Shoes Elevate your game and your hope.',
      price: 11800.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/30d7afaa-343b-4439-b65d-bb544c65420e/revolution-7-road-running-shoes-dC34tK.png',
      title: 'Nike Revolution 7',
      description: 'Road Running Shoe.',
      id: 2,
      price: 3695.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/e4060b19-289e-43b4-8375-c047c1cf6ab6/air-max-pulse-shoes-2bZSZV.png',
      title: 'Nike Air Max Pulse',
      description:
          'Charged with Max Air cushioning in the heel, this lightweight',
      id: 3,
      price: 13297.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/b9542e6b-db03-4ef3-8df5-7eb07de98020/interact-run-road-running-shoes-qVxgms.png',
      title: 'Nike Running Shoe',
      description:
          'Fast-forward your footsteps in the cutting-edge Nike Interact Run.',
      id: 4,
      price: 7499.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/c76e2119-acb7-4944-9085-d4f5ae2bda4a/go-flyease-easy-on-off-shoes-3svRCL.png',
      title: 'Nike Go FlyEase',
      description: 'New Casual Model Shoe',
      id: 5,
      price: 14195.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/14de6943-8c87-4b9b-9585-80dea96a70d3/air-max-97-shoes-EBZrb8.png',
      title: 'Nike Air Max 97',
      description: 'Newest Model by Nike',
      id: 6,
      price: 16147.00),
  ShoeModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbVSBEEVzZ3FMz8x0NhciMN5W7-Joafi6qr6W_pXo3VQ&s',
      title: 'Nike Air Max Dawn',
      description:
          'Rooted to sporty athletics DNA, the Air Max Dawn is thoughtfully crafted',
      id: 7,
      price: 9450.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/d94453ae-f341-4b1c-abe8-6d10902accf5/air-max-sc-shoes-NhF64M.png',
      title: 'Nike Air Max SC',
      description:
          'Soft synthetic suede and airy textile blend vintage running vibes with modern design.',
      id: 8,
      price: 6737.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/9e807aad-42e9-46e5-8f08-34e141e718e5/nikecourt-legacy-shoes-PKg8wX.png',
      title: 'Nike Court Legacy',
      description:
          'Let your attitude have the edge with flame-like caging that adds heat to the streets while airy mesh keeps you cool.',
      id: 9,
      price: 5695.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/fea9fd17-a50b-4d72-9eba-60a632b756cc/air-max-plus-shoes-Z0D37G.png',
      title: 'Nike Air Max Plus',
      description:
          'The Air Max Plus gives you a tuned Nike Air experience that offers premium stability and unbelievable cushioning.',
      id: 10,
      price: 8790.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/a19d87d7-a77d-4e75-b3a9-27c9aa4fa667/team-hustle-d-11-older-basketball-shoes-TBQxXL.png',
      title: 'Nike Team Hustle D 11',
      description: 'Padding in the heel and tongue adds to the soft feel.',
      id: 11,
      price: 4747.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/56c2eb6f-0730-4417-8cbe-97aa29d5c78a/air-force-1-shadow-shoes-3d774m.png',
      title: 'Nike Air Force 1',
      description:
          'Durable Traction Herringbone traction on the outsole helps control your movement and hold your ground.',
      id: 12,
      price: 11297.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/d76b79fd-e11d-458d-8177-fa1746921e21/revolution-7-road-running-shoes-Dfvsch.png',
      title: 'Nike Revolution 7',
      description: 'Road Running Shoe.',
      id: 13,
      price: 3695.00),
  ShoeModel(
      image:
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/451b4531-1090-4044-ad0f-fa9e2b6cd902/streakfly-road-racing-shoes-V17qZm.png',
      title: 'Nike Streakfly',
      description: 'Road Racing Shoe.',
      id: 14,
      price: 14995.00),
];

class ShoeModel {
  String image;
  String title;
  int id;
  String description;
  double price;
  ShoeModel(
      {required this.image,
      required this.title,
      required this.id,
      required this.description,
      required this.price});
}
