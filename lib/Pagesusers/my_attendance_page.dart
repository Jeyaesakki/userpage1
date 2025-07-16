
import 'package:flutter/material.dart';
import 'package:serv_app/Pagesusers/attendance_model_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


// Theme Colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;




class MyAttendancePage extends StatefulWidget {
  final AttendanceData data;

  const MyAttendancePage({super.key, required this.data});

  @override
  State<MyAttendancePage> createState() => _MyAttendancePageState();
}

class _MyAttendancePageState extends State<MyAttendancePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    DateTime today = DateTime.now();

    int totalDays = data.presentCount + data.absentCount + data.leaveCount;
    int totalDaysInMonth = DateUtils.getDaysInMonth(
      _focusedDay.year,
      _focusedDay.month,
    );

    int remainingDays = totalDaysInMonth - today.day;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Attendance'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: kAppBarColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TotalDaysCard(totalDays: totalDays, remainingDays: remainingDays),
              const SizedBox(height: 20),
              SizedBox(height: 370, child: _buildCalendar()),
              const SizedBox(height: 20),
              const Text(
                "Legend",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildLegendFromData([
                  {
                    'icon': Icons.circle,
                    'color': Colors.green,
                    'label': "Present",
                  },
                  {
                    'icon': Icons.circle,
                    'color': Colors.red,
                    'label': "Absent",
                  },
                  {
                    'icon': Icons.airline_seat_individual_suite,
                    'color': Colors.orange,
                    'label': "Leave",
                  },
                  {
                    'icon': Icons.beach_access,
                    'color': Colors.blue,
                    'label': "Holiday",
                  },
                  {
                    'icon': Icons.nightlight_round,
                    'color': Colors.purple,
                    'label': "Week Off",
                  },
                  {
                    'icon': Icons.pedal_bike,
                    'color': Colors.pink,
                    'label': "Half Day",
                  },
                ]),
              ),
              const SizedBox(height: 20),
              _buildStatusSummary(data),
              const SizedBox(height: 20),
              _buildBottomStats(data),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    final presentDates = widget.data.presentDates;
    final absentDates = widget.data.absentDates;

    return Container(
      decoration: BoxDecoration(
        color: kPrimaryBackgroundTop,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        calendarStyle: const CalendarStyle(
          weekendTextStyle: TextStyle(color: Colors.red),
          outsideDaysVisible: false,
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            if (presentDates.any((d) => isSameDay(d, day))) {
              return _coloredCircle(day.day, const Color.fromARGB(255, 173, 235, 148));
            } else if (absentDates.any((d) => isSameDay(d, day))) {
              return _coloredCircle(day.day, const Color.fromARGB(255, 236, 148, 142));
            }
            return null;
          },
          todayBuilder: (context, day, focusedDay) {
            return _coloredCircle(day.day, kButtonColor);
          },
          selectedBuilder: (context, day, focusedDay) {
            return _coloredCircle(day.day, kAppBarColor);
          },
        ),
      ),
    );
  }

  Widget _coloredCircle(int day, Color color) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        '$day',
        style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatusSummary(AttendanceData data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StatusCard("Present", data.presentCount.toString(), const Color.fromARGB(255, 157, 238, 125)),
        StatusCard("Absent", data.absentCount.toString(), const Color.fromARGB(255, 236, 162, 157)),
        StatusCard("Leave", data.leaveCount.toString(), Colors.orange),
      ],
    );
  }

  Widget _buildBottomStats(AttendanceData data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BottomStatBox("Late Check-in", data.lateCheckIn.toString()),
          const SizedBox(width: 12),
          BottomStatBox("Early Check-out", data.earlyCheckOut.toString()),
          const SizedBox(width: 12),
          BottomStatBox("Permission Count", data.permissionCount.toString()),
        ],
      ),
    );
  }

  Widget _buildLegendFromData(List<Map<String, dynamic>> legends) {
    return Wrap(
      spacing: 12,
      runSpacing: 10,
      children: legends.map((item) {
        return LegendItem(
          icon: item['icon'],
          color: item['color'],
          label: item['label'],
        );
      }).toList(),
    );
  }
}

class TotalDaysCard extends StatelessWidget {
  final int totalDays;
  final int remainingDays;

  const TotalDaysCard({
    super.key,
    required this.totalDays,
    required this.remainingDays,
  });

  @override
  Widget build(BuildContext context) {
    String todayFormatted = DateFormat('d MMMM yyyy').format(DateTime.now());

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: kPrimaryBackgroundBottom,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Icon(Icons.calendar_month, size: 40, color: kAppBarColor),
          const SizedBox(height: 10),
          Text(
            "Today: $todayFormatted",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Remaining: $remainingDays Days",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const StatusCard(this.label, this.value, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class BottomStatBox extends StatelessWidget {
  final String title;
  final String count;

  const BottomStatBox(this.title, this.count, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: kPrimaryBackgroundBottom,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kAppBarColor.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 9),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const LegendItem({
    required this.icon,
    required this.color,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}




// class MyAttendancePage extends StatefulWidget {
//   final AttendanceData data;

//   const MyAttendancePage({super.key, required this.data});

//   @override
//   State<MyAttendancePage> createState() => _MyAttendancePageState();
// }

// class _MyAttendancePageState extends State<MyAttendancePage> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   @override
//   Widget build(BuildContext context) {
//     final data = widget.data;
//     final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Attendance'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         backgroundColor: kAppBarColor,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _buildTopSummary(data, isLandscape),
//               const SizedBox(height: 20),
//               SizedBox(height: 370, child: _buildCalendar()),
//               const SizedBox(height: 20),
//               const Text("Legend", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               SingleChildScrollView(scrollDirection: Axis.horizontal, child: _buildLegend()),
//               const SizedBox(height: 20),
//               _buildBottomStats(data),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTopSummary(AttendanceData data, bool isLandscape) {
//     int totalDays = data.presentCount + data.absentCount + data.leaveCount;
//     DateTime now = DateTime.now();
//     int totalDaysInMonth = DateUtils.getDaysInMonth(now.year, now.month);
//     int remainingDays = totalDaysInMonth - totalDays;

//     return Container(
//       decoration: BoxDecoration(
//         color: kPrimaryBackgroundBottom,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//       child: Column(
//         children: [
//           const Icon(Icons.calendar_month, size: 40, color: kAppBarColor),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text("Total Days: ", style: TextStyle(fontSize: 20)),
//               Text(
//                 "$totalDays",
//                 style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           const SizedBox(height: 6),
//           Text("Remaining: $remainingDays Days", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _statusCard("Present", data.presentCount.toString(), Colors.green),
//               _statusCard("Absent", data.absentCount.toString(), Colors.red),
//               _statusCard("Leave", data.leaveCount.toString(), Colors.orange),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCalendar() {
//     final presentDates = widget.data.presentDates;
//     final absentDates = widget.data.absentDates;

//     return Container(
//       decoration: BoxDecoration(
//         color: kPrimaryBackgroundTop,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: TableCalendar(
//         focusedDay: _focusedDay,
//         firstDay: DateTime.utc(2023, 1, 1),
//         lastDay: DateTime.utc(2030, 12, 31),
//         selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//         onDaySelected: (selectedDay, focusedDay) {
//           setState(() {
//             _selectedDay = selectedDay;
//             _focusedDay = focusedDay;
//           });
//         },
//         calendarStyle: const CalendarStyle(
//           weekendTextStyle: TextStyle(color: Colors.red),
//           outsideDaysVisible: false,
//         ),
//         headerStyle: const HeaderStyle(
//           formatButtonVisible: false,
//           titleCentered: true,
//         ),
//         calendarBuilders: CalendarBuilders(
//           defaultBuilder: (context, day, focusedDay) {
//             if (presentDates.any((d) => isSameDay(d, day))) {
//               return _coloredCircle(day.day, const Color.fromARGB(255, 192, 238, 194));
//             } else if (absentDates.any((d) => isSameDay(d, day))) {
//               return _coloredCircle(day.day, const Color.fromARGB(255, 241, 147, 141));
//             }
//             return null;
//           },
//           todayBuilder: (context, day, focusedDay) {
//             return _coloredCircle(day.day, kButtonColor);
//           },
//           selectedBuilder: (context, day, focusedDay) {
//             return _coloredCircle(day.day, kAppBarColor);
//           },
//         ),
//       ),
//     );
//   }

//   Widget _coloredCircle(int day, Color color) {
//     return Container(
//       margin: const EdgeInsets.all(6),
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//       alignment: Alignment.center,
//       child: Text(
//         '$day',
//         style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   static Widget _statusCard(String label, String value, Color color) {
//     return Container(
//       width: 90,
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         children: [
//           Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
//           const SizedBox(height: 5),
//           Text(label, style: const TextStyle(fontSize: 14)),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomStats(AttendanceData data) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           _bottomStatBox("Late Check-in", data.lateCheckIn.toString()),
//           const SizedBox(width: 12),
//           _bottomStatBox("Early Check-out", data.earlyCheckOut.toString()),
//           const SizedBox(width: 12),
//           _bottomStatBox("Permission Count", data.permissionCount.toString()),
//         ],
//       ),
//     );
//   }

//   static Widget _bottomStatBox(String title, String count) {
//     return Container(
//       width: 110,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//       margin: const EdgeInsets.symmetric(horizontal: 2),
//       decoration: BoxDecoration(
//         color: kPrimaryBackgroundBottom,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: kAppBarColor.withOpacity(0.3)),
//       ),
//       child: Column(
//         children: [
//           Text(count, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 4),
//           Text(title, style: const TextStyle(fontSize: 9), textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }

//   static Widget _buildLegend() {
//     return Wrap(
//       spacing: 12,
//       runSpacing: 10,
//       children: const [
//         _LegendItem(icon: Icons.circle, color: Colors.green, label: "Present"),
//         _LegendItem(icon: Icons.circle, color: Colors.red, label: "Absent"),
//         _LegendItem(icon: Icons.airline_seat_individual_suite, color: Colors.orange, label: "Leave"),
//         _LegendItem(icon: Icons.beach_access, color: Colors.blue, label: "Holiday"),
//         _LegendItem(icon: Icons.nightlight_round, color: Colors.purple, label: "Week Off"),
//         _LegendItem(icon: Icons.pedal_bike, color: Colors.pink, label: "Half Day"),
//       ],
//     );
//   }
// }

// class _LegendItem extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   final String label;

//   const _LegendItem({
//     required this.icon,
//     required this.color,
//     required this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(icon, color: color, size: 18),
//         const SizedBox(width: 6),
//         Text(label, style: const TextStyle(fontSize: 13)),
//       ],
//     );
//   }
// }
