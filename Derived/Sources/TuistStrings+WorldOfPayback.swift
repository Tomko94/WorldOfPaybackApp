// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum WorldOfPaybackStrings {
  /// All
  public static let all = WorldOfPaybackStrings.tr("Localizable", "All")
  /// Category
  public static let category = WorldOfPaybackStrings.tr("Localizable", "Category")
  /// Close
  public static let close = WorldOfPaybackStrings.tr("Localizable", "Close")
  /// dd.MM.yyyy HH:mm
  public static let dateAndTimeFormat = WorldOfPaybackStrings.tr("Localizable", "DateAndTimeFormat")
  /// Transaction Details
  public static let transactionDetailsTitle = WorldOfPaybackStrings.tr("Localizable", "TransactionDetailsTitle")
  /// Transactions
  public static let transactionListTitle = WorldOfPaybackStrings.tr("Localizable", "TransactionListTitle")
  /// Transactions value
  public static let transactionsValue = WorldOfPaybackStrings.tr("Localizable", "TransactionsValue")
  /// Try Again
  public static let tryAgain = WorldOfPaybackStrings.tr("Localizable", "Try Again")
  /// Error loading data.\nCheck your internet connection.
  public static let unknownError = WorldOfPaybackStrings.tr("Localizable", "UnknownError")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension WorldOfPaybackStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = WorldOfPaybackResources.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
// swiftlint:enable all
// swiftformat:enable all
