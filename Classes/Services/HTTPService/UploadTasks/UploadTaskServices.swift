

import UIKit

 public class UploadTaskServices: NSObject {
    
    class func generateBoundary() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    
    public class func uploadImageWithJsonResponse(Images: [Media], URL: URL, Parameters: [String: Any], Headers: [String: String]?                                                                                                                                                                                                                 ,_ handler: @escaping( Result<Any>,_ StatusCode: Int ) -> ()) {
    
        var statusCode: Int = 0
        
        let backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
        let session: URLSession = URLSession.shared
        var request: URLRequest = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        let boundary = self.generateBoundary()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        if let headers = Headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        let lineBreak = "\r\n"
        var body = Data()
        
        for (key, value) in Parameters {
            body.append("--\(boundary + lineBreak)")
            body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
            body.append("\(value)" + "\(lineBreak)")
        }
        
        for photo in Images {
            body.append("--\(boundary + lineBreak)")
            body.append("Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.filename)\"\(lineBreak)")
            body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
            body.append(photo.data)
            body.append(lineBreak)
        }
        
        body.append("--\(boundary)--\(lineBreak)")
        request.httpBody = body
        
        
        session.dataTask(with: request) { (data, response, error) in
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
    
    
    
}



extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
