
import 'package:flutter/material.dart';

enum Status {
pending,
completed,
inprogress,
}

class StatusDropDown extends StatefulWidget {
final Status? selectedStatus;
final Function(Status?) onChanged;

const StatusDropDown({
super.key,
required this.selectedStatus,
required this.onChanged,
});

@override
State<StatusDropDown> createState() => _StatusDropDownState();
}

class _StatusDropDownState extends State<StatusDropDown> {
@override
Widget build(BuildContext context) {
return DropdownButtonFormField<Status>(
value: widget.selectedStatus,

decoration: InputDecoration(
filled: true,
fillColor: Colors.white,

border: OutlineInputBorder(
borderRadius: BorderRadius.circular(14),
borderSide: BorderSide.none,
),

enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(14),
borderSide: BorderSide.none,
),
),

items: const [
DropdownMenuItem(
value: Status.pending,
child: Text("Pending"),
),

DropdownMenuItem(
value: Status.completed,
child: Text("Completed"),
),

DropdownMenuItem(
value: Status.inprogress,
child: Text("In Progress"),
),
],

onChanged: widget.onChanged,
);
}
}

