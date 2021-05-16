//

import SwiftUI

struct EpisodeView: View {
    @Binding var shouldPopToRootView : Bool
    @Binding var episode: EpisodeModel
    @StateObject var model = Characters()
    var network = Network()
    
    var body: some View {
        VStack {
            Text("\(Labels.name) \(episode.name)")
                .onAppear(perform: refresh)
            Text("\(Labels.episodeNumber) \(episode.episode)")
            Text("\(Labels.airDate) \(episode.airDate)")
            let characters: [CharacterModel] = model.characters.filter { episode.characters.contains($0.id)}
            Section(header: Text("\(Labels.characterAppearance)")) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                    Divider()
                    ForEach(characters){ character in
                        NavigationLink(destination: CharacterFullBioView(rootIsActive: $shouldPopToRootView, character: .constant(character))){
                            HStack {
                            CharacterListItemView(character: .constant(character))
                                .padding(.leading)
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .padding(.trailing)
                            }
                       
                        }.isDetailLink(false)
                        .foregroundColor(Color.primary)
                        Divider()
                     }
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing:
                    Button(action: {
                        shouldPopToRootView = false
                    }){
                        Text(Labels.mainManu)
                    })
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
