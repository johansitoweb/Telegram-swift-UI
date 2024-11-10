//
//  chatMediaFilterViewModel.swift
//  Telegram
//
//  Created by Arseniy Tkachenko on 09.07.2022.
//

import Foundation

enum ChatMediaFilterViewModel: Int, CaseIterable {
    case media
    case files
    case music
    case voice
    case links
    case gifs
    
    var title: String {
        switch self {
        case .media: return "Media"
        case .files: return "Files"
        case .music: return "Music"
        case .voice: return "Voice"
        case .links: return "Links"
        case .gifs: return "GIFs"
        }
    }
    
}
