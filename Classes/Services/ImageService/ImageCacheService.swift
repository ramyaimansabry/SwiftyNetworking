

import UIKit


class ImageCacheService: NSObject {
    
    class func deleteAllImageCache(){
        let imageCache = NSCache<NSString, UIImage>()
        imageCache.removeAllObjects()
    }
    
    
    class func deleteImageCache(urlString: String){
        guard let imageUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            else { return }
        let imageCache = NSCache<NSString, UIImage>()
        imageCache.removeObject(forKey: imageUrlString as NSString)
    }
    
    
    
    
}
