

import UIKit


public extension UIImageView {

    func removeFromCache(urlString: String){
        
        guard let imageUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        let imageCache = NSCache<NSString, UIImage>()
        imageCache.removeObject(forKey: imageUrlString as NSString)
    }


}
