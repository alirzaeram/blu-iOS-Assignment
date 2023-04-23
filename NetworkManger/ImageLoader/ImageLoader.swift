//
//  ImageLoader.swift
//  NetworkManger
//
//  Created by Philip Eram on 4/24/23.
//

import UIKit

public class ImageLoader {
    
    // Create a cache to store downloaded images
    static let cache = NSCache<NSString, UIImage>()
    
    // Load an image from a remote URL and call a completion handler with the result
    static public func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        
        // Check if the image is already in the cache
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
            return
        }
        
        // If not, download the image from the URL
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Handle errors
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            // Convert the data to an image
            let image = UIImage(data: data)
            
            // Cache the image
            cache.setObject(image!, forKey: url.absoluteString as NSString)
            
            // Call the completion handler with the image
            completion(image)
        }.resume()
    }
    
}
