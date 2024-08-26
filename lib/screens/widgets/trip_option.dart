import 'package:flutter/material.dart';
import 'package:yatri_cab/screens/widgets/airport_trip_from.dart';
import 'package:yatri_cab/screens/widgets/airport_trip_to.dart';
import 'package:yatri_cab/screens/widgets/local_trip.dart';
import 'package:yatri_cab/screens/widgets/round_outstation.dart';
import 'outstation_trip_form.dart'; // Import the form

class TripOptions extends StatefulWidget {
  @override
  _TripOptionsState createState() => _TripOptionsState();
}

class _TripOptionsState extends State<TripOptions> {
  String selectedTripOption = 'Outstation Trip';
  String selectedTripType = 'One-way';
  String selectedAirTripType = 'To The Airport';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TripOptionButton(
                icon: Icons.location_on,
                label: 'Outstation Trip',
                isSelected: selectedTripOption == 'Outstation Trip',
                onPressed: () {
                  setState(() {
                    selectedTripOption = 'Outstation Trip';
                    selectedTripType = 'One-way'; 
                  });
                },
              ),
            ),
            Expanded(
              child: TripOptionButton(
                icon: Icons.person_pin_circle,
                label: 'Local Trip',
                isSelected: selectedTripOption == 'Local Trip',
                onPressed: () {
                  setState(() {
                    selectedTripOption = 'Local Trip';
                  });
                },
              ),
            ),
            Expanded(
              child: TripOptionButton(
                icon: Icons.airplanemode_active,
                label: 'Airport Transfer',
                isSelected: selectedTripOption == 'Airport Transfer',
                onPressed: () {
                  setState(() {
                    selectedTripOption = 'Airport Transfer';
                    selectedAirTripType =
                        'To The Airport'; 
                  });
                },
              ),
            ),
          ],
        ),
        if (selectedTripOption == 'Outstation Trip')
          Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(right: 40)),
                  TripTypeButton(
                    label: 'One-way',
                    isSelected: selectedTripType == 'One-way',
                    onPressed: () {
                      setState(() {
                        selectedTripType = 'One-way';
                      });
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(right: 10)),
                  TripTypeButton(
                    label: 'Round Trip',
                    isSelected: selectedTripType == 'Round Trip',
                    onPressed: () {
                      setState(() {
                        selectedTripType = 'Round Trip';
                      });
                    },
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(2)),
              if (selectedTripType == 'One-way')
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutstationTripForm(),
                ),
              if (selectedTripType == 'Round Trip')
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundOutstationTripForm(),
                ),
            ],
          ),
        if (selectedTripOption == 'Local Trip')
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LocalTripForm(),
          ),
        if (selectedTripOption == 'Airport Transfer')
          Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  TripTypeButton(
                    label: 'To The Airport',
                    isSelected: selectedAirTripType == 'To The Airport',
                    onPressed: () {
                      setState(() {
                        selectedAirTripType = 'To The Airport';
                      });
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(right: 10)),
                  TripTypeButton(
                    label: 'From The Airport',
                    isSelected: selectedAirTripType == 'From The Airport',
                    onPressed: () {
                      setState(() {
                        selectedAirTripType = 'From The Airport';
                      });
                    },
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(2)),
              if (selectedAirTripType == 'To The Airport')
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AirportTripForm(),
                ),
              if (selectedAirTripType == 'From The Airport')
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      AirportTripFromForm(), 
                ),
            ],
          )
      ],
    );
  }
}

class TripOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const TripOptionButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? Colors.green : Colors.white,
          side: const BorderSide(
              color: Colors.green, width: 2), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), 
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 10), 
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripTypeButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const TripTypeButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.green,
          backgroundColor: isSelected ? Colors.green : Colors.white,
          side: const BorderSide(
              color: Colors.green, width: 2), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), 
          ),
          padding: const EdgeInsetsDirectional.only(
              start: 50, end: 50) 
          ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14, 
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.green,
        ),
      ),
    );
  }
}
