import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ChooseCityField extends StatefulWidget {
  final Function(String?) onChanged;

  const ChooseCityField({
    super.key,
    required this.onChanged,
  });

  @override
  State<ChooseCityField> createState() => _ChooseCityFieldState();
}

class _ChooseCityFieldState extends State<ChooseCityField> {
  String? _selectedCity;
  List<DropdownMenuItem<String>> cities = [
    DropdownMenuItem(value: "Cairo", child: Text("Cairo")),
    DropdownMenuItem(value: "Alexandria", child: Text("Alexandria")),
    DropdownMenuItem(value: "Giza", child: Text("Giza")),
    DropdownMenuItem(value: "Port Said", child: Text("Port Said")),
    DropdownMenuItem(value: "Suez", child: Text("Suez")),
    DropdownMenuItem(value: "Luxor", child: Text("Luxor")),
    DropdownMenuItem(value: "Aswan", child: Text("Aswan")),
    DropdownMenuItem(value: "Sharm El-Sheikh", child: Text("Sharm El-Sheikh")),
    DropdownMenuItem(value: "Hurghada", child: Text("Hurghada")),
    DropdownMenuItem(value: "Marsa Alam", child: Text("Marsa Alam")),
    DropdownMenuItem(value: "Ismailia", child: Text("Ismailia")),
    DropdownMenuItem(value: "Damanhur", child: Text("Damanhur")),
    DropdownMenuItem(value: "El Minya", child: Text("El Minya")),
    DropdownMenuItem(value: "Asyut", child: Text("Asyut")),
    DropdownMenuItem(value: "Qena", child: Text("Qena")),
    DropdownMenuItem(value: "Sohag", child: Text("Sohag")),
    DropdownMenuItem(value: "Beni Suef", child: Text("Beni Suef")),
    DropdownMenuItem(value: "Tanta", child: Text("Tanta")),
    DropdownMenuItem(value: "Zagazig", child: Text("Zagazig")),
    DropdownMenuItem(value: "Banha", child: Text("Banha")),
    DropdownMenuItem(value: "Matruh", child: Text("Matruh")),
    DropdownMenuItem(value: "El Alamein", child: Text("El Alamein")),
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
          borderSide: BorderSide(color: kborder, width: .3),
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
      hint: Text("Select a city"),  // This adds a hint text when no city is selected.
    );
  }
}
