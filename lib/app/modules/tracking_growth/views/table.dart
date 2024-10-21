import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SDIDTK Table'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Pelayanan SDIDTK',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // First table
            _buildGrowthMonitoringTable(width),
            const SizedBox(height: 30),
            // Second table
            _buildDevelopmentMonitoringTable(width),
          ],
        ),
      ),
    );
  }

  // First table: Growth monitoring
  Widget _buildGrowthMonitoringTable(double width) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: {
        0: FixedColumnWidth(width * 0.3),
        1: FixedColumnWidth(width * 0.15),
        2: FixedColumnWidth(width * 0.15),
        3: FixedColumnWidth(width * 0.15),
        4: FixedColumnWidth(width * 0.15),
        5: FixedColumnWidth(width * 0.1),
      },
      children: [
        // Header row
        TableRow(
          decoration: BoxDecoration(color: Colors.greenAccent),
          children: [
            _buildCell('Hasil Pemantauan Perkembangan', isHeader: true),
            _buildCell('BB/U', isHeader: true),
            _buildCell('TB/U', isHeader: true),
            _buildCell('LK/U', isHeader: true),
            _buildCell('TB/U', isHeader: true),
            _buildCell('Catatan', isHeader: true),
          ],
        ),
        // Example data rows
        _buildDataRow(['5', 'N', 'N', 'N', 'G/N', 'SK']),
        _buildDataRow(['6', 'N', 'N', 'O', 'G/N', 'SK']),
        // Add more rows as necessary
      ],
    );
  }

  // Second table: Development Monitoring
  Widget _buildDevelopmentMonitoringTable(double width) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: {
        0: FixedColumnWidth(width * 0.3),
        1: FixedColumnWidth(width * 0.15),
        2: FixedColumnWidth(width * 0.15),
        3: FixedColumnWidth(width * 0.15),
        4: FixedColumnWidth(width * 0.15),
        5: FixedColumnWidth(width * 0.1),
      },
      children: [
        // Header row
        TableRow(
          decoration: BoxDecoration(color: Colors.greenAccent),
          children: [
            _buildCell('Pelayanan Stimulasi', isHeader: true),
            _buildCell('Deteksi Dini Penyimpangan', isHeader: true),
            _buildCell('Hasil PKAT', isHeader: true),
            _buildCell('Tindakan', isHeader: true),
            _buildCell('Kunjungan', isHeader: true),
          ],
        ),
        // Example data rows
        _buildDataRow(['TDD', 'N', 'R', 'Simulasi', 'Ulang']),
        _buildDataRow(['TDD', 'N', 'N', 'Intervensi', 'Ulang']),
        // Add more rows as necessary
      ],
    );
  }

  // Helper function to build individual table cells
  Widget _buildCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  // Helper function to build data rows
  TableRow _buildDataRow(List<String> rowValues) {
    return TableRow(
      children: rowValues.map((value) => _buildCell(value)).toList(),
    );
  }
}