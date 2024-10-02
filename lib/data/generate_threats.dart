import 'dart:math';
import 'package:cyber_triage_tool/models/threat_model.dart';

// Initialize the threatList as an empty list.
List<DetectedThreat> threatList = [];

// Helper to generate random threat data
List<String> threatTypes = [
  'Malware',
  'Phishing Attempt',
  'SQL Injection',
  'Ransomware',
  'DDoS Attack',
  'Brute Force Login',
  'Unauthorized File Access',
  'Privilege Escalation',
  'Insider Threat',
  'Data Exfiltration',
  'Trojan Horse',
  'Cryptojacking',
  'Man-in-the-Middle Attack',
  'Unpatched Vulnerability',
  'Unauthorized Device Connection',
  'Social Engineering',
  'Keylogger',
  'DNS Poisoning',
  'Bluetooth Exploit',
  'Registry Modification'
];

List<String> sources = [
  'File',
  'Network',
  'Email',
  'System Logs',
  'Access Logs',
  'Registry',
  'File System',
  'Vulnerability Scanner',
  'Web Application Logs',
  'Cloud Logs',
  'HR Reports',
  'Browser History',
];

List<String> severities = ['Low', 'Medium', 'High', 'Critical'];

List<String> descriptions = [
  'Unauthorized access to sensitive file',
  'Suspicious network activity detected',
  'Malware found in system files',
  'Brute force login attempt detected',
  'Phishing email with malicious attachment',
  'SQL Injection attempt on login page',
  'Ransomware encrypting system files',
  'Insider data leak detected',
  'Cryptojacking activity detected',
  'Unauthorized device connection',
  'Privilege escalation attempt detected',
  'DDoS attack targeting web server',
  'Man-in-the-Middle attack on network traffic',
  'Keylogger capturing user inputs',
  'Registry modification detected',
  'DNS poisoning detected',
  'Unauthorized cloud access detected',
  'Social engineering attack on employee',
  'Bluetooth exploit vulnerability detected'
];

// Function to generate random DateTime
DateTime randomDateTime() {
  final random = Random();
  int daysAgo = random.nextInt(365);
  int hoursAgo = random.nextInt(24);
  int minutesAgo = random.nextInt(60);
  return DateTime.now().subtract(Duration(days: daysAgo, hours: hoursAgo, minutes: minutesAgo));
}

// Function to generate random file paths
String generateFilePath(String source) {
  switch (source) {
    case 'File':
      return '/system32/malware.exe';
    case 'Network':
      return '/var/log/network_activity.log';
    case 'Email':
      return '/user/emails/malicious_attachment.docx';
    case 'System Logs':
      return '/var/log/system.log';
    case 'Access Logs':
      return '/var/log/access.log';
    case 'Registry':
      return 'HKEY_LOCAL_MACHINE\\Software\\SuspiciousApp';
    case 'File System':
      return '/home/user/encrypted_files';
    case 'Vulnerability Scanner':
      return '/var/log/vuln_scan.log';
    case 'Web Application Logs':
      return '/var/log/webapp.log';
    case 'Cloud Logs':
      return '/cloud/storage_access.log';
    case 'HR Reports':
      return '/hr/social_engineering_report.docx';
    case 'Browser History':
      return '/user/browser/download_history.log';
    default:
      return '/var/log/default.log';
  }
}

// Function to generate random threats and append to existing threatList
void appendThreats(int count) {
  final random = Random();

  for (int i = 0; i < count; i++) {
    String threatType = threatTypes[random.nextInt(threatTypes.length)];
    String description = descriptions[random.nextInt(descriptions.length)];
    DateTime detectedAt = randomDateTime();
    String severity = severities[random.nextInt(severities.length)];
    String source = sources[random.nextInt(sources.length)];
    String filePath = generateFilePath(source);

    threatList.add(DetectedThreat(
      threatType: threatType,
      description: description,
      detectedAt: detectedAt,
      severity: severity,
      source: source,
      filePath: filePath,
    ));
  }
}

// Example usage: Append 1000 more threats to the existing threat list
void main() {
  print('Initial threat list length: ${threatList.length}');
  appendThreats(1000);
  print('Updated threat list length: ${threatList.length}');
}
