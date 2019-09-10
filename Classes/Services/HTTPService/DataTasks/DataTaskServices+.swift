

import UIKit

extension DataTaskServices {
    
    class func requestJsonResponse<T: Codable>(URL: URL, Parameters: T, Headers: [String: String]?, HTTPMethod: HTTPMethod                                                                                                                                                                                                                    ,_ handler: @escaping( Result<Any> ,_ StatusCode: Int) -> ()) {
        
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
                do{
                    
                    let jsonResponse = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                    print("**************** Response *************** \n")
                    print(jsonResponse)
                    DispatchQueue.main.async {
                        handler(.success(jsonResponse),statusCode)
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                    }
                }catch (let error){
                    DispatchQueue.main.async {
                        handler(.failure(error),statusCode)
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                    }
                }
            }
        }.resume()
    }
    
    
    
    
    
    
    
    class func requestJsonResponse(URL: URL, Headers: [String: String]?, HTTPMethod: HTTPMethod                                                                                                                                                                                                                    ,_ handler: @escaping( Result<Any> ,_ StatusCode: Int) -> ()) {
        
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
                do{
                    let jsonResponse1 = try JSONSerialization.jsonObject(with: data)
                    let jsonResponse = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                    print("**************** Response *************** \n")
                    print(jsonResponse1)
                    DispatchQueue.main.async {
                        handler(.success(jsonResponse),statusCode)
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                    }
                }catch (let error){
                    DispatchQueue.main.async {
                        handler(.failure(error),statusCode)
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                    }
                }
            }
        }.resume()
    }
    
    
    
}

