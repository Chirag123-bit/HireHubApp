class Company {
  String? id;
  String? name;
  String? logo;
  String? about;
  String? description;
  String? country;
  String? region;

  Company({
    this.id,
    this.name,
    this.logo,
    this.about,
    this.description,
    this.country,
    this.region,
  });

  static List<Company> generatedCompanies() {
    return [
      Company(
        id: '1',
        name: "Air BnB",
        logo: "assets/icons/airbnb_logo.svg",
        about:
            "Aegis is a complete hotel and restaurant management software that covers the overall transaction of your hotel and restaurant operations. It is easier for you to streamline all tasks, increase revenue, control the expenses, and save the manpower cost. Products are featured from Front of the House to Back of the House with a single database. As per your business needs, we are ready to serve you with both Server Based and Cloud Based solutions.",
        description:
            "One-stop solution for managing restaurants, bars, resorts, and hotels effectively. Manage multiple tasks in real-time and increase the work efficiency in restaurants, bars, resorts, and hotels.",
        country: "United States",
        region: "California",
      ),
      Company(
        id: '2',
        name: "Apple Inc",
        logo: "assets/icons/apple_logo.svg",
        about:
            "Aegis is a complete hotel and restaurant management software that covers the overall transaction of your hotel and restaurant operations. It is easier for you to streamline all tasks, increase revenue, control the expenses, and save the manpower cost. Products are featured from Front of the House to Back of the House with a single database. As per your business needs, we are ready to serve you with both Server Based and Cloud Based solutions.",
        description:
            "One-stop solution for managing restaurants, bars, resorts, and hotels effectively. Manage multiple tasks in real-time and increase the work efficiency in restaurants, bars, resorts, and hotels.",
        country: "United States",
        region: "California",
      ),
      Company(
        id: '3',
        name: "Google",
        logo: "assets/icons/google_logo.svg",
        about:
            "Aegis is a complete hotel and restaurant management software that covers the overall transaction of your hotel and restaurant operations. It is easier for you to streamline all tasks, increase revenue, control the expenses, and save the manpower cost. Products are featured from Front of the House to Back of the House with a single database. As per your business needs, we are ready to serve you with both Server Based and Cloud Based solutions.",
        description:
            "One-stop solution for managing restaurants, bars, resorts, and hotels effectively. Manage multiple tasks in real-time and increase the work efficiency in restaurants, bars, resorts, and hotels.",
        country: "United States",
        region: "California",
      ),
      Company(
        id: '4',
        name: "Something",
        logo: "assets/icons/airbnb_logo.svg",
        about:
            "Aegis is a complete hotel and restaurant management software that covers the overall transaction of your hotel and restaurant operations. It is easier for you to streamline all tasks, increase revenue, control the expenses, and save the manpower cost. Products are featured from Front of the House to Back of the House with a single database. As per your business needs, we are ready to serve you with both Server Based and Cloud Based solutions.",
        description:
            "One-stop solution for managing restaurants, bars, resorts, and hotels effectively. Manage multiple tasks in real-time and increase the work efficiency in restaurants, bars, resorts, and hotels.",
        country: "United States",
        region: "California",
      ),
      Company(
        id: '5',
        name: "Apple",
        logo: "assets/icons/apple_logo.svg",
        about:
            "Aegis is a complete hotel and restaurant management software that covers the overall transaction of your hotel and restaurant operations. It is easier for you to streamline all tasks, increase revenue, control the expenses, and save the manpower cost. Products are featured from Front of the House to Back of the House with a single database. As per your business needs, we are ready to serve you with both Server Based and Cloud Based solutions.",
        description:
            "One-stop solution for managing restaurants, bars, resorts, and hotels effectively. Manage multiple tasks in real-time and increase the work efficiency in restaurants, bars, resorts, and hotels.",
        country: "United States",
        region: "California",
      ),
    ];
  }
}
