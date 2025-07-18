


// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'report_scheduler_page.dart'; // 👈 Make sure this file exists

// // ✅ Color Constants
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF); // Light lavender
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9); // Deeper lavender
// const Color kAppBarColor = Color(0xFF8c6eaf); // Updated app bar color
// const Color kButtonColor = Color(0xFF655193); // Updated button color
// const Color kTextColor = Colors.white;

// class Employee {
//   final String name, id, email, mobile, location, dept, designation, status;

//   Employee({
//     required this.name,
//     required this.id,
//     required this.email,
//     required this.mobile,
//     required this.location,
//     required this.dept,
//     required this.designation,
//     required this.status,
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
//       filtered = employees.where((e) =>
//           e.name.toLowerCase().contains(query.toLowerCase()) ||
//           e.id.toLowerCase().contains(query.toLowerCase())).toList();
//     });
//   }

//   void addEmployee(Employee emp) {
//     setState(() {
//       employees.add(emp);
//       updateFiltered(searchController.text);
//     });
//   }

//   int countStatus(String status) =>
//       employees.where((e) => e.status == status).length;

//   Widget statButton(String label, int count) {
//     return SizedBox(
//       width: 120,
//       height: 40,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: kButtonColor,
//           foregroundColor: kTextColor,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//           padding: EdgeInsets.zero,
//         ),
//         onPressed: () {},
//         child: Text(
//           '$label $count',
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontSize: 14),
//         ),
//       ),
//     );
//   }

//   Widget rowText(String text) => Expanded(
//         flex: 1,
//         child: Text(text, overflow: TextOverflow.ellipsis),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundBottom,
//       appBar: AppBar(
//         toolbarHeight: 50,
//         backgroundColor: kAppBarColor,
//         foregroundColor: kTextColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, size: 18),
//           onPressed: () {},
//         ),
//         titleSpacing: 0,
//         title: const Text(
//           "Employee Management",
//           style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 10),
//             child: Center(
//               child: Text(
//                 "Welcome to SERV 🌐 EN",
//                 style: TextStyle(fontSize: 8),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(children: [
//         const SizedBox(height: 10),
//         Wrap(
//           spacing: 10,
//           runSpacing: 10,
//           alignment: WrapAlignment.center,
//           children: [
//             statButton('Total', employees.length),
//             statButton('Active', countStatus('Active')),
//             statButton('Inactive', countStatus('Inactive')),
//             statButton('Suspended', countStatus('Suspended')),
//             statButton('Relived', countStatus('Relived')),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Column(children: [
//           ElevatedButton(
//             onPressed: () async {
//               var result = await Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const CreateEmployeeScreen()),
//               );
//               if (result != null && result is Employee) addEmployee(result);
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: kButtonColor,
//               foregroundColor: kTextColor,
//               minimumSize: const Size(160, 48),
//               shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//             ),
//             child: const Text("Create Employee"),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => ReportSchedulerPage()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: kButtonColor,
//               foregroundColor: kTextColor,
//               minimumSize: const Size(160, 48),
//               shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//             ),
//             child: const Text("Create Scheduler"),
//           ),
//         ]),
//         Padding(
//           padding: const EdgeInsets.all(10),
//           child: TextField(
//             controller: searchController,
//             onChanged: updateFiltered,
//             decoration: InputDecoration(
//               prefixIcon: const Icon(Icons.search),
//               hintText: 'Search',
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//             ),
//           ),
//         ),
//         Container(
//           color: Colors.grey[300],
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//           child: Row(
//             children: const [
//               Expanded(child: Text("ID", style: TextStyle(fontWeight: FontWeight.bold))),
//               Expanded(child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
//               Expanded(child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold))),
//               Expanded(child: Text("Mobile", style: TextStyle(fontWeight: FontWeight.bold))),
//               Expanded(child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
//             ],
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: filtered.length,
//             itemBuilder: (context, i) {
//               final e = filtered[i];
//               return Container(
//                 color: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//                 child: Row(
//                   children: [
//                     rowText(e.id),
//                     rowText(e.name),
//                     rowText(e.location),
//                     rowText(e.mobile),
//                     rowText(e.status),
//                   ],
//                 ),
//               );
//             },
//           ),
//         )
//       ]),
//     );
//   }
// }

// class CreateEmployeeScreen extends StatefulWidget {
//   const CreateEmployeeScreen({super.key});
//   @override
//   State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
// }

// class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final name = TextEditingController();
//   final id = TextEditingController();
//   final email = TextEditingController();
//   final mobile = TextEditingController();
//   final location = TextEditingController();
//   final dept = TextEditingController();
//   final desig = TextEditingController();
//   String status = 'Active';
//   String dialCode = '+91';

//   void submit() {
//     if (_formKey.currentState!.validate()) {
//       Navigator.pop(
//         context,
//         Employee(
//           name: name.text,
//           id: id.text,
//           email: email.text,
//           mobile: '$dialCode ${mobile.text}',
//           location: location.text,
//           dept: dept.text,
//           designation: desig.text,
//           status: status,
//         ),
//       );
//     }
//   }

//   Widget formField(String label, TextEditingController ctrl,
//       {TextInputType type = TextInputType.text}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: TextFormField(
//         controller: ctrl,
//         keyboardType: type,
//         validator: (v) {
//           if (v == null || v.isEmpty) return 'Required';
//           if (label == "Email") {
//             final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
//             if (!emailRegex.hasMatch(v)) return 'Enter valid email';
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Create Employee", style: TextStyle(fontSize: 16)),
//         centerTitle: false,
//         backgroundColor: kAppBarColor,
//         foregroundColor: kTextColor,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12),
//         child: Form(
//           key: _formKey,
//           child: Column(children: [
//             formField("Employee Name", name),
//             formField("Employee ID", id),
//             formField("Email", email, type: TextInputType.emailAddress),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 6),
//               child: IntlPhoneField(
//                 decoration: const InputDecoration(
//                   labelText: 'Mobile',
//                   border: OutlineInputBorder(),
//                 ),
//                 initialCountryCode: 'IN',
//                 onChanged: (phone) {
//                   dialCode = phone.countryCode;
//                   mobile.text = phone.number;
//                 },
//                 validator: (phone) =>
//                     phone == null || phone.number.isEmpty ? 'Required' : null,
//               ),
//             ),
//             formField("Location", location),
//             formField("Department", dept),
//             formField("Designation", desig),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 const Text("Status: "),
//                 Radio<String>(
//                   value: 'Active',
//                   groupValue: status,
//                   onChanged: (val) => setState(() => status = val!),
//                 ),
//                 const Text("Active"),
//                 Radio<String>(
//                   value: 'Inactive',
//                   groupValue: status,
//                   onChanged: (val) => setState(() => status = val!),
//                 ),
//                 const Text("Inactive"),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
//                   child: const Text("Cancel"),
//                 ),
//                 ElevatedButton(
//                   onPressed: submit,
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                   child: const Text("Create"),
//                 ),
//               ],
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'report_scheduler_page.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Color & style constants
const Color kPrimaryBackgroundTop    = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor             = Color(0xFF655193);
const Color kButtonColor             = Color(0xFF655193);
const Color kTextColor               = Colors.white;
// ─────────────────────────────────────────────────────────────────────────────

class Employee {
  final String name, id, email, mobile, location, dept, designation, status;
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
  List<Employee> filtered  = [];
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
        return e.name.toLowerCase().contains(q) ||
               e.id.toLowerCase().contains(q);
      }).toList();
    });
  }

  int countStatus(String status) =>
      employees.where((e) => e.status == status).length;

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
        child: Text(
          '$label $count',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11),
        ),
      ),
    );
  }

  Widget rowText(String text) => Expanded(
        flex: 1,
        child: Text(text, overflow: TextOverflow.ellipsis),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: kAppBarColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 18),
          onPressed: () {},
        ),
        titleSpacing: 0,
        title: const Text(
          "Employee Management",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kPrimaryBackgroundTop,
              kPrimaryBackgroundBottom,
            ],
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
                statButton('Total',     employees.length,             kButtonColor),
                statButton('Active',    countStatus('Active'),        kButtonColor),
                statButton('Inactive',  countStatus('Inactive'),      kButtonColor),
                statButton('Suspended', countStatus('Suspended'),     kButtonColor),
                statButton('Relived',   countStatus('Relived'),       kButtonColor),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Create Employee", style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ReportSchedulerPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    foregroundColor: kTextColor,
                    minimumSize: const Size(120, 36),
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                children: const [
                  Expanded(flex: 2, child: Text("ID",       style: TextStyle(fontWeight: FontWeight.bold)) ),
                  Expanded(flex: 3, child: Text("Name",     style: TextStyle(fontWeight: FontWeight.bold)) ),
                  Expanded(flex: 4, child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold)) ),
                  Expanded(flex: 4, child: Text("Mobile",   style: TextStyle(fontWeight: FontWeight.bold)) ),
                  Expanded(flex: 3, child: Text("Status",   style: TextStyle(fontWeight: FontWeight.bold)) ),
                  SizedBox(width: 30),
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
                      children: [
                        Expanded(flex: 2, child: Text(e.id, softWrap: false, overflow: TextOverflow.ellipsis)),
                        Expanded(flex: 3, child: Text(e.name, softWrap: false, overflow: TextOverflow.ellipsis)),
                        Expanded(flex: 4, child: Text(e.location, softWrap: false, overflow: TextOverflow.ellipsis)),
                        Expanded(flex: 4, child: Text(e.mobile, softWrap: false, overflow: TextOverflow.ellipsis)),
                        Expanded(flex: 3, child: Text(e.status, softWrap: false, overflow: TextOverflow.ellipsis)),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              employees.removeWhere((emp) => emp.id == e.id);
                              updateFiltered(searchController.text);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen({super.key});
  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final name     = TextEditingController();
  final id       = TextEditingController();
  final email    = TextEditingController();
  final mobile   = TextEditingController();
  final location = TextEditingController();
  final dept     = TextEditingController();
  final desig    = TextEditingController();
  String status   = 'Active';
  String dialCode = '+91';

  Widget formField(String label, TextEditingController ctrl,
      {TextInputType type = TextInputType.text}) {
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
              children: const [
                TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  void submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final newEmp = Employee(
        name:        name.text,
        id:          id.text,
        email:       email.text,
        mobile:      '$dialCode ${mobile.text}',
        location:    location.text,
        dept:        dept.text,
        designation: desig.text,
        status:      status,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              formField("Employee Name", name),
              formField("Employee ID",   id),
              formField("Email",          email, type: TextInputType.emailAddress),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Mobile *',
                    border: OutlineInputBorder(),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    dialCode     = phone.countryCode;
                    mobile.text  = phone.number;
                  },
                  validator: (phone) {
                    if (phone == null || phone.number.isEmpty) {
                      return 'Required';
                    } else if (!RegExp(r'^\\d+\$').hasMatch(phone.number)) {
                      return 'Only digits allowed';
                    }
                    return null;
                  },
                ),
              ),
              formField("Location",    location),
              formField("Department",  dept),
              formField("Designation", desig),
              const SizedBox(height: 10),
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
                    child: const Text("Create"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}