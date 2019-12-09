import 'package:flutter/material.dart';
import 'package:flutter_desktop_example/droidkaigi/styles.dart';

class Api extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blueGrey,
          child: DataTable(
            columnSpacing: 70,
            dataRowHeight: 70,
            headingRowHeight: 70,
            columns: [
              DataColumn(
                label: Text(
                  '',
                  style: smallTitleStyle,
                ),
              ),
              DataColumn(
                label: Text(
                  'API',
                  style: smallTitleStyle,
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Windows',
                      style: smallTitleStyle,
                    ),
                  ),
                  DataCell(
                    Text(
                      'Win32',
                      style: smallTitleStyle,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Mac',
                      style: smallTitleStyle,
                    ),
                  ),
                  DataCell(
                    Text(
                      'Objective-C',
                      style: smallTitleStyle,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Linux',
                      style: smallTitleStyle,
                    ),
                  ),
                  DataCell(
                    Text(
                      'GLFW',
                      style: smallTitleStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Plugins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List<String>> lists = [
      ["file_chooser", "○", "○", ""],
      ["coonectivity", "", "○", ""],
      ["path_provider", "", "○", ""],
      ["shared_preference", "", "○", ""],
      ["url_launcher", "○", "○", "○"]
    ];

    List<DataRow> dataRows = [];

    for (var _row in lists) {
      List<DataCell> row = [];
      for (var _col in _row) {
        row.add(
          DataCell(
            Text(
              _col,
              style: smallTitleStyle,
            ),
          ),
        );
      }
      dataRows.add(DataRow(cells: row));
    }

    return Card(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blueGrey,
          child: DataTable(
              columnSpacing: 70,
              dataRowHeight: 70,
              headingRowHeight: 70,
              columns: [
                DataColumn(
                  label: Text(
                    '',
                    style: smallTitleStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Windows',
                    style: smallTitleStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Mac',
                    style: smallTitleStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Linux',
                    style: smallTitleStyle,
                  ),
                ),
              ],
              rows: dataRows),
        ),
      ),
    );
  }
}
