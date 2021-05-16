//

import Foundation

struct CharacterPage: Decodable, Pageable {
    typealias results = [CharacterModel]
    var results: [CharacterModel]
    var info: InfoModel

    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}
