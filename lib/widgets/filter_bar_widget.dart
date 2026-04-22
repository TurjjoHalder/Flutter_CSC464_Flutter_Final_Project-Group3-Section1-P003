import 'package:flutter/material.dart';

class FilterBarWidget extends StatefulWidget {
  final String selectedStatus;
  final List<String> statusFilters;
  final Function(String) onStatusSelected;
  const FilterBarWidget({super.key, required this.selectedStatus, required this.statusFilters, required this.onStatusSelected});

  @override
  State<FilterBarWidget> createState() => _FilterBarWidgetState();
}

class _FilterBarWidgetState extends State<FilterBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.statusFilters.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                final status = widget.statusFilters[index];
                final isSelected = widget.selectedStatus == status;

                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(
                      status.toUpperCase(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: Colors.green,
                    backgroundColor: Colors.grey[200],
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          widget.onStatusSelected(status);
                        });
                      }
                    },
                  ),
                );
              },
            ),
          
    );
  }
}