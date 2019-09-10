
import UIKit


public struct Media {
    let key: String
    let filename: String
    let data: Data
    let mimeType: String
    
   public init?(withImage image: UIImage, imageName: String, forKey key: String, mimeType: mimeType, withCompression value: CGFloat) {
        self.key = key
        self.mimeType = mimeType.rawValue
        self.filename = imageName + mimeType.extention
        
        if mimeType == .jpgImage {
            guard let jpegData = image.jpegData(compressionQuality: value) else { return nil }
            self.data = jpegData
        } else {
            guard let pngData = image.pngData() else { return nil }
            self.data = pngData
        }
        
    }
    
}
