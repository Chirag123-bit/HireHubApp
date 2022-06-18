import 'package:equatable/equatable.dart';
import 'package:hirehub/models/filterModels/Sallary.dart';

class SallaryFilter extends Equatable {
  final int id;
  final Sallary sallary;
  final bool value;

  const SallaryFilter({
    required this.sallary,
    required this.id,
    required this.value,
  });

  SallaryFilter copyWith({
    Sallary? sallary,
    int? id,
    bool? value,
  }) {
    return SallaryFilter(
      sallary: sallary ?? this.sallary,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, sallary, value];

  static List<SallaryFilter> filters = Sallary.sallaries.map((sallary) {
    return SallaryFilter(
      sallary: sallary,
      id: sallary.id,
      value: false,
    );
  }).toList();
}
