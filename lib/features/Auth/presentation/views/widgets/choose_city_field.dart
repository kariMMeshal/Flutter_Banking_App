import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ChooseCityField extends StatefulWidget {

  const ChooseCityField({
    super.key,
    required this.onChanged,
  });
  final Function(String?) onChanged;

  @override
  State<ChooseCityField> createState() => _ChooseCityFieldState();
}

class _ChooseCityFieldState extends State<ChooseCityField> {
  String? _selectedCity;
  List<DropdownMenuItem<String>> cities = [
    const DropdownMenuItem(value: 'Cairo', child: Text('Cairo')),
    const DropdownMenuItem(value: 'Alexandria', child: Text('Alexandria')),
    const DropdownMenuItem(value: 'Giza', child: Text('Giza')),
    const DropdownMenuItem(value: 'Port Said', child: Text('Port Said')),
    const DropdownMenuItem(value: 'Suez', child: Text('Suez')),
    const DropdownMenuItem(value: 'Luxor', child: Text('Luxor')),
    const DropdownMenuItem(value: 'Aswan', child: Text('Aswan')),
    const DropdownMenuItem(value: 'Sharm El-Sheikh', child: Text('Sharm El-Sheikh')),
    const DropdownMenuItem(value: 'Hurghada', child: Text('Hurghada')),
    const DropdownMenuItem(value: 'Marsa Alam', child: Text('Marsa Alam')),
    const DropdownMenuItem(value: 'Ismailia', child: Text('Ismailia')),
    const DropdownMenuItem(value: 'Damanhur', child: Text('Damanhur')),
    const DropdownMenuItem(value: 'El Minya', child: Text('El Minya')),
    const DropdownMenuItem(value: 'Asyut', child: Text('Asyut')),
    const DropdownMenuItem(value: 'Qena', child: Text('Qena')),
    const DropdownMenuItem(value: 'Sohag', child: Text('Sohag')),
    const DropdownMenuItem(value: 'Beni Suef', child: Text('Beni Suef')),
    const DropdownMenuItem(value: 'Tanta', child: Text('Tanta')),
    const DropdownMenuItem(value: 'Zagazig', child: Text('Zagazig')),
    const DropdownMenuItem(value: 'Banha', child: Text('Banha')),
    const DropdownMenuItem(value: 'Matruh', child: Text('Matruh')),
    const DropdownMenuItem(value: 'El Alamein', child: Text('El Alamein')),
  ];

  @override
  void initState() {
    super.initState();
    _selectedCity = null;  // Removing the initial value
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: kborder, width: .3),
        ),
      ),
      value: _selectedCity,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          _selectedCity = newValue;
          widget.onChanged(newValue); // Notify parent widget about the selected city
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a city';
        }
        return null;
      },
      items: cities,
      hint: const Text('Select a city'),  // This adds a hint text when no city is selected.
    );
  }
}
