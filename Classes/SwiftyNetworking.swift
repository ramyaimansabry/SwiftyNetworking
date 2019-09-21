

import Foundation


public class SwiftyNetworking: NSObject {
    
    override private init(){
        super.init()
    }
    
    //MARK:- One Model Requests
    /**************************************************************************/
    
    ///   Returns targeted object from json response request as model
    /// - parameter URL: Request URL
    /// - parameter Parameters: T whitch is generic model that confirms to codable
    /// - parameter Headers: Optional [String: String] dictionary
    /// - parameter HTTPMethod: Enum HTTP methods
    /// - Returns: Result type of U, whre U is response model & status code
    public class func requestModelResponse<T: Codable, U: Codable>(URL: URL, Parameters: T, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( _ result: Result<U>,_ StatusCode: Int) -> ()) {
        
        DataTaskServices.requestJsonModel(URL: URL, Parameters: Parameters, Headers: Headers, HTTPMethod: HTTPMethod) { (result: Result<U>, statusCode) in
            handler(result, statusCode)
        }
    }
    ///   Returns targeted object from json response request as model
    /// - parameter URL: Request URL
    /// - parameter Headers: Optional [String: String] dictionary
    /// - parameter HTTPMethod: Enum HTTP methods
    /// - Returns: Result type of U, whre U is response model & status code
    public class func requestModelResponse<U: Codable>(URL: URL, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( _ result: Result<U>,_ StatusCode: Int) -> ()) {
        
        DataTaskServices.requestJsonModel(URL: URL, Headers: Headers, HTTPMethod: HTTPMethod) { (result: Result<U>, statusCode) in
            handler(result, statusCode)
        }
    }
    
    
    
    
    
    //MARK:- Two Model Requests
    /**************************************************************************/
    
    ///   Returns targeted object from json response request as model
    /// - parameter URL: Request URL
    /// - parameter Parameters: T whitch is generic model that confirms to codable
    /// - parameter Headers: Optional [String: String] dictionary
    /// - parameter HTTPMethod: Enum HTTP methods
    /// - Returns: ModelResult type of U,E, whre U is response model & E is error model & status code
    public class func requestModelResponse<T: Codable, U: Codable, E: Codable>(URL: URL, Parameters: T, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( _ result: ModelResult<U,E>,_ StatusCode: Int) -> ()) {
        
        DataTaskServices.requestJsonModel(URL: URL, Parameters: Parameters, Headers: Headers, HTTPMethod: HTTPMethod) { (result: ModelResult<U,E>, statusCode) in
            handler(result, statusCode)
        }
    }
    ///   Returns targeted object from json response request as model
    /// - parameter URL: Request URL
    /// - parameter Headers: Optional [String: String] dictionary
    /// - parameter HTTPMethod: Enum HTTP methods
    /// - Returns: ModelResult type of U,E, whre U is response model & E is error model & status code
    public class func requestModelResponse<U: Codable, E: Codable>(URL: URL, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( _ result: ModelResult<U,E>,_ StatusCode: Int) -> ()) {
        
        DataTaskServices.requestJsonModel(URL: URL, Headers: Headers, HTTPMethod: HTTPMethod) { (result: ModelResult<U,E>, statusCode) in
            handler(result, statusCode)
        }
    }
    
    
    
    
    
    
    //MARK:- JSON Requests
    /**************************************************************************/
    
    ///   Returns json response from HTTP request
    /// - parameter URL: Request URL
    /// - parameter Parameters: T whitch is generic model that confirms to codable
    /// - parameter Headers: Optional [String: String] dictionary
    /// - parameter HTTPMethod: Enum HTTP methods
    /// - Returns: Result type of success with json response or failure and status code
    public class func requestJsonResponse<T: Codable>(URL: URL, Parameters: T, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( Result<Any>,_ StatusCode: Int ) -> ()) {
        
        DataTaskServices.requestJsonResponse(URL: URL, Parameters: Parameters, Headers: Headers, HTTPMethod: HTTPMethod) { (result, statusCode: Int) in
            handler(result, statusCode)
        }
    }
    ///   Returns json response from HTTP request
    /// - parameter URL: Request URL
    /// - parameter Headers: Optional [String: String] dictionary
    /// - parameter HTTPMethod: Enum HTTP methods
    /// - Returns: Result type of success with json response or failure and status code
    public class func requestJsonResponse(URL: URL, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( Result<Any>,_ StatusCode: Int ) -> ()) {
        
        DataTaskServices.requestJsonResponse(URL: URL, Headers: Headers, HTTPMethod: HTTPMethod) { (result, statusCode: Int) in
            handler(result, statusCode)
        }
    }
    
    
    
    
    
    
    //MARK:- Data Requests
    /**************************************************************************/
    
    ///   Returns data response from HTTP request
    /// - parameter URL: Request URL
    /// - parameter Parameters: T whitch is generic model that confirms to codable
    /// - parameter Headers: Optional [String: String] dictionary
    /// - parameter HTTPMethod: Enum HTTP methods
    /// - Returns: Result type of success with data response or failure and status code
    public class func requestDataResponse<T: Codable>(URL: URL, Parameters: T, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( DataResult<Any>,_ statusCode: Int ) -> ()) {
        
        DataTaskServices.requestDataResponse(URL: URL, Parameters: Parameters, Headers: Headers, HTTPMethod: HTTPMethod) { (result, statusCode) in
            handler(result, statusCode)
        }
    }
    ///   Returns data response from HTTP request
    /// - parameter URL: Request URL
    /// - parameter Headers: Optional [String: String] dictionary
    /// - parameter HTTPMethod: Enum HTTP methods
    /// - Returns: Result type of success with data response or failure and status code
    public class func requestDataResponse(URL: URL, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( DataResult<Any>,_ statusCode: Int ) -> ()) {
        
        DataTaskServices.requestDataResponse(URL: URL, Headers: Headers, HTTPMethod: HTTPMethod) { (result, statusCode) in
            handler(result, statusCode)
        }
    }
    
    
    
    
    
}
