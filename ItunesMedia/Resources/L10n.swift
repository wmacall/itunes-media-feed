// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// Description
  internal static let descriptionTitle = L10n.tr("Localizable", "descriptionTitle")
  /// Ebooks
  internal static let ebooksSectionTitle = L10n.tr("Localizable", "ebooksSectionTitle")
  /// %@ %@
  internal static func genreList(_ p1: String, _ p2: String) -> String {
    return L10n.tr("Localizable", "genreList", p1, p2)
  }
  /// Genres
  internal static let genresTitle = L10n.tr("Localizable", "genresTitle")
  /// Genre
  internal static let genreTitle = L10n.tr("Localizable", "genreTitle")
  /// What do you\nwant to search?
  internal static let homeHeaderTitle = L10n.tr("Localizable", "homeHeaderTitle")
  /// Movies
  internal static let moviesSectionTitle = L10n.tr("Localizable", "moviesSectionTitle")
  /// Podcasts
  internal static let podcastSectionTitle = L10n.tr("Localizable", "podcastSectionTitle")
  /// Try adjusting your search to find what you are looking for
  internal static let searchEmptyStateSubtitle = L10n.tr("Localizable", "searchEmptyStateSubtitle")
  /// No results found
  internal static let searchEmptyStateTitle = L10n.tr("Localizable", "searchEmptyStateTitle")
  /// Section Placeholder
  internal static let sectionTitlePlaceholder = L10n.tr("Localizable", "sectionTitlePlaceholder")
  /// All
  internal static let seeAll = L10n.tr("Localizable", "seeAll")
  /// Shows
  internal static let showsSectionTitle = L10n.tr("Localizable", "showsSectionTitle")
  /// Songs
  internal static let songsSectionTitle = L10n.tr("Localizable", "songsSectionTitle")
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
