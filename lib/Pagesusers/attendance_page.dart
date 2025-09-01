// 5).....
import 'package:flutter/material.dart';
import 'dart:async';

// Color constants
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // User states
  bool isFaceRegistered = false;
  bool isShiftSelected = false;
  bool isCheckedIn = false;
  bool isTimerRunning = false;
  
  // Dynamic user info
  String userName = "GCAREIC|OPERATIONS";
  String userId = "EMP001";
  
  // Shift selection
  String selectedShift = "Shift";
  bool shiftClicked = false;
  
  // Timer variables
  Timer? _timer;
  int totalSeconds = 0;
  String hours = "00";
  String minutes = "00";
  String seconds = "00";

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
    _checkUserFaceRegistration();
    // Don't start any timer initially - show 00:00:00
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Load user information
  Future<void> _loadUserInfo() async {
    // TODO: Get from backend or SharedPreferences
    setState(() {
      userName = "GCAREIC|OPERATIONS";
      userId = "EMP001";
    });
  }

  // Check if user face is already registered
  Future<void> _checkUserFaceRegistration() async {
    setState(() {
      isFaceRegistered = false;
    });
  }

  // Start work timer after check-in (STARTS FROM 00:00:00)
  void _startWorkTimer() {
    setState(() {
      isTimerRunning = true;
      totalSeconds = 0;
      hours = "00";
      minutes = "00";
      seconds = "00";
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          totalSeconds++;
          hours = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
          minutes = ((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
          seconds = (totalSeconds % 60).toString().padLeft(2, '0');
        });
      }
    });
  }

  // Stop work timer after check-out
  void _stopWorkTimer() {
    _timer?.cancel();
    setState(() {
      isTimerRunning = false;
      isCheckedIn = false;
      // Reset to 00:00:00 after checkout
      totalSeconds = 0;
      hours = "00";
      minutes = "00";
      seconds = "00";
    });
    
    _showSuccessDialog('Check-out successful!\nWork duration: ${hours}h ${minutes}m ${seconds}s');
  }

  // Shift selection
  void _clickShift() {
    setState(() {
      shiftClicked = true;
      isShiftSelected = true;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Shift selected! You can now proceed.'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Get month name
  String _getMonthName(int month) {
    const months = [
      '', 'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
    ];
    return months[month];
  }

  // Face registration
  Future<void> _registerFace() async {
    try {
      bool? proceed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Face Registration'),
          content: Text('This will open your camera to register your face.\n\nNote: Currently in demo mode. Backend integration pending.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Proceed'),
            ),
          ],
        ),
      );
      
      if (proceed != true) return;
      
      _showLoadingDialog('Opening camera...');
      await Future.delayed(Duration(seconds: 2));
      
      Navigator.pop(context);
      _showLoadingDialog('Processing face...');
      await Future.delayed(Duration(seconds: 3));
      
      Navigator.pop(context);
      
      // SUCCESS - Face registered
      setState(() {
        isFaceRegistered = true;
      });
      
      _showSuccessDialog('Face registered successfully!\n\nYou can now use face detection for attendance.');
      
    } catch (e) {
      Navigator.pop(context);
      _showErrorDialog('Face registration failed. Please try again with manual check-in.');
    }
  }

  // Face detection for check-in (ONLY AVAILABLE AFTER FACE REGISTRATION)
  Future<void> _faceDetectionCheckIn() async {
    try {
      bool? proceed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Face Detection'),
          content: Text('This will open your camera for face detection.\n\nNote: Currently in demo mode.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Proceed'),
            ),
          ],
        ),
      );
      
      if (proceed != true) return;
      
      _showLoadingDialog('Opening camera...');
      await Future.delayed(Duration(seconds: 2));
      
      Navigator.pop(context);
      _showLoadingDialog('Detecting face...');
      await Future.delayed(Duration(seconds: 3));
      
      Navigator.pop(context);
      
      bool faceMatched = true; // Demo - will come from backend
      
      if (faceMatched) {
        _performCheckIn('face_detection');
      // ignore: dead_code
      } else {
      }
      
    } catch (e) {
      Navigator.pop(context);
      _showErrorDialog('Face detection failed. Please try manual check-in.');
    }
  }

  // Manual check-in (ALWAYS AVAILABLE AFTER SHIFT SELECTION)
  void _manualCheckIn() {
    _performCheckIn('manual');
  }

  // Perform check-in
  void _performCheckIn(String type) {
    setState(() {
      isCheckedIn = true;
    });
    
    _startWorkTimer(); // Start timer from 00:00:00
    _showSuccessDialog('Check-in successful! Timer started.');
  }

  // Check-out
  void _checkOut() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Check Out'),
        content: Text('Are you sure you want to check out?\nWork duration: ${hours}h ${minutes}m ${seconds}s'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _stopWorkTimer();
            },
            child: Text('Check Out'),
          ),
        ],
      ),
    );
  }

  // Dialog helpers
  void _showLoadingDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 15),
            Text(message),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Attendance',
          style: TextStyle(
            color: kTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kPrimaryBackgroundTop,
              kPrimaryBackgroundBottom,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Header Section - Dynamic
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NAME',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'ID: $userId',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 6),
                          Text(
                            '${DateTime.now().day.toString().padLeft(2, '0')} ${_getMonthName(DateTime.now().month)} ${DateTime.now().year}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 20), // Reduced
                
                // Clock Icon
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: kButtonColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kButtonColor.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    isTimerRunning ? Icons.timer : Icons.access_time,
                    size: 32,
                    color: kButtonColor,
                  ),
                ),
                
                SizedBox(height: 15), // Reduced
                
                // Time Display - SHOWS 00:00:00 BEFORE CHECK-IN
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTimeBox(hours),
                    SizedBox(width: 6),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 20,
                        color: kButtonColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6),
                    _buildTimeBox(minutes),
                    SizedBox(width: 6),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 20,
                        color: kButtonColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6),
                    _buildTimeBox(seconds),
                    SizedBox(width: 12),
                    Text(
                      isTimerRunning ? 'Work' : 'Hrs',
                      style: TextStyle(
                        fontSize: 14,
                        color: kButtonColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 20), // Reduced
                
                // Shift Selector
                GestureDetector(
                  onTap: shiftClicked ? null : _clickShift,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: shiftClicked ? kButtonColor : kButtonColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      selectedShift,
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 15), // Reduced spacing between shift and buttons
                
                // CORRECTED BUTTON FLOW
                if (!isShiftSelected) ...[
                  // Step 1: Select shift first
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Please select your shift first',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ] else if (!isCheckedIn) ...[
                  // Step 2: After shift selection - Show face register + manual check-in
                  if (!isFaceRegistered) ...[
                    // Show Face Register + Manual Check-in (NO FACE DETECTION YET)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Face Registration Button
                        SizedBox(
                          width: 110, // Further reduced
                          height: 35, // Further reduced
                          child: ElevatedButton(
                            onPressed: _registerFace,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.face,
                                  color: kTextColor,
                                  size: 14, // Further reduced
                                ),
                                Text(
                                  'Register',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 9, // Further reduced
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        // Manual Check-in Button (ALWAYS AVAILABLE)
                        SizedBox(
                          width: 110, // Further reduced
                          height: 35, // Further reduced
                          child: ElevatedButton(
                            onPressed: _manualCheckIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.touch_app,
                                  color: kTextColor,
                                  size: 14, // Further reduced
                                ),
                                Text(
                                  'Check in',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 9, // Further reduced
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    // Step 3: After face registration - Show face detection + manual check-in
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Face Detection Button (ONLY AFTER REGISTRATION)
                        SizedBox(
                          width: 110, // Further reduced
                          height: 35, // Further reduced
                          child: ElevatedButton(
                            onPressed: _faceDetectionCheckIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.face_retouching_natural,
                                  color: kTextColor,
                                  size: 14, // Further reduced
                                ),
                                Text(
                                  'Face detect',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 9, // Further reduced
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        // Manual Check-in Button (BACKUP OPTION)
                        SizedBox(
                          width: 110, // Further reduced
                          height: 35, // Further reduced
                          child: ElevatedButton(
                            onPressed: _manualCheckIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.touch_app,
                                  color: kTextColor,
                                  size: 14, // Further reduced
                                ),
                                Text(
                                  'Check in',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 9, // Further reduced
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ] else ...[
                  // Step 4: After check-in - Show check-out button
                  SizedBox(
                    width: 130,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _checkOut,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF6B6B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: kTextColor,
                            size: 13,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Check Out',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build time boxes
  Widget _buildTimeBox(String time) {
    return Container(
      width: 42,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: isTimerRunning 
            ? Border.all(color: Colors.green, width: 2)
            : Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          time,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isTimerRunning ? Colors.green : kButtonColor,
          ),
        ),
      ),
    );
  }
}