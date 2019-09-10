

import UIKit


public extension UIImageView {
    
    ///   Download image form url and cashe it
    /// - parameter urlString: Request URL as string
    /// - parameter loadingIndicator: shows ring indicator in image center when downloading
    /// - parameter IndicatorColor: Optional color of loading indicator, by defualt gray color
    /// - Returns: set downloaded image & error if request fails
    /// - Note: URL string by defualt allows url Query in url
    func downloadImage(urlString: String, loadingIndicator: Bool = false, IndicatorColor: UIColor = UIColor.gray, completion: @escaping (_ error: Error? ) -> Void) {
        
        guard let imageUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let url = URL(string: imageUrlString) else { return }
        let imageCache = NSCache<NSString, UIImage>()

        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            DispatchQueue.main.async {
                self.image = cachedImage
                completion(nil)
                return
            }
        } else {
            let activityView = UIActivityIndicatorView(frame: CGRect(x: (self.bounds.width-12.5) / 2, y: (self.bounds.height-12.5) / 2, width: 25, height: 25))
            
            activityView.backgroundColor = UIColor.clear
            activityView.color = IndicatorColor
            self.addSubview(activityView)
            
            if loadingIndicator {
                DispatchQueue.main.async {
                    activityView.startAnimating()
                }
            }
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if loadingIndicator {
                    DispatchQueue.main.async {
                        activityView.stopAnimating()
                        activityView.removeFromSuperview()
                    }
                }
                
                if let error = error {
                    completion(error)
                    
                } else if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    DispatchQueue.main.async {
                        self.image = image
                        completion(nil)
                    }
                    
                } else {
                    completion(error)
                }
                
            }).resume()
        }
    }
    
    
    
    
    ///   Download image form url and cashe it
    /// - parameter urlString: Request URL as string
    /// - Returns: Downloaded image as UIImage & error if request fails
    /// - Note: URL string by defualt allows url Query in url
    func downloadImage(urlString: String, completion: @escaping (_ Image: UIImage? ,_ error: Error? ) -> Void) {
        
        guard let imageUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let url = URL(string: imageUrlString) else { return }
        let imageCache = NSCache<NSString, UIImage>()
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            DispatchQueue.main.async {
                self.image = cachedImage
                completion(cachedImage,nil)
            }
        } else {
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error {
                    completion(nil,error)
                    
                } else if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    
                  
                    
                    DispatchQueue.main.async {
                        self.image = image
                        completion(image,nil)
                    }
                    
                } else {
                    completion(nil,error)
                }
                
            }).resume()
        }
    }
    
}



