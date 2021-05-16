//

import SwiftUI

struct ContentView: View {
    @StateObject var model = Characters()
    private var network = NetworkingCombine()
   
    var body: some View {
        NavigationView {
            List {
                ForEach(model.characters){ character in
                    NavigationLink(destination: CharacterFullBio(character: .constant(character))) {
                        CharacterView(character: .constant(character))
                     }
                 }
            }.onAppear(perform: refresh)
        }
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

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
