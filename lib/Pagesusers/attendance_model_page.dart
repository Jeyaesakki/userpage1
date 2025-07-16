// class AttendanceData {
//   final int totalDays;
//   final int presentCount;
//   final int absentCount;
//   final int leaveCount;
//   final int lateCheckIn;
//   final int earlyCheckOut;
//   final int permissionCount;

//   AttendanceData({
//     required this.totalDays,
//     required this.presentCount,
//     required this.absentCount,
//     required this.leaveCount,
//     required this.lateCheckIn,
//     required this.earlyCheckOut,
//     required this.permissionCount, required List<DateTime> absentDates, required List<DateTime> presentDates,
//   });

//   get presentDates => null;

//   get absentDates => null;
// }


class AttendanceData {
  final int totalDays;
  final int presentCount;
  final int absentCount;
  final int leaveCount;
  final int lateCheckIn;
  final int earlyCheckOut;
  final int permissionCount;
  final List<DateTime> presentDates;
  final List<DateTime> absentDates;

  AttendanceData({
    required this.totalDays,
    required this.presentCount,
    required this.absentCount,
    required this.leaveCount,
    required this.lateCheckIn,
    required this.earlyCheckOut,
    required this.permissionCount,
    required this.presentDates,
    required this.absentDates,
  });
}
