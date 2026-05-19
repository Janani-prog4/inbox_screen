import 'package:flutter/material.dart';

class ComposeEmailScreen extends StatefulWidget {
  const ComposeEmailScreen({super.key});

  @override
  State<ComposeEmailScreen> createState() => _ComposeEmailScreenState();
}

class _ComposeEmailScreenState extends State<ComposeEmailScreen> {
  String _recipientType = 'All';

  String? _selectedBatch;
  String? _selectedRollNo;

  final List<String> _batchYears = ['2023', '2022', '2021', '2020'];

  final List<String> _rollNumbers = [
    '2, R Jayaraman',
    '4, Vincent Dhanaraj',
    '6, Anand',
    '7, Muthukumaraswamy',
    '9, Meganathan',
    '12, Vgk',
    '16, Dileepan',
    '17, Jagan Mohanan',
    '18, Varthaman',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F8),

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFB71C1C)),
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text(
          'Compose',
          style: TextStyle(
            color: Color(0xFFB71C1C),
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0,

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade200, height: 1.0),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // FROM
                  _buildInputRow(
                    'From',
                    const Text(
                      'Ruban S S Selvaraj',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  // TO SECTION
                  _buildRecipientSection(),

                  // CC
                  _buildInputRow(
                    'Cc',
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'E-mail IDs by comma',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  // SUBJECT
                  _buildInputRow(
                    'Subject',
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Subject',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  // ATTACHMENT
                  _buildAttachmentRow(),

                  // BODY
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Compose email',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          _buildBottomActions(),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Alumni Association Portal • Secure Messaging',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  // INPUT ROW

  Widget _buildInputRow(String label, Widget content) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),

          Expanded(child: content),
        ],
      ),
    );
  }

  // RECIPIENT SECTION

  Widget _buildRecipientSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 80,
            child: Text(
              'To',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ALL
                InkWell(
                  onTap: () {
                    setState(() {
                      _recipientType = 'All';
                    });
                  },

                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'All',
                        groupValue: _recipientType,
                        activeColor: const Color(0xFFB71C1C),

                        onChanged: (val) {
                          setState(() {
                            _recipientType = val!;
                          });
                        },

                        visualDensity: VisualDensity.compact,
                      ),

                      const Text('All', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // BATCH
                InkWell(
                  onTap: () {
                    setState(() {
                      _recipientType = 'Batch';
                    });
                  },

                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'Batch',
                        groupValue: _recipientType,
                        activeColor: const Color(0xFFB71C1C),

                        onChanged: (val) {
                          setState(() {
                            _recipientType = val!;
                          });
                        },

                        visualDensity: VisualDensity.compact,
                      ),

                      const Text('Batch', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),

                // SHOW ONLY WHEN BATCH SELECTED
                if (_recipientType == 'Batch') ...[
                  const SizedBox(height: 8),

                  _buildDropdown(
                    '--Batch Year--',
                    _batchYears,
                    _selectedBatch,
                    (val) {
                      setState(() {
                        _selectedBatch = val;
                      });
                    },
                  ),

                  const SizedBox(height: 12),
                ],

                // INDIVIDUAL
                InkWell(
                  onTap: () {
                    setState(() {
                      _recipientType = 'An Amaravian';
                    });
                  },

                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'An Amaravian',
                        groupValue: _recipientType,
                        activeColor: const Color(0xFFB71C1C),

                        onChanged: (val) {
                          setState(() {
                            _recipientType = val!;
                          });
                        },

                        visualDensity: VisualDensity.compact,
                      ),

                      const Text('Individual', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),

                // SHOW ONLY WHEN INDIVIDUAL SELECTED
                if (_recipientType == 'Individual') ...[
                  const SizedBox(height: 8),

                  _buildDropdown('--Roll No--', _rollNumbers, _selectedRollNo, (
                    val,
                  ) {
                    setState(() {
                      _selectedRollNo = val;
                    });
                  }),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // DROPDOWN

  Widget _buildDropdown(
    String hint,
    List<String> items,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(horizontal: 12),

      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),

        border: Border.all(color: Colors.grey.shade300),
      ),

      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,

          hint: Text(hint, style: const TextStyle(fontSize: 14)),

          value: selectedValue,

          items: items.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e, style: const TextStyle(fontSize: 14)),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ),
    );
  }

  // ATTACHMENT ROW

  Widget _buildAttachmentRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),

      child: Row(
        children: [
          const Icon(Icons.attach_file, color: Colors.grey, size: 20),

          const SizedBox(width: 8),

          const Text(
            'Attach File',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  // BOTTOM ACTIONS

  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),

      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),

              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.grey),

                padding: const EdgeInsets.symmetric(vertical: 16),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB71C1C),

                padding: const EdgeInsets.symmetric(vertical: 16),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              child: const Text(
                'Send',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
