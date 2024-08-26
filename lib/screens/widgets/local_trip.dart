import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String hintText;
  final VoidCallback? onTap;

  const CustomFormField({
    required this.icon,
    required this.label,
    required this.hintText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.red, size: 30),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  hintText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.close, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class LocalTripForm extends StatefulWidget {
  @override
  _LocalTripFormState createState() => _LocalTripFormState();
}

class _LocalTripFormState extends State<LocalTripForm> {
  DateTime? _pickUpDate;
  DateTime? _time;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _pickUpDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _pickUpDate) {
      setState(() {
        _pickUpDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _time = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30), 
      decoration: BoxDecoration(
        color: Colors.white,  
        borderRadius: BorderRadius.circular(20), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), 
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CustomFormField(
            icon: Icons.location_on,
            label: 'Pick-up City',
            hintText: 'Type City Name',
          ),
          const SizedBox(height: 10),
          CustomFormField(
            icon: Icons.calendar_today,
            label: 'Pick-up Date',
            hintText: _pickUpDate != null
                ? "${_pickUpDate!.day}-${_pickUpDate!.month}-${_pickUpDate!.year}"
                : 'DD-MM-YYYY',
            onTap: () => _selectDate(context),
          ),
          const SizedBox(height: 10),
          CustomFormField(
            icon: Icons.access_time,
            label: 'Time',
            hintText: _time != null
                ? "${_time!.hour}:${_time!.minute.toString().padLeft(2, '0')}"
                : 'HH:MM',
            onTap: () => _selectTime(context),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            ),
            child: const Text(
              'Explore Cabs',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
