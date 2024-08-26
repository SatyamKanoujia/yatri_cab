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

class CustomDateFormField extends StatelessWidget {
  final String label;
  final String date;

  const CustomDateFormField({
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
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
            date,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundOutstationTripForm extends StatefulWidget {
  @override
  _RoundOutstationTripFormState createState() =>
      _RoundOutstationTripFormState();
}

class _RoundOutstationTripFormState extends State<RoundOutstationTripForm> {
  DateTime? fromDate;
  DateTime? toDate;
  DateTime? _time;

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
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
          const CustomFormField(
            icon: Icons.flag,
            label: 'Drop City',
            hintText: 'Type City Name',
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
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context, true),
                  child: CustomDateFormField(
                    label: 'From Date',
                    date: fromDate != null
                        ? "${fromDate!.day}-${fromDate!.month}-${fromDate!.year}"
                        : 'DD-MM-YYYY',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.date_range_outlined,color: Colors.red,),
              ), 
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context, false),
                  child: CustomDateFormField(
                    label: 'To Date',
                    date: toDate != null
                        ? "${toDate!.day}-${toDate!.month}-${toDate!.year}"
                        : 'DD-MM-YYYY',
                  ),
                ),
              ),
            ],
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
