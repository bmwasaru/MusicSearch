//
//  ArtworkLoader.swift
//  Music Search
//
//  Created by Britone Mwasaru on 25/01/2021.
//

import Foundation
import SwiftUI

class ArtworkLoader {
    private var dataTasks: [URLSessionDataTask] = []
    
    func loadArtwork(forSong song: Song, competion: @escaping((Image?) -> Void)) {
        guard let imageUrl = URL(string: song.artworkUrl) else {
            competion(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
            guard let data = data, let artwork = UIImage(data: data) else {
                competion(nil)
                return
            }
            
            let image = Image(uiImage: artwork)
            competion(image)
        }
        dataTasks.append(dataTask)
        dataTask.resume()
    }
    
    func reset() {
        dataTasks.forEach{ $0.cancel() }
    }
}
