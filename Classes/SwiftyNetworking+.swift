
import Foundation


extension SwiftyNetworking {
    
    
    //MARK:- String Requests
    /**************************************************************************/
    
    ///   Returns string response from HTTP request
    /// - parameter URL: Request URL
    /// - parameter Parameters: T whitch is generic model that confirms to codable
    /// - parameter Headers: Optional [String: String] dictionary
    /// - parameter HTTPMethod: Enum HTTP methods
    /// - Returns: Result type of success with string response or failure and status code
    public class func requestStringResponse<T: Codable>(URL: URL, Parameters: T, Headers: [String: String]?, HTTPMethod: HTTPMethod                                                                                                                                                                                                                    ,_ handler: @escaping( Result<Any>,_ statusCode: Int) -> ()) {
        
        DataTaskServices.requestStringResponse(URL: URL, Parameters: Parameters, Headers: Headers, HTTPMethod: HTTPMethod) { (result, statusCode) in
            handler(result, statusCode)
        }
    }
    ///  returns string response from HTTP request
    /// - parameter URL: Request URL
    /// - parameter Headers: Optional [String: String] dictionary
    /// - parameter HTTPMethod: Enum HTTP methods
    /// - Returns: Result type of success with string response or failure and status code
    public class func requestStringResponse(URL: URL, Headers: [String: String]?, HTTPMethod: HTTPMethod                                                                                                                                                                                                                    ,_ handler: @escaping( Result<Any>,_ statusCode: Int) -> ()) {
        
        DataTaskServices.requestStringResponse(URL: URL, Headers: Headers, HTTPMethod: HTTPMethod) { (result, statusCode) in
            handler(result, statusCode)
        }
    }
    
    
    
    
    
    
    
    
    //MARK:- Image Requests
    /**************************************************************************/
    
    ///   Upload image as multipart form data
    /// - parameter Images: Array of Media model
    /// - parameter URL: Upload URL as string
    /// - parameter Parameters: [String: Any] Dictionary
    /// - parameter Headers: Optional [String: String] Dictionary
    /// - Returns: Result type of success with json response or failure & status code
    /// - Note: Media accepts png & jpg types of images only
    public class func uploadImageWithJsonResponse(Images: [Media], URL: URL, Parameters: [String: Any], Headers: [String: String]?                                                                                                                                                                                                                 ,_ handler: @escaping( Result<Any>,_ StatusCode: Int ) -> ()) {
        
        UploadTaskServices.uploadImageWithJsonResponse(Images: Images, URL: URL, Parameters: Parameters, Headers: Headers) { (result, statusCode) in
            handler(result,statusCode)
        }
    }
    
    
    /// deletes all cache
    /// - Note: this function deletes cache for images only
    public class func deleteAllImageCache(){
        ImageCacheService.deleteAllImageCache()
    }
    
    /// delete image cache for spcefic image string url
    /// - Note: this function deletes cache for images only
    public class func deleteImageCache(urlString: String){
        ImageCacheService.deleteImageCache(urlString: urlString)
    }
    
    
    
    
    
    
    //MARK:- Reachtability Requests
    /**************************************************************************/
    
    /// func returns if connected to network service or not -> as Bool value
    public class func isConnectedToNetwork() -> Bool {
        if ReachabilityServices.isConnectedToNetwork() { return true }
        else { return false }
    }
    
    
}
