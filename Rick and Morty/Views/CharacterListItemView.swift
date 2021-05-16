//

import SwiftUI

struct CharacterListItemView: View {
    @Binding var character: CharacterModel
    var body: some View {
        VStack (alignment: .leading){
            Text("\(character.name)" )
            Text("origin: \(character.origin.name)")
        }
    }
}

/*struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}*/
