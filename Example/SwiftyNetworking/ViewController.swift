//
//  ViewController.swift
//  SwiftyNetworking
//
//  Created by ramysabry22 on 09/10/2019.
//  Copyright (c) 2019 ramysabry22. All rights reserved.
//

import UIKit
import SwiftyNetworking

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func DownloadImageButtonAction(_ sender: UIButton) {
        downloadImage()
    }
    
    @IBAction func fetchDataButtonAction(_ sender: UIButton) {
        fetchData()
    }
    
    
    // MARK:- Download Image Examples
    /**************************************************************************************/
    
    //MARK:- Download image & cache it with custom indicator color
    func downloadImage_CustomLoadingIndicatorColor(){
        imageView.downloadImage(urlString: "https://images.unsplash.com/photo-1515627909249-5a98b247c9f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80", loadingIndicator: true, IndicatorColor: UIColor.red) { (Error) in
            if let error = Error {
                print(error.localizedDescription)
            }
        }
    }
    
    
     //MARK:- Download image & cache it with defualt indicator color
    func downloadImage_DefualtLoadingIndicator(){
        imageView.downloadImage(urlString: "https://images.unsplash.com/photo-1515627909249-5a98b247c9f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80", loadingIndicator: true) { (Error) in
            if let error = Error {
                print(error.localizedDescription)
            }
        }
    }
    
    
     //MARK:- Download image & cache it - Retursn downloaded image
    func downloadImage(){
        let tempImage = UIImageView()
        tempImage.downloadImage(urlString: "https://images.unsplash.com/photo-1515627909249-5a98b247c9f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80") { (downloadedImage, Error) in
            
            if let error = Error {
                print(error.localizedDescription)
                return
            }
            // Do what you want with the downloaded image
        }
    }
    
    
    
    
    
    // MARK:- Delete Image Cache Examples
    /**************************************************************************************/
    
    //MARK:- Deletes specefic image cache
    func deleteImageCache(){
        SwiftyNetworking.deleteImageCache(urlString: "https://images.unsplash.com/photo-1515627909249-5a98b247c9f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80")
    }
    
    //MARK:- Delete all cached images
    func deleteAllImagesCache(){
        SwiftyNetworking.deleteAllImageCache()
    }
    
    
    
    
    // MARK:- Delete Image Cache Examples
    /**************************************************************************************/
    
     //MARK:- Upload image/images as multipart with parameters
    func uploadImage(){
        let uploadURL = URL(string: "https://api.imgur.com/3/image")
        let headers: [String: String] = [
            "Authorization": "Client-ID 341be54e0da4496"
        ]
        let parameters: [String: Any] = [
            "name": "nonooo",
            "description": "uploading test image"
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
    }
    
    
    
    
    
    // MARK:- HTTP Requests Exaples
    /**************************************************************************************/
    
    //MARK:- Fetch data with model object in return & error Model
    func fetchData(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
        let parameters = UserRequiredInfoModel(ID: 112239, Status: false)
        
        SwiftyNetworking.requestModelResponse(URL: url!, Parameters: parameters, Headers: nil, HTTPMethod: .get) { (result: ModelResult<UserModel,CommonErrorModel>, statusCode) in
            
            switch result {
            case .success(let user):
                print(user.title)
                
            case .catchError(let errorModel):
                print(errorModel)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    //MARK:- Fetch data with JSON in return
    func fetchDataWithJSONresponse(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
        SwiftyNetworking.requestJsonResponse(URL: url!, Headers: nil, HTTPMethod: .get) { (result, statusCode) in
            switch result {
            case .success(let jsonResponse):
                print(jsonResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    //MARK:- Fetch data with Data in return
    func fetchDataWithDATAresponse(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
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
    }

    
 
    
    
}






