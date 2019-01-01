/*
 * Copyright (c) 2018 Takuma Watanabe.
 */

import Foundation

enum ApplicationURLs: String {
    case googleKeep = "https://keep.google.com/"
    case googleKeepHelp = "https://support.google.com/keep/"
    
    var url: URL {
        return URL(string: self.rawValue)!
    }
}
