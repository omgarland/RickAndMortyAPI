//

import SwiftUI

let explaination: [Explaination] = Bundle.main.decode("ExplainerImages.json")
struct ExplainationView: View {
    var body: some View {
        TabView {
            ForEach(explaination){ item in
                List {
                Image(item.name)
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        Text(item.text)
                            .fontWeight(.bold)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.5))
                        , alignment: .top
                    )
                }.background(Color.clear)
            }//loop
        }//tabView
        .tabViewStyle(PageTabViewStyle())
    }
    
}

/*struct ExplainationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplainationView()
    }
}*/
