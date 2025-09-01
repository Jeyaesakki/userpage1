// // leave_data.dart
// final List<Map<String, dynamic>> allLeaveRequests = [
//   {
//     'type': 'Leave Type',
//     'id': 'EMP003',
//     'name': 'Mohit',
//     'days': 3,
//     'from': '21-07-2025',
//     'to': '23-07-2025',
//     'reason': 'Travel',
//     'status': 'pending'
//   },
//     {
//     'type': 'Leave Type',
//     'id': 'EMP004',
//     'name': 'ANU',
//     'days': 2,
//     'from': '22-07-2025',
//     'to': '24-07-2025',
//     'reason': 'Fever',
//     'status': 'pending'
//   },

//   {
//     'type': 'Permission',
//     'id': 'EMP003',
//     'name': 'Deepi',
//     'shift': 2,
//     'time': '2:00',
//     'date': '22-07-2025',
//     'reason': 'Fever',
//     'status': 'pending'
//   },
//     {
//     'type': 'Permission',
//     'id': 'EMP001',
//     'name': 'Priya',
//     'shift': 1,
//     'time': '3:00',
//     'date': '23-07-2025',
//     'reason': 'Travel',
//     'status': 'pending'
//   },
//   {
//     'type': 'Over Time',
//     'id': 'EMP004',
//     'name': 'Madhu',
//     'shift': 1,
//     'time': '2:00',
//     'date': '25-07-2025',
//     'status': 'pending'
//   },
//     {
//     'type': 'Over Time',
//     'id': 'EMP005',
//     'name': 'Malar',
//     'shift': 3,
//     'time': '1:00',
//     'date': '21-07-2025',
//     'status': 'pending'
//   },
//   {
//     'type': 'Half Day Leave',
//     'id': 'EMP004',
//     'name': 'Madhu',
//     'leaveDate': '22-07-2025',
//     'section': 'Morning',
//     'reason': 'Travel',
//     'status': 'pending'
//   },
//     {
//     'type': 'Half Day Leave',
//     'id': 'EMP008',
//     'name': 'keerthi',
//     'leaveDate': '29-07-2025',
//     'section': 'Evening',
//     'reason': 'personal work',
//     'status': 'pending'
//   },
//   {
//     'type': 'Comp Off',
//     'id': 'EMP004',
//     'name': 'Madhu',
//     'shift': 1,
//     'fromDate': '21-07-2025',
//     'replaceDate': '25-07-2025',
//     'reason': 'Fever',
//     'status': 'pending'
//   },
//     {
//     'type': 'Comp Off',
//     'id': 'EMP006',
//     'name': 'Moni',
//     'shift': 3,
//     'fromDate': '24-07-2025',
//     'replaceDate': '27-07-2025',
//     'reason': 'Travel',
//     'status': 'pending'
//   },
// ];



final List<Map<String, dynamic>> allLeaveRequests = [
  {
    'Type': 'Late check in',
    'Id': 'EMP007',
    'Name': 'Sundar',
    'Department': 'IT',
    'RequestType': 'Late check in',
    'Reason': 'Other Location',
    'Shift': 1,
    'ShiftGroup': 'A',
    'RequestTime': '10:30 AM',
    'RequestDate': '28-07-2025',
    'Status': 'pending',
    'Location': {
      "lat": 13.0827,
      "lng": 80.2707
    }
  },
  {
    'Type': 'Late check in',
    'Id': 'EMP008',
    'Name': 'Suji',
    'Department': 'HR',
    'RequestType': 'Late check in',
    'Reason': 'Other Location',
    'Shift': 2,
    'ShiftGroup': 'B',
    'RequestTime': '11:30 AM',
    'RequestDate': '22-07-2025',
    'Status': 'pending'
  },
  {
    'Type': 'Late check out',
    'Id': 'EMP009',
    'Name': 'Lakshmi',
    'Department': 'HR',
    'RequestType': 'Late check out',
    'Shift': 2,
    'ShiftGroup': 'B',
    'RequestTime': '07:30 PM',
    'RequestDate': '28-07-2025',
    'Status': 'pending'
  },
  {
    'Type': 'Late check out',
    'Id': 'EMP003',
    'Name': 'Loya',
    'Department': 'HR',
    'RequestType': 'Late check out',
    'Shift': 1,
    'ShiftGroup': 'A',
    'RequestTime': '08:30 PM',
    'RequestDate': '2-207-2025',
    'Status': 'pending'
  },
  {
    'Type': 'Leave Type',
    'Id': 'EMP003',
    'Name': 'Mohit',
    'Days': 3,
    'From': '21-07-2025',
    'To': '23-07-2025',
    'Reason': 'Travel',
    'Status': 'pending'
  },
  {
    'Type': 'Leave Type',
    'Id': 'EMP004',
    'Name': 'ANU',
    'Days': 2,
    'From': '22-07-2025',
    'To': '24-07-2025',
    'Reason': 'Fever',
    'Status': 'pending'
  },
  {
    'Type': 'Permission',
    'Id': 'EMP003',
    'Name': 'Deepi',
    'Shift': 2,
    'Time': '2:00',
    'Date': '22-07-2025',
    'Reason': 'Fever',
    'Status': 'pending'
  },
  {
    'Type': 'Permission',
    'Id': 'EMP001',
    'Name': 'Priya',
    'Shift': 1,
    'Time': '3:00',
    'Date': '23-07-2025',
    'Reason': 'Travel',
    'Status': 'pending'
  },
  {
    'Type': 'Over Time',
    'Id': 'EMP004',
    'Name': 'Madhu',
    'Shift': 1,
    'Time': '2:00',
    'Date': '25-07-2025',
    'Status': 'pending'
  },
  {
    'Type': 'Over Time',
    'Id': 'EMP005',
    'Name': 'Malar',
    'Shift': 3,
    'Time': '1:00',
    'Date': '21-07-2025',
    'Status': 'pending'
  },
  {
    'Rype': 'Half Day Leave',
    'Id': 'EMP004',
    'Name': 'Madhu',
    'LeaveDate': '22-07-2025',
    'Section': 'Morning',
    'Reason': 'Travel',
    'Status': 'pending'
  },
  {
    'Type': 'Half Day Leave',
    'Id': 'EMP008',
    'Name': 'keerthi',
    'LeaveDate': '29-07-2025',
    'Section': 'Evening',
    'Reason': 'personal work',
    'Status': 'pending'
  },
  {
    'Type': 'Comp Off',
    'Id': 'EMP004',
    'Name': 'Madhu',
    'Shift': 1,
    'FromDate': '21-07-2025',
    'ReplaceDate': '25-07-2025',
    'Reason': 'Fever',
    'Status': 'pending'
  },
  {
    'Type': 'Comp Off',
    'Id': 'EMP006',
    'Name': 'Moni',
    'Shift': 3,
    'FromDate': '24-07-2025',
    'ReplaceDate': '27-07-2025',
    'Reason': 'Travel',
    'Status': 'pending'
  },
];