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

struct CharacterPage: Decodable, Pageable {
    typealias results = [CharacterModel]
    var results: [CharacterModel]
    var info: InfoModel

    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}
/*extension CharacterModel: Displayable {
    var titleLabelText: String {
        "Name: \(name) -  \(origin.name)"
    }
    var subtitleLabelText: String {
        "More to come..."
    }
}*/
