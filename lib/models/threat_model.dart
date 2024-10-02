class DetectedThreat {
  final String threatType;
  final String description;
  final DateTime detectedAt;
  final String severity;
  final String source;
  final String filePath;

  DetectedThreat({
    required this.threatType,
    required this.description,
    required this.detectedAt,
    required this.severity,
    required this.source,
    required this.filePath,
  });

  // Convert a DetectedThreat object to a map for easy storage or serialization
  Map<String, dynamic> toMap() {
    return {
      'threatType': threatType,
      'description': description,
      'detectedAt': detectedAt.toIso8601String(),
      'severity': severity,
      'source': source,
      'filePath': filePath,
    };
  }

  // Create a DetectedThreat object from a map (useful for deserialization)
  factory DetectedThreat.fromMap(Map<String, dynamic> map) {
    return DetectedThreat(
      threatType: map['threatType'] ?? '',
      description: map['description'] ?? '',
      detectedAt: DateTime.parse(map['detectedAt']),
      severity: map['severity'] ?? '',
      source: map['source'] ?? '',
      filePath: map['filePath'] ?? '',
    );
  }

  // Example of a method that determines whether the threat is critical
  bool isCritical() {
    return severity.toLowerCase() == 'high' || severity.toLowerCase() == 'critical';
  }
}

// Example usage:
class ThreatManager {
  List<DetectedThreat> threats = [];

  // Add a new threat to the list
  void addThreat(DetectedThreat threat) {
    threats.add(threat);
  }

  // Get all critical threats
  List<DetectedThreat> getCriticalThreats() {
    return threats.where((threat) => threat.isCritical()).toList();
  }

  // Get all threats
  List<DetectedThreat> getAllThreats() {
    return threats;
  }

  // Example of clearing all threats
  void clearAllThreats() {
    threats.clear();
  }
}