//
//  ImageDownloader.swift
//  DownloadImageSwiftUI
//
//  Created by Subhajit Paul on 24/4/2023.
//  Copyright © 2023 Subhajit Paul. All rights reserved.
//

import Foundation

class ImageDownloader: ObservableObject {

    @Published var downloadedData: Data? = nil
    
    func downloadImage(url: String) {
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is incorrect")
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }
    }
    
}
