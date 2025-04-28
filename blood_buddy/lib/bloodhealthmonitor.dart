import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BloodHealthMonitoringPage extends StatefulWidget {
  const BloodHealthMonitoringPage({super.key});

  @override
  _BloodHealthMonitoringPageState createState() =>
      _BloodHealthMonitoringPageState();
}

class _BloodHealthMonitoringPageState
    extends State<BloodHealthMonitoringPage> {
  final _hbController = TextEditingController();
  final _bpController = TextEditingController();
  final _oxygenController = TextEditingController();
  final _ironController = TextEditingController();
  String report = '';

  // Function to analyze the blood health based on input
  void _generateReport() {
    double hb = double.tryParse(_hbController.text) ?? 0.0;
    String bp = _bpController.text;
    double oxygen = double.tryParse(_oxygenController.text) ?? 0.0;
    double iron = double.tryParse(_ironController.text) ?? 0.0;

    // Analyzing the data
    StringBuffer analysis = StringBuffer();

    // Hemoglobin analysis
    if (hb >= 12.0 && hb <= 16.0) {
      analysis.writeln('Hemoglobin (Hb) is normal.');
    } else if (hb < 12.0) {
      analysis.writeln('Hemoglobin (Hb) is low. Consider iron-rich foods.');
    } else {
      analysis.writeln('Hemoglobin (Hb) is high. Please consult a doctor.');
    }

    // Blood Pressure analysis
    List<String> bpValues = bp.split('/');
    if (bpValues.length == 2) {
      int systolic = int.tryParse(bpValues[0]) ?? 0;
      int diastolic = int.tryParse(bpValues[1]) ?? 0;
      if (systolic < 120 && diastolic < 80) {
        analysis.writeln('Blood Pressure is normal.');
      } else if (systolic >= 120 && systolic <= 139 ||
          diastolic >= 80 && diastolic <= 89) {
        analysis.writeln('Blood Pressure is elevated. Monitor regularly.');
      } else {
        analysis.writeln('Blood Pressure is high. Consult a doctor.');
      }
    } else {
      analysis.writeln('Please enter a valid blood pressure value (e.g., 120/80).');
    }

    // Oxygen Level analysis
    if (oxygen >= 95) {
      analysis.writeln('Oxygen levels are normal.');
    } else if (oxygen >= 90) {
      analysis.writeln('Oxygen levels are slightly low. Stay hydrated.');
    } else {
      analysis.writeln('Oxygen levels are low. Please seek medical attention.');
    }

    // Iron level analysis
    if (iron >= 70) {
      analysis.writeln('Iron levels are sufficient.');
    } else {
      analysis.writeln('Iron levels are low. Consider iron supplements.');
    }

    setState(() {
      report = analysis.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(246, 205, 247, 247),
      appBar: AppBar(
        title: Text("Blood Health Monitoring",style: GoogleFonts.quicksand(fontWeight: FontWeight.w700,color: Colors.white),),
        backgroundColor :Colors.redAccent,
         shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Hemoglobin Input
              TextField(
                controller: _hbController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Hemoglobin Level (Hb)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
        
              // Blood Pressure Input (e.g., 120/80)
              TextField(
                controller: _bpController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Enter Blood Pressure (Systolic/Diastolic)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
        
              // Oxygen Level Input
              TextField(
                controller: _oxygenController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Oxygen Level (%)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
        
              // Iron Level Input
              TextField(
                controller: _ironController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Iron Level',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
        
              // Generate Report Button
              ElevatedButton(
                onPressed: _generateReport,
                child: const Text('Generate Report'),
              ),
              const SizedBox(height: 30),
        
              // Report Container
              if (report.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Health Report:',
                        style:GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(report),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
