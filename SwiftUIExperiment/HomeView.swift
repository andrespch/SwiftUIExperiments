import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Second View")) {
                    Text("Helslo, World!")
                }
                NavigationLink(destination: PlaylistView(viewModel: playlistViewModel)) {
                    Text("playlist")
                }
            }
         
        }
    }
    
    var playlistViewModel: PlaylistViewModel {
        PlaylistViewModel(context: viewContext)
    }
}
