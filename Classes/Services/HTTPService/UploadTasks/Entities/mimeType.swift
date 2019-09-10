

import Foundation


public enum mimeType: String {
    case pngImage = "image/png"
    case jpgImage = "image/jpeg"
    
    var extention: String {
        switch self {
        case .jpgImage:
            return ".jpg"
        case .pngImage:
            return ".png"
        }
    }
}
