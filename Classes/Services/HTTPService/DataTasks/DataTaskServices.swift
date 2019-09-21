
import UIKit

class DataTaskServices: NSObject {
    
    class func requestJsonModel<T: Codable, U: Codable>(URL: URL, Parameters: T, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( _ result: Result<U>, _ StatusCode: Int) -> ()) {
        
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
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    guard let responseDic = jsonResponse as? [String: Any] else {
                        return
                    }
                    print("**************** Response *************** \n")
                    print(jsonResponse)
                    let jsonData = try JSONSerialization.data(withJSONObject: responseDic)
                    let jsonModel = try JSONDecoder().decode(U.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        handler(.success(jsonModel),statusCode)
                        return UIApplication.shared.endBackgroundTask(backgroundTaskID)
                    }
                    
                }catch {
                    DispatchQueue.main.async {
                        handler(.failure(error),statusCode)
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                    }
                }
            }
            
            }.resume()
    }
    
    
    
    
    
    class func requestJsonModel<U: Codable>(URL: URL, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( _ result: Result<U>, _ StatusCode: Int) -> ()) {
        
        var statusCode: Int = 0
        
        let backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
        let session: URLSession = URLSession(configuration: .default)
        var request: URLRequest = URLRequest(url: URL)
        request.httpBody = nil
        request.httpMethod = HTTPMethod.rawValue
        
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
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    guard let responseDic = jsonResponse as? [String: Any] else {
                        return
                    }
                    print("**************** Response *************** \n")
                    print(jsonResponse)
                    let jsonData = try JSONSerialization.data(withJSONObject: responseDic)
                    let jsonModel = try JSONDecoder().decode(U.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        handler(.success(jsonModel),statusCode)
                        return UIApplication.shared.endBackgroundTask(backgroundTaskID)
                    }
                    
                }catch {
                    DispatchQueue.main.async {
                        handler(.failure(error),statusCode)
                        UIApplication.shared.endBackgroundTask(backgroundTaskID)
                    }
                }
            }
            }.resume()
    }
    
    
    
    
    
    
    
    
    class func requestJsonModel<T: Codable, U: Codable, E: Codable>(URL: URL, Parameters: T, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( _ result: ModelResult<U,E>, _ StatusCode: Int) -> ()) {
        
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
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    guard let responseDic = jsonResponse as? [String: Any] else {
                        return
                    }
                    print("**************** Response *************** \n")
                    print(jsonResponse)
                    let jsonData = try JSONSerialization.data(withJSONObject: responseDic)
                    let jsonModel = try JSONDecoder().decode(U.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        handler(.success(jsonModel),statusCode)
                        return UIApplication.shared.endBackgroundTask(backgroundTaskID)
                    }
                    
                }catch {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                        guard let responseDic = jsonResponse as? [String: Any] else {
                            return
                        }
                        let jsonData = try JSONSerialization.data(withJSONObject: responseDic)
                        let jsonErrroModel = try JSONDecoder().decode(E.self, from: jsonData)
                        DispatchQueue.main.async {
                            handler(.catchError(jsonErrroModel),statusCode)
                        }
                        
                    } catch (let error){
                        DispatchQueue.main.async {
                            handler(.failure(error),statusCode)
                            UIApplication.shared.endBackgroundTask(backgroundTaskID)
                        }
                    }
                }
            }
            
            }.resume()
    }
    
    
    
    
    
    class func requestJsonModel<U: Codable, E: Codable>(URL: URL, Headers: [String: String]?, HTTPMethod: HTTPMethod,_ handler: @escaping( _ result: ModelResult<U,E>, _ StatusCode: Int) -> ()) {
        
        var statusCode: Int = 0
        
        let backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
        let session: URLSession = URLSession(configuration: .default)
        var request: URLRequest = URLRequest(url: URL)
        request.httpBody = nil
        request.httpMethod = HTTPMethod.rawValue
        
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
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    guard let responseDic = jsonResponse as? [String: Any] else {
                        return
                    }
                    print("**************** Response *************** \n")
                    print(jsonResponse)
                    let jsonData = try JSONSerialization.data(withJSONObject: responseDic)
                    let jsonModel = try JSONDecoder().decode(U.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        handler(.success(jsonModel),statusCode)
                        return UIApplication.shared.endBackgroundTask(backgroundTaskID)
                    }
                    
                }catch {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                        guard let responseDic = jsonResponse as? [String: Any] else {
                            return
                        }
                        let jsonData = try JSONSerialization.data(withJSONObject: responseDic)
                        let jsonErrroModel = try JSONDecoder().decode(E.self, from: jsonData)
                        DispatchQueue.main.async {
                            handler(.catchError(jsonErrroModel),statusCode)
                        }
                        
                    } catch (let error){
                        DispatchQueue.main.async {
                            handler(.failure(error),statusCode)
                            UIApplication.shared.endBackgroundTask(backgroundTaskID)
                        }
                    }
                }
            }
            }.resume()
    }
    
    
    
    
}
