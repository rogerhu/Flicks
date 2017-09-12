//
//  MovieService.swift
//  MovieDemo
//
//  Created by hsherchan on 9/12/17.
//  Copyright © 2017 Hearsay. All rights reserved.
//
import UIKit
import Foundation

private let imageBaseUrl:String = "https://image.tmdb.org/t/p/w342"
private let baseUrl:String = "https://api.themoviedb.org/3/movie/"
private let apiKey:String = "a07e22bc18f5cb106bfe4cc1f83ad8ed"

class MovieService {
    
    class func fetch(endPoint: String, successCallBack: @escaping (NSDictionary) -> (), errorCallBack: ((Error?) -> ())?) {
        let url = URL(string: "\(baseUrl)\(endPoint)?api_key=\(apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                errorCallBack?(error)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                successCallBack(dataDictionary)
            }
        }
        task.resume()
    }
    
    class func getImageUrl(path: String) -> URL {
        let fullUrl = "\(imageBaseUrl)\(path)"
        return URL(string: fullUrl)!
        
    }
    
}
