import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../core/assets.dart';
import '../models/service_detail_data.dart';
import '../widgets/primary_button.dart';

/// Reusable service detail page. Pass [service] with dynamic content
/// (title, description, pricing, CTA text).
class ServiceDetailScreen extends StatefulWidget {
  final ServiceDetailData service;

  const ServiceDetailScreen({super.key, required this.service});

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  final TextEditingController _issueController = TextEditingController();
  bool _hasVoiceRecording = false;
  File? _selectedImage;

  ServiceDetailData get service => widget.service;

  bool get _isFormValid =>
      _issueController.text.trim().isNotEmpty ||
      _hasVoiceRecording ||
      _selectedImage != null;

  @override
  void initState() {
    super.initState();
    _issueController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _issueController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _selectedImage = File(image.path));
    }
  }

  void _showVoiceRecordingPlaceholder() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.mic, size: 48, color: Colors.grey.shade600),
            const SizedBox(height: 16),
            Text(
              "Voice recording placeholder",
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 8),
            const Text(
              "Tap Done to add your voice note.",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() => _hasVoiceRecording = true);
                  Navigator.pop(context);
                },
                child: const Text("Done"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          service.pageTitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildHeroImage(),
            const SizedBox(height: 24),
            Text(
              service.serviceTitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              service.fullDescription,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            _buildIssueInput(),
            const SizedBox(height: 24),
            const Text(
              "Estimated Pricing",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildPricingCard(),
            const SizedBox(height: 32),
            PrimaryButton(
              text: service.ctaText,
              onPressed: _isFormValid ? () {} : null,
            ),
            if (!_isFormValid) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: Text(
                  "Please describe your issue and click the find button",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.amber.shade900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        service.imagePath ?? AppAssets.welcomePage,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildIssueInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _issueController,
              decoration: InputDecoration(
                hintText: "Describe your issue...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.mic,
              color: _hasVoiceRecording
                  ? const Color(0xFF2563EB)
                  : Colors.grey.shade600,
            ),
            onPressed: _showVoiceRecordingPlaceholder,
          ),
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: _selectedImage != null
                  ? const Color(0xFF2563EB)
                  : Colors.grey.shade600,
            ),
            onPressed: _pickImage,
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildPricingRow("Inspection fee", service.inspectionFee),
          const SizedBox(height: 12),
          _buildPricingRow("Hourly Rate", service.hourlyRate),
          const SizedBox(height: 12),
          _buildPricingRow("Materials", service.materials),
        ],
      ),
    );
  }

  Widget _buildPricingRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
