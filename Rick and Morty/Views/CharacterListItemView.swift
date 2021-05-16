//

import SwiftUI

struct CharacterListItemView: View {
    @Binding var character: CharacterModel
    var body: some View {
        VStack (alignment: .leading){
            Text("\(character.name)" )
            Text("\(Labels.origin) \(character.origin.name)")
        }
    }
}
