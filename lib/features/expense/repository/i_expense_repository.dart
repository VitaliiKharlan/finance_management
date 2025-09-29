import '../../category/models/category_transaction_dto.dart';

abstract class IExpenseRepository {
  Future<CategoryTransactionDto> addExpense(CategoryTransactionDto dto);

  Future<CategoryTransactionDto> updateExpense(
    String id,
    CategoryTransactionDto dto,
  );

  Future<void> deleteExpense(String id);

  Future<List<CategoryTransactionDto>> getAllTransactions();

  Stream<List<CategoryTransactionDto>> getTransactionsStream();

  Future<double> getTotalExpense();
}
