class HistoryModel {
  final String nature;
  final double amount;
  final String status;
  final DateTime timestamp;

  HistoryModel(
      {required this.nature,
      required this.amount,
      required this.status,
      required this.timestamp});
}

List<HistoryModel> histories = [
  HistoryModel(
    nature: "Withdraw",
    status: "success",
    amount: 2400,
    timestamp: DateTime.now(),
  ),
  HistoryModel(
    nature: "Withdraw",
    status: "failed",
    amount: 2400,
    timestamp: DateTime.now(),
  ),
  HistoryModel(
    nature: "Withdraw",
    status: "success",
    amount: 3200,
    timestamp: DateTime.now(),
  ),
  HistoryModel(
    nature: "Earned",
    status: "pending",
    amount: 5200,
    timestamp: DateTime.now(),
  ),
  HistoryModel(
    nature: "Withdraw",
    status: "success",
    amount: 2800,
    timestamp: DateTime.now(),
  ),
  HistoryModel(
    nature: "Earned",
    status: "failed",
    amount: 1800,
    timestamp: DateTime.now(),
  ),
];
