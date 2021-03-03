import SwiftUI
import Combine

class TrackViewModel: ObservableObject {
    private let track: Track
    @Published var title: String = ""
    private let dateFormatter: DateFormatter
    private var cancellable: Cancellable?
    
    init(track: Track,
         dateFormatter: DateFormatter) {
        self.track = track
        self.dateFormatter = dateFormatter
        
        if let date = track.releaseDate {
            self.title = dateFormatter.string(from: date)
        }
        
        cancellable = Timer.publish(every: 1, on: .main, in: .default)
//            .autoconnect()
            .map { [weak self] time in
                self?.dateFormatter.string(from: time) ?? "nothing"
            }
            .assign(to: \.title, on: self)
    }
    
    deinit {
        print("deinit track view model")
    }
}
