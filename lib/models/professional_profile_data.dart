/// Extended profile data for a professional (description, details, verified services).
class ProfessionalProfileData {
  final String from;
  final String qualifications;
  final String avgResponseTime;
  final String description;
  final List<String> verifiedServices;

  const ProfessionalProfileData({
    required this.from,
    required this.qualifications,
    required this.avgResponseTime,
    required this.description,
    required this.verifiedServices,
  });

  static ProfessionalProfileData getForProfessional(String id) {
    final data = _profileData[id];
    return data ?? _profileData['1']!;
  }

  static const _profileData = {
    '1': ProfessionalProfileData(
      from: 'Battaramulla',
      qualifications: 'NVQ-L3',
      avgResponseTime: '1-5 Minutes',
      description:
          "I'm Saman - your trusted plumbing expert with over 12 years of hands-on experience. Specializing in emergency leak repairs, pipe installations, and bathroom plumbing. I believe in honest pricing, clean work, and lasting solutions. Certified and fully insured for your peace of mind.",
      verifiedServices: [
        'Pipe Installation & Repair',
        'Leak Detection & Fixing',
        'Drain Unblocking',
        'Emergency Repairs',
      ],
    ),
    '2': ProfessionalProfileData(
      from: 'Nugegoda',
      qualifications: 'NVQ-L3, City & Guilds',
      avgResponseTime: '5-10 Minutes',
      description:
          "Hi, I'm Sunil with 8+ years in plumbing. I handle water heaters, pipe repairs, and general plumbing. Quality work at fair prices. Available for both residential and commercial jobs.",
      verifiedServices: [
        'Water Heater Repair',
        'Pipe Installation',
        'Leak Detection',
        'Drain Cleaning',
      ],
    ),
    '3': ProfessionalProfileData(
      from: 'Colombo 05',
      qualifications: 'NVQ-L2',
      avgResponseTime: '3-7 Minutes',
      description:
          "Kamala here - experienced plumber specializing in kitchen and bathroom work. I focus on quick fixes and lasting solutions. Clean, professional, and reliable.",
      verifiedServices: [
        'Kitchen Plumbing',
        'Bathroom Repairs',
        'Pipe Installation',
        'Emergency Repairs',
      ],
    ),
    '4': ProfessionalProfileData(
      from: 'Maharagama',
      qualifications: 'NVQ-L3, Diploma',
      avgResponseTime: '2-6 Minutes',
      description:
          "Rohan - 10 years of plumbing experience. I tackle everything from small leaks to major installations. Honest, punctual, and dedicated to customer satisfaction.",
      verifiedServices: [
        'Leak Detection & Fixing',
        'Pipe Replacement',
        'Toilet Repairs',
        'Emergency Repairs',
      ],
    ),
    '5': ProfessionalProfileData(
      from: 'Dehiwala',
      qualifications: 'NVQ-L3',
      avgResponseTime: '4-8 Minutes',
      description:
          "Nimal - your local plumbing specialist. Over 7 years in the trade. I offer same-day service for emergencies and competitive rates. Let me solve your plumbing issues.",
      verifiedServices: [
        'Emergency Repairs',
        'Pipe Installation',
        'Drain Unblocking',
        'Water System Repair',
      ],
    ),
  };
}
