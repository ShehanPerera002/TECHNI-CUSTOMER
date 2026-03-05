import 'package:flutter/material.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Create Your Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // Profile Image
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    ),

                    // Camera Icon
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF2563EB),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              const Center(
                child: Text(
                  "Upload Profile Photo",
                  style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                ),
              ),

              const SizedBox(height: 30),

              // Full Name
              const Text(
                "Full Name",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                hint: "Enter your full name",
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 20),

              // Age
              const Text("Age", style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              _buildTextField(
                hint: "Enter your age",
                icon: Icons.calendar_today_outlined,
              ),

              const SizedBox(height: 20),

              // Email
              const Text(
                "Email Address",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                hint: "Enter your email address",
                icon: Icons.mail_outline,
              ),

              const SizedBox(height: 20),

              // Location
              const Text(
                "Your Location",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              // Current Location Button
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF2563EB),
                    width: 1.5,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFF2563EB),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Use your current location",
                          style: TextStyle(color: Color(0xFF2563EB)),
                        ),
                      ),
                      Icon(Icons.arrow_circle_right, color: Color(0xFF2563EB)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Manual Address
              _buildTextField(hint: "or Enter address manually", icon: null),

              const Spacer(),

              // Save Profile Button
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Save Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildTextField({required String hint, IconData? icon}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
          prefixIcon: icon != null ? Icon(icon, color: Colors.black54) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
