//
//  URLImage.swift
//  DownloadImageSwiftUI
//
//  Created by Subhajit Paul on 24/4/2023.
//  Copyright © 2023 Subhajit Paul. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    @ObservedObject private var imageDownloader: ImageDownloader = ImageDownloader()
    
    init(url: String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }
    
    var body: some View {
        
        if let imageData = self.imageDownloader.downloadedData {
            
            let img = UIImage(data: imageData)
            return
                VStack {
                    Image(uiImage: img!).resizable()
            }
            
        } else {
            return VStack {
                Image("placeholder").resizable()
            }
        }
        
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg")
    }
}



