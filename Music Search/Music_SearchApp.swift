//
//  Music_SearchApp.swift
//  Music Search
//
//  Created by Britone Mwasaru on 25/01/2021.
//

import SwiftUI

@main
struct Music_SearchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: SongListViewModel())
        }
    }
}
