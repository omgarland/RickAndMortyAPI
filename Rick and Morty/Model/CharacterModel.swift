//

import Foundation
import SwiftUI

struct CharacterModel: Decodable, Identifiable {
    let id: String
    let gender: String
    let image: String
    let name: String
    let status: String
    let species: String
    let origin: Origin
    let episode: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case gender
        case image
        case name
        case episode
        case species
        case status
        case origin
    }
}
struct Origin: Decodable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case name
    }
}



