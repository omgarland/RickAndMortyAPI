//

import SwiftUI

struct LocationView: View {
    @Binding var location: LocationModel
    var body: some View {
        VStack {
            Text("Name: \(location.name)")
            Text("Dimension: \(location.dimension)")
            Text("Type: \(location.type)")
        }
    }
}
