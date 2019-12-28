//
//  K.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit
import Nuke
import Moya

// swiftlint:disable:next type_name
enum K {
    
    // MARK: - Networking
    
    enum Networking {
        // swiftlint:disable:next force_unwrapping
        static let baseURl = URL(string: "https://itunes.apple.com")!
        
        enum Pagination {
            static let itemsPerPage = 25
        }
    }
    
    // MARK: - Moya
    
    enum Moya {
        static let plugins: [PluginType] = [NetworkLoggerPlugin()]
    }
    
    // MARK: - Nuke
    
    enum Nuke {
        static let options = ImageLoadingOptions(
            placeholder: R.Base.placeholder.image,
            transition: .fadeIn(duration: 0.33)
        )
    }
    
    // MARK: - Components
    
    enum Components {
        enum Feed {
            static let headerViewHeight: CGFloat = 200
            static let sectionHeaderViewHeight: CGFloat = 60
            static let horizontalSectionHeight: CGFloat = 250
        }
    }
    
}
