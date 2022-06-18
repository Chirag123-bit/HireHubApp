import 'package:equatable/equatable.dart';

class Sallary extends Equatable {
  final int id;
  final String sallary;

  const Sallary({
    required this.id,
    required this.sallary,
  });
  @override
  List<Object> get props => [id, sallary];

  static List<Sallary> sallaries = [
    const Sallary(id: 1, sallary: '\$'),
    const Sallary(id: 2, sallary: '\$\$'),
    const Sallary(id: 3, sallary: '\$\$\$'),
  ];
}
