

import UIKit

extension DataTaskServices {

    class func requestDataResponse<T: Codable>(URL: URL, Parameters: T, Headers: [String: String]?, HTTPMethod: HTTPMethod                                                                                                                                                                                                                    ,_ handler: @escaping( DataResult<Any>,_ StatusCode: Int ) -> ()) {
        
        var statusCode: Int = 0
        
        let backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
        let session: URLSession = URLSession(configuration: .default)
        var request: URLRequest = URLRequest(url: URL)
        request.httpMethod = HTTPMethod.rawValue
        
        if let headers = Headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        do {
            let jsonData = try JSONEncoder().encode(Parameters)
            let todoJSdON = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
            let httpBody = try JSONSerialization.data(withJSONObject: todoJSdON, options: [])
            request.httpBody = httpBody
        }catch (let error){
            handler(.failure(error),statusCode)
        }
   
        
        session.dataTask(with: request) {(data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                statusCode = httpResponse.statusCode
            }
            if let error = error {
                DispatchQueue.main.async {
                    handler(.failure(error),statusCode)
                    UIApplication.shared.endBackgroundTask(backgroundTaskID)
                }
            }
            if let data = data {
                DispatchQueue.main.async {
                    handler(.success(data),statusCode)
                    UIApplication.shared.endBackgroundTask(backgroundTaskID)
                }
            }
        }.resume()
    }
    
    
    
    
    
    
    
    class func requestDataResponse(URL: URL, Headers: [String: String]?, HTTPMethod: HTTPMethod                                                                                                                                                                                                                    ,_ handler: @escaping( DataResult<Any>,_ StatusCode: Int ) -> ()) {
        
        var statusCode: Int = 0
        
        let backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
        let session: URLSession = URLSession(configuration: .default)
        var request: URLRequest = URLRequest(url: URL)
        request.httpMethod = HTTPMethod.rawValue
        request.httpBody = nil
        
        if let headers = Headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        session.dataTask(with: request) {(data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                statusCode = httpResponse.statusCode
            }
            if let error = error {
                DispatchQueue.main.async {
                    handler(.failure(error),statusCode)
                    UIApplication.shared.endBackgroundTask(backgroundTaskID)
                }
            }
            if let data = data {
                DispatchQueue.main.async {
                    handler(.success(data),statusCode)
                    UIApplication.shared.endBackgroundTask(backgroundTaskID)
                }
            }
        }.resume()
    }


}
