//

import SwiftUI

struct LocationView: View {
    @Binding var location: LocationModel
    var body: some View {
        VStack {
            Text("Name: \(location.name)")
            Text("Dimension: \(location.dimension)")
            Text("Type: \(location.type)")
            //location.residents
            
           // let episodes: [CharacterModel] = episodeModel.episodes.filter{ character.episode.contains($0.id)}
           /* List {
                
                Section(header: Text("Residents")) {
                    ForEach(episodes){ episode in
                        //NavigationLink(destination: EpisodeView(episode:  self.$episodeModel.episodes[item])) {
                        NavigationLink(destination: EpisodeView(episode:  .constant(episode))) {
                            Text(episode.name)
                        }
                    }
                }
            }*/
        }
    }
}



/*struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}*/
