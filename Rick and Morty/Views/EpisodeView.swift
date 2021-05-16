//

import SwiftUI

struct EpisodeView: View {
    @Binding var episode: EpisodeModel
    @StateObject var model = Characters()
    var network = Network()
    
    var body: some View {
        VStack {
            Text("Name: \(episode.name)")
            Text("Episode: \(episode.episode)")
            Text("Air Date: \(episode.airDate)")
            let characters: [CharacterModel] = model.characters.filter { episode.characters.contains($0.id)}
            List {
                Section(header: Text("Characters")) {
                    ForEach(characters){ character in
                        NavigationLink(destination: CharacterFullBioView(character: .constant(character))) {
                            CharacterListItemView(character: .constant(character))
                         }
                     }
                }
            }
        }.onAppear(perform: refresh)
    }
    
    func refresh() {
        if model.characters.isEmpty {
           network.requestAllCharacters { (result) in
                switch result {
                    case .failure(let error):
                        print(error.localizedDescription)
                   
                    case .success(let characterInfo):
                    self.model.characters.append(contentsOf: characterInfo.results)
                }
            }
        }
    }
}

/*struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}*/
