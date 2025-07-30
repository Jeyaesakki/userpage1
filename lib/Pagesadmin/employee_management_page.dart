
// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'report_scheduler_page.dart';

// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF655193);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class Employee {
//   final String name, id, email, mobile, location, dept, designation, status, shiftGroup;
//   final String? docId;

//   Employee({
//     required this.name,
//     required this.id,
//     required this.email,
//     required this.mobile,
//     required this.location,
//     required this.dept,
//     required this.designation,
//     required this.status,
//     required this.shiftGroup,
//     this.docId,
//   });
// }

// class EmployeeListScreen extends StatefulWidget {
//   const EmployeeListScreen({super.key});
//   @override
//   State<EmployeeListScreen> createState() => _EmployeeListScreenState();
// }

// class _EmployeeListScreenState extends State<EmployeeListScreen> {
//   List<Employee> employees = [];
//   List<Employee> filtered = [];
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     filtered = employees;
//   }

//   void updateFiltered(String query) {
//     setState(() {
//       filtered = employees.where((e) {
//         final q = query.toLowerCase();
//         return e.name.toLowerCase().contains(q) || e.id.toLowerCase().contains(q);
//       }).toList();
//     });
//   }

//   int countStatus(String status) => employees.where((e) => e.status == status).length;

//   Widget statButton(String label, int count, Color color) {
//     return SizedBox(
//       width: 85,
//       height: 30,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           foregroundColor: kTextColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           padding: EdgeInsets.zero,
//         ),
//         onPressed: () {},
//         child: Text('$label $count', textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
//       ),
//     );
//   }

//   @override
//   Widget _cell(String text, {required int flex}) {
//   return Expanded(
//     flex: flex,
//     child: Text(
//       text,
//       overflow: TextOverflow.ellipsis,
//       maxLines: 1,
//       style: const TextStyle(fontSize: 13),
//     ),
//   );
// }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         toolbarHeight: 50,
//         backgroundColor: kAppBarColor,
//         foregroundColor: Colors.white,
//         leading: IconButton(icon: const Icon(Icons.arrow_back, size: 18), onPressed: () {}),
//         titleSpacing: 0,
//         title: const Text("Employee Management", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//           ),
//         ),
//         child: Column(
//           children: [
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               alignment: WrapAlignment.center,
//               children: [
//                 statButton('Total', employees.length, kButtonColor),
//                 statButton('Active', countStatus('Active'), kButtonColor),
//                 statButton('Inactive', countStatus('Inactive'), kButtonColor),
//                 statButton('Suspended', countStatus('Suspended'), kButtonColor),
//                 statButton('Relived', countStatus('Relived'), kButtonColor),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Column(
//               children: [
//                 ElevatedButton(
//                   onPressed: () async {
//                     final result = await Navigator.push<Employee>(
//                       context,
//                       MaterialPageRoute(builder: (_) => const CreateEmployeeScreen()),
//                     );
//                     if (result != null) {
//                       setState(() {
//                         employees.add(result);
//                         updateFiltered(searchController.text);
//                       });
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: kButtonColor,
//                     foregroundColor: kTextColor,
//                     minimumSize: const Size(120, 36),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                   ),
//                   child: const Text("Create Employee", style: TextStyle(fontSize: 12)),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (_) => ReportSchedulerPage()));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: kButtonColor,
//                     foregroundColor: kTextColor,
//                     minimumSize: const Size(120, 36),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                   ),
//                   child: const Text("Create Scheduler", style: TextStyle(fontSize: 12)),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: TextField(
//                 controller: searchController,
//                 onChanged: updateFiltered,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.search),
//                   hintText: 'Search',
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: SizedBox(
//                   width: 1300,
//                   child: Column(
//                     children: [
//                       Container(
//   color: Colors.grey[300],
//   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//   child: Row(
//     children: const [
//       Expanded(flex: 4, child: Text("ID", style: TextStyle(fontWeight: FontWeight.bold))),
//       Expanded(flex: 6, child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
//       Expanded(flex: 8, child: Text("Email", style: TextStyle(fontWeight: FontWeight.bold))),
//       Expanded(flex: 7, child: Text("Mobile", style: TextStyle(fontWeight: FontWeight.bold))),
//       Expanded(flex: 6, child: Text("Shift Group", style: TextStyle(fontWeight: FontWeight.bold))),
//       Expanded(flex: 6, child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold))),
//       Expanded(flex: 6, child: Text("Department", style: TextStyle(fontWeight: FontWeight.bold))),
//       Expanded(flex: 6, child: Text("Designation", style: TextStyle(fontWeight: FontWeight.bold))),
//       Expanded(flex: 4, child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
//       Expanded(flex: 5, child: Center(child: Text("Delete", style: TextStyle(fontWeight: FontWeight.bold)))),
//       Expanded(flex: 5, child: Center(child: Text("Edit", style: TextStyle(fontWeight: FontWeight.bold)))),
//     ],
//   ),
// ),

//                       Expanded(
//   child: ListView.builder(
//     itemCount: filtered.length,
//     itemBuilder: (context, i) {
//       final e = filtered[i];
//       return Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             _cell(e.id, flex: 4),
//             _cell(e.name, flex: 6),
//             _cell(e.email, flex: 8),
//             _cell(e.mobile, flex: 7),
//             _cell(e.shiftGroup, flex: 6),
//             _cell(e.location, flex: 6),
//             _cell(e.dept, flex: 6),
//             _cell(e.designation, flex: 6),
//             _cell(e.status, flex: 4),
//             Expanded(
//               flex: 5,
//               child: Center(
//                 child: IconButton(
//                   icon: const Icon(Icons.delete, color: Colors.red),
//                   onPressed: () {
//                     setState(() {
//                       employees.removeWhere((emp) => emp.id == e.id);
//                       updateFiltered(searchController.text);
//                     });
//                   },
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: Center(
//                 child: IconButton(
//                   icon: const Icon(Icons.edit, color: Colors.blue),
//                   onPressed: () async {
//                     final edited = await Navigator.push<Employee>(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => CreateEmployeeScreen(editEmployee: e),
//                       ),
//                     );
//                     if (edited != null) {
//                       setState(() {
//                         final idx = employees.indexWhere((emp) => emp.id == e.id);
//                         if (idx != -1) {
//                           employees[idx] = edited;
//                           updateFiltered(searchController.text);
//                         }
//                       });
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   ),
// )



//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CreateEmployeeScreen extends StatefulWidget {
//   final Employee? editEmployee;
//   const CreateEmployeeScreen({super.key, this.editEmployee});

//   @override
//   State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
// }

// class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final name = TextEditingController();
//   final id = TextEditingController();
//   final email = TextEditingController();
//   final mobile = TextEditingController();
//   final shiftgroup = TextEditingController();
//   final password = TextEditingController();
//   final location = TextEditingController();
//   final dept = TextEditingController();
//   final desig = TextEditingController();

//   bool _obscurePassword = true;
//   String status = 'Active';
//   String dialCode = '+91';

//     // 🟢 NEW: Shift options list
//   final List<String> shiftOptions = [ // 🟢
//     'GCC Shift 1', // 🟢
//     'General Shift 2', // 🟢
//     'Open Shift ', // 🟢
//     'Shift', // 🟢
//     'General shift2', // 🟢
//   ]; // 🟢


//   @override
//   void initState() {
//     super.initState();
//     final emp = widget.editEmployee;
//     if (emp != null) {
//       name.text = emp.name;
//       id.text = emp.id;
//       email.text = emp.email;
//       mobile.text = emp.mobile.replaceFirst(RegExp(r'^\\+?\\d+\\s'), '');
//       shiftgroup.text = emp.shiftGroup;
//       location.text = emp.location;
//       dept.text = emp.dept;
//       desig.text = emp.designation;
//       status = emp.status;
//     }
//   }

//   Widget formField(String label, TextEditingController ctrl, {TextInputType type = TextInputType.text}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: TextFormField(
//         controller: ctrl,
//         keyboardType: type,
//         validator: (v) {
//           if (v == null || v.trim().isEmpty) return 'Required';
//           if (label == "Email") {
//             final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
//             if (!emailRegex.hasMatch(v.trim())) return 'Enter valid email';
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//           label: RichText(
//             text: TextSpan(
//               text: label,
//               style: const TextStyle(color: Colors.black),
//               children: const [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
//             ),
//           ),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         ),
//       ),
//     );
//   }

//   Widget passwordField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: TextFormField(
//         controller: password,
//         obscureText: _obscurePassword,
//         validator: (v) {
//           if (v == null || v.trim().isEmpty) return 'Required';
//           if (v.trim().length < 6) return 'Password too short';
//           return null;
//         },
//         decoration: InputDecoration(
//           label: RichText(
//             text: const TextSpan(
//               text: "Password",
//               style: TextStyle(color: Colors.black),
//               children: [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
//             ),
//           ),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           suffixIcon: IconButton(
//             icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
//             onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
//           ),
//         ),
//       ),
//     );
//   }
//   // 🟢 NEW: Dropdown widget for Shift Group
//   Widget shiftDropdownField() { // 🟢
//     return Padding( // 🟢
//       padding: const EdgeInsets.symmetric(vertical: 6), // 🟢
//       child: DropdownButtonFormField<String>( // 🟢
//         value: shiftgroup.text.isNotEmpty ? shiftgroup.text : null, // 🟢
//         items: shiftOptions.map((value) { // 🟢
//           return DropdownMenuItem<String>( // 🟢
//             value: value, // 🟢
//             child: Text(value), // 🟢
//           ); // 🟢
//         }).toList(), // 🟢
//         onChanged: (value) { // 🟢
//           setState(() { // 🟢
//             shiftgroup.text = value!; // 🟢
//           }); // 🟢
//         }, // 🟢
//         validator: (value) => value == null || value.isEmpty ? 'Required' : null, // 🟢
//         decoration: InputDecoration( // 🟢
//           label: RichText( // 🟢
//             text: const TextSpan( // 🟢
//               text: 'Shift Group', // 🟢
//               style: TextStyle(color: Colors.black), // 🟢
//               children: [TextSpan(text: ' *', style: TextStyle(color: Colors.red))], // 🟢
//             ), // 🟢
//           ), // 🟢
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // 🟢
//         ), // 🟢
//       ), // 🟢
//     ); // 🟢
//   } // 🟢

//   void submit() {
//     if (_formKey.currentState?.validate() ?? false) {
//       final newEmp = Employee(
//         name: name.text,
//         id: id.text,
//         email: email.text,
//         mobile: '$dialCode ${mobile.text}',
//         shiftGroup: shiftgroup.text,
//         location: location.text,
//         dept: dept.text,
//         designation: desig.text,
//         status: status,
//       );
//       Navigator.pop(context, newEmp);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Create Employee", style: TextStyle(fontSize: 16)),
//         backgroundColor: kAppBarColor,
//         foregroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               formField("Employee Name", name),
//               formField("Employee ID", id),
//               formField("Email", email, type: TextInputType.emailAddress),
//               IntlPhoneField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                   label: RichText(
//                     text: const TextSpan(
//                       text: 'Mobile',
//                       style: TextStyle(color: Colors.black, fontSize: 16),
//                       children: [TextSpan(text: ' *', style: TextStyle(color: Colors.red, fontSize: 16))],
//                     ),
//                   ),
//                 ),
//                 initialCountryCode: 'IN',
//                 onChanged: (phone) {
//                   dialCode = phone.countryCode;
//                   mobile.text = phone.number;
//                 },
//               ),
//               // 🔴 OLD LINE TO REMOVE: formField("Shift Group", shiftgroup),
//                   // ✅ 🟢 NEW REPLACEMENT:
//               shiftDropdownField(), // 🟢
              
//               passwordField(),
//               formField("Location", location),
//               formField("Department", dept),
//               formField("Designation", desig),
//               Row(
//                 children: [
//                   const Text("Status: "),
//                   Radio<String>(
//                     value: 'Active',
//                     groupValue: status,
//                     onChanged: (val) => setState(() => status = val!),
//                   ),
//                   const Text("Active"),
//                   Radio<String>(
//                     value: 'Inactive',
//                     groupValue: status,
//                     onChanged: (val) => setState(() => status = val!),
//                   ),
//                   const Text("Inactive"),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
//                     child: const Text("Cancel"),
//                   ),
//                   ElevatedButton(
//                     onPressed: submit,
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                     child: Text(widget.editEmployee == null ? "Create" : "Update"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'report_scheduler_page.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF655193);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class Employee {
  final String name, id, email, mobile, location, dept, designation, status, shiftGroup;
  final String? docId;

  Employee({
    required this.name,
    required this.id,
    required this.email,
    required this.mobile,
    required this.location,
    required this.dept,
    required this.designation,
    required this.status,
    required this.shiftGroup,
    this.docId,
  });
}

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});
  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Employee> employees = [];
  List<Employee> filtered = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filtered = employees;
  }

  void updateFiltered(String query) {
    setState(() {
      filtered = employees.where((e) {
        final q = query.toLowerCase();
        return e.name.toLowerCase().contains(q) || e.id.toLowerCase().contains(q);
      }).toList();
    });
  }

  int countStatus(String status) => employees.where((e) => e.status == status).length;

  Widget statButton(String label, int count, Color color) {
    return SizedBox(
      width: 85,
      height: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: kTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: () {},
        child: Text('$label $count', textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
      ),
    );
  }

  @override
  Widget _cell(String text, {required int flex}) {
  return Expanded(
    flex: flex,
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(fontSize: 13),
    ),
  );
}

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: kAppBarColor,
        foregroundColor: Colors.white,
        leading: IconButton(icon: const Icon(Icons.arrow_back, size: 18), onPressed: () {}),
        titleSpacing: 0,
        title: const Text("Employee Management", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                statButton('Total', employees.length, kButtonColor),
                statButton('Active', countStatus('Active'), kButtonColor),
                statButton('Inactive', countStatus('Inactive'), kButtonColor),
                statButton('Suspended', countStatus('Suspended'), kButtonColor),
                statButton('Relived', countStatus('Relived'), kButtonColor),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push<Employee>(
                      context,
                      MaterialPageRoute(builder: (_) => const CreateEmployeeScreen()),
                    );
                    if (result != null) {
                      setState(() {
                        employees.add(result);
                        updateFiltered(searchController.text);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    foregroundColor: kTextColor,
                    minimumSize: const Size(120, 36),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Create Employee", style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ReportSchedulerPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    foregroundColor: kTextColor,
                    minimumSize: const Size(120, 36),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Create Scheduler", style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: searchController,
                onChanged: updateFiltered,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 1300,
                  child: Column(
                    children: [
                      Container(
  color: Colors.grey[300],
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  child: Row(
    children: const [
      Expanded(flex: 4, child: Text("ID", style: TextStyle(fontWeight: FontWeight.bold))),
      Expanded(flex: 6, child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
      Expanded(flex: 8, child: Text("Email", style: TextStyle(fontWeight: FontWeight.bold))),
      Expanded(flex: 7, child: Text("Mobile", style: TextStyle(fontWeight: FontWeight.bold))),
      Expanded(flex: 6, child: Text("Shift Group", style: TextStyle(fontWeight: FontWeight.bold))),
      Expanded(flex: 6, child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold))),
      Expanded(flex: 6, child: Text("Department", style: TextStyle(fontWeight: FontWeight.bold))),
      Expanded(flex: 6, child: Text("Designation", style: TextStyle(fontWeight: FontWeight.bold))),
      Expanded(flex: 4, child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
      Expanded(flex: 5, child: Center(child: Text("Delete", style: TextStyle(fontWeight: FontWeight.bold)))),
      Expanded(flex: 5, child: Center(child: Text("Edit", style: TextStyle(fontWeight: FontWeight.bold)))),
    ],
  ),
),

                      Expanded(
  child: ListView.builder(
    itemCount: filtered.length,
    itemBuilder: (context, i) {
      final e = filtered[i];
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _cell(e.id, flex: 4),
            _cell(e.name, flex: 6),
            _cell(e.email, flex: 8),
            _cell(e.mobile, flex: 7),
            _cell(e.shiftGroup, flex: 6),
            _cell(e.location, flex: 6),
            _cell(e.dept, flex: 6),
            _cell(e.designation, flex: 6),
            _cell(e.status, flex: 4),
            Expanded(
              flex: 5,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      employees.removeWhere((emp) => emp.id == e.id);
                      updateFiltered(searchController.text);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () async {
                    final edited = await Navigator.push<Employee>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreateEmployeeScreen(editEmployee: e),
                      ),
                    );
                    if (edited != null) {
                      setState(() {
                        final idx = employees.indexWhere((emp) => emp.id == e.id);
                        if (idx != -1) {
                          employees[idx] = edited;
                          updateFiltered(searchController.text);
                        }
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  ),
)



                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateEmployeeScreen extends StatefulWidget {
  final Employee? editEmployee;
  const CreateEmployeeScreen({super.key, this.editEmployee});

  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final id = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final shiftgroup = TextEditingController();
  final password = TextEditingController();
  final location = TextEditingController();
  final dept = TextEditingController();
  final desig = TextEditingController();

  bool _obscurePassword = true;
  String status = 'Active';
  String dialCode = '+91';

    // 🟢 NEW: Shift options list
  final List<String> shiftOptions = [ // 🟢
    'GCC Shift 1', // 🟢
    'General Shift 2', // 🟢
    'Open Shift ', // 🟢
    'Shift', // 🟢
    'General shift2', // 🟢
  ]; // 🟢


  @override
  void initState() {
    super.initState();
    final emp = widget.editEmployee;
    if (emp != null) {
      name.text = emp.name;
      id.text = emp.id;
      email.text = emp.email;
      mobile.text = emp.mobile.replaceFirst(RegExp(r'^\\+?\\d+\\s'), '');
      shiftgroup.text = emp.shiftGroup;
      location.text = emp.location;
      dept.text = emp.dept;
      desig.text = emp.designation;
      status = emp.status;
    }
  }

  Widget formField(String label, TextEditingController ctrl, {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: ctrl,
        keyboardType: type,
        validator: (v) {
          if (v == null || v.trim().isEmpty) return 'Required';
          if (label == "Email") {
            final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
            if (!emailRegex.hasMatch(v.trim())) return 'Enter valid email';
          }
          return null;
        },
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(
              text: label,
              style: const TextStyle(color: Colors.black),
              children: const [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: password,
        obscureText: _obscurePassword,
        validator: (v) {
          if (v == null || v.trim().isEmpty) return 'Required';
          if (v.trim().length < 6) return 'Password too short';
          return null;
        },
        decoration: InputDecoration(
          label: RichText(
            text: const TextSpan(
              text: "Password",
              style: TextStyle(color: Colors.black),
              children: [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          ),
        ),
      ),
    );
  }
  // 🟢 NEW: Dropdown widget for Shift Group
  Widget shiftDropdownField() { // 🟢
    return Padding( // 🟢
      padding: const EdgeInsets.symmetric(vertical: 6), // 🟢
      child: DropdownButtonFormField<String>( // 🟢
        value: shiftgroup.text.isNotEmpty ? shiftgroup.text : null, // 🟢
        items: shiftOptions.map((value) { // 🟢
          return DropdownMenuItem<String>( // 🟢
            value: value, // 🟢
            child: Text(value), // 🟢
          ); // 🟢
        }).toList(), // 🟢
        onChanged: (value) { // 🟢
          setState(() { // 🟢
            shiftgroup.text = value!; // 🟢
          }); // 🟢
        }, // 🟢
        validator: (value) => value == null || value.isEmpty ? 'Required' : null, // 🟢
        decoration: InputDecoration( // 🟢
          label: RichText( // 🟢
            text: const TextSpan( // 🟢
              text: 'Shift Group', // 🟢
              style: TextStyle(color: Colors.black), // 🟢
              children: [TextSpan(text: ' *', style: TextStyle(color: Colors.red))], // 🟢
            ), // 🟢
          ), // 🟢
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // 🟢
        ), // 🟢
      ), // 🟢
    ); // 🟢
  } // 🟢

  void submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final newEmp = Employee(
        name: name.text,
        id: id.text,
        email: email.text,
        mobile: '$dialCode ${mobile.text}',
        shiftGroup: shiftgroup.text,
        location: location.text,
        dept: dept.text,
        designation: desig.text,
        status: status,
      );
      Navigator.pop(context, newEmp);
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Create Employee", style: TextStyle(fontSize: 16)),
      backgroundColor: kAppBarColor,
      foregroundColor: Colors.white,
    ),
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              formField("Employee Name", name),
              formField("Employee ID", id),
              formField("Email", email, type: TextInputType.emailAddress),
              IntlPhoneField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  label: RichText(
                    text: const TextSpan(
                      text: 'Mobile',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [TextSpan(text: ' *', style: TextStyle(color: Colors.red, fontSize: 16))],
                    ),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  dialCode = phone.countryCode;
                  mobile.text = phone.number;
                },
              ),
              shiftDropdownField(),
              passwordField(),
              formField("Location", location),
              formField("Department", dept),
              formField("Designation", desig),
              Row(
                children: [
                  const Text("Status: "),
                  Radio<String>(
                    value: 'Active',
                    groupValue: status,
                    onChanged: (val) => setState(() => status = val!),
                  ),
                  const Text("Active"),
                  Radio<String>(
                    value: 'Inactive',
                    groupValue: status,
                    onChanged: (val) => setState(() => status = val!),
                  ),
                  const Text("Inactive"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: submit,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text(widget.editEmployee == null ? "Create" : "Update"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}