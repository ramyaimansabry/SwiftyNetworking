# SwiftyNetworking

[![CI Status](https://img.shields.io/travis/ramysabry22/SwiftyNetworking.svg?style=flat)](https://travis-ci.org/ramysabry22/SwiftyNetworking)
[![Version](https://img.shields.io/cocoapods/v/SwiftyNetworking.svg?style=flat)](https://cocoapods.org/pods/SwiftyNetworking)
[![License](https://img.shields.io/cocoapods/l/SwiftyNetworking.svg?style=flat)](https://cocoapods.org/pods/SwiftyNetworking)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyNetworking.svg?style=flat)](https://cocoapods.org/pods/SwiftyNetworking)

## Features
- [x] Direct targeted model object decoding
- [x] Passing parameters as model
- [x] Uploading jpg/png images as MultipartFormData
- [x] Instance download image with direct cache cabability
- [x] Download file as data download request
- [x] HTTP Response Validation
- [x] Network Reachability
- [x] Singleton Free
- [x] Backgorund Tasks


## Requirements
- iOS 11+
- Xcode 10.1+
- Swift 4.2+


## Installation
### CocoaPods
SwiftyNetworking is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:


```ruby
pod 'SwiftyNetworking'
```

## HTTP Requests Examples
To run the example project, clone the repo, and run `pod install` from the Example directory first.
####Data Request - Returns model object
```swift
// Targeted model object
    struct UserModel: Codable {
        let userId: Float
        let id: Float
        let title: String
        let completed: Bool
    }
```

```swift
// Error targeted model object
    struct CommonErrorModel: Codable {
        let message: String
        let error: Error
    }
```

```swift
// Request
let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
let headers: [String: Any] = ["Authorization": "76GTLYj8j2"]
// headers are optional

    SwiftyNetworking.requestModelResponse(URL: url!, Headers: headers, HTTPMethod: .get) { (result: ModelResult<UserModel,CommonErrorModel>, statusCode) in

        switch result {
        case .success(let user):
            print(user.title)

        case .catchError(let errorModel):
            print(errorModel)

        case .failure(let error):
            print(error.localizedDescription)
        }
    }
```

####Data Request - With Parameters - Returns model object
```swift
// Parameters model
    struct UserRequiredInfoModel: Codable{
        let Id: Int
        let status: Bool

        init(ID: Int, Status: Bool){
            self.Id = ID
            self.status = Status
        }
    }
```

```swift
// Request
let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
let parameters = UserRequiredInfoModel(ID: 112239, Status: false)
let headers: [String: Any] = ["Authorization": "76GTLYj8j2"]
// headers are optional

    SwiftyNetworking.requestModelResponse(URL: url!, Parameters: parameters, Headers: headers, HTTPMethod: .get) { (result: ModelResult<UserModel,CommonErrorModel>, statusCode) in

        switch result {
        case .success(let user):
            print(user.title)

        case .catchError(let errorModel):
            print(errorModel)

        case .failure(let error):
            print(error.localizedDescription)
        }
    }
```

####Data Request - Returns JSON
```swift
let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
let headers: [String: Any] = ["Authorization": "76GTLYj8j2"]
// headers are optional

    SwiftyNetworking.requestJsonResponse(URL: url!, Headers: headers, HTTPMethod: .get) { (result, statusCode) in
        switch result {
        case .success(let jsonResponse):
            print(jsonResponse)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
```

####Data Request -  Returns data as Data
```swift
    SwiftyNetworking.requestDataResponse(URL: url!, Headers: nil, HTTPMethod: .get) { (result, statusCode) in

        switch result {
        case .success(let data):
        // Do whatever you want
            print(data)
            return
        case .failure(let error):
            print(error)
        }
    }
```

## Download Image Examples

####Download Image with Caching - Loading Indicator On
```swift
// loading indicator - Defualt color
    imageView.downloadImage(urlString: "https://images.unsplash.com/photo-1515627909249-5a98b247c9f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80", loadingIndicator: true) { (Error) in
        if let error = Error {
            print(error.localizedDescription)
        }
    }

// loading indicator - Custom color
    imageView.downloadImage(urlString: "https://images.unsplash.com/photo-1515627909249-5a98b247c9f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80", loadingIndicator: true, IndicatorColor: UIColor.red) { (Error) in
        if let error = Error {
            print(error.localizedDescription)
        }
    }
```


####Download Image - Returns downloaded image
```swift
    let tempImage = UIImageView()
    tempImage.downloadImage(urlString: "https://images.unsplash.com/photo-1515627909249-5a98b247c9f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80") { (downloadedImage, Error) in

        if let error = Error {
            print(error.localizedDescription)
            return
        }

        // Do what you want with the downloaded image
    }
```

####Delete Image Cache
```swift
// Delete image cache
    SwiftyNetworking.deleteImageCache(urlString: "https://images.unsplash.com/photo-1515627909249-5a98b247c9f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80")

// Delete all cached images
    SwiftyNetworking.deleteAllImageCache()
```


## Upload Image Example

####Upload Image as MultipartFormData
```swift
let uploadURL = URL(string: "https://api.imgur.com/3/image")
let headers: [String: String] = [
    "Authorization": "Client-ID 341be54e0da4496"
]
// headers are optional

let parameters: [String: Any] = [
    "name": "Image1",
    "description": "Photo Image"
]

let media = Media(withImage: UIImage(named: "PhoneICON")!, imageName: "ramy", forKey: "image", mimeType: .pngImage, withCompression: 1)

SwiftyNetworking.uploadImageWithJsonResponse(Images: [media!], URL: uploadURL!, Parameters: parameters, Headers: headers) { (result, statusCode) in

    switch result {
    case .success(let jsonResult):
        print(jsonResult)
        print(statusCode)
        return
    case .failure(let error):
        print(error)
        print(statusCode)
        return
    }
}

```


## Author

ramysabry22, ramysabry1996@gmail.com

## License

SwiftyNetworking is available under the MIT license. See the LICENSE file for more info.
