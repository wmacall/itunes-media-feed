//
//  K.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Moya
import Nuke

// swiftlint:disable:next type_name
enum K {

    // MARK: - Networking

    enum Networking {
        // swiftlint:disable:next force_unwrapping
        static let baseURl = URL(string: "https://itunes.apple.com")!
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

}
