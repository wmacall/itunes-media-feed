// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// What do you\nwant to search?
  internal static let homeHeaderTitle = L10n.tr("Localizable", "homeHeaderTitle")
  /// Try adjusting your search to find what you are looking for
  internal static let searchEmptyStateSubtitle = L10n.tr("Localizable", "searchEmptyStateSubtitle")
  /// No results found
  internal static let searchEmptyStateTitle = L10n.tr("Localizable", "searchEmptyStateTitle")
  /// Section Placeholder
  internal static let sectionTitlePlaceholder = L10n.tr("Localizable", "sectionTitlePlaceholder")
  /// All
  internal static let seeAll = L10n.tr("Localizable", "seeAll")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
