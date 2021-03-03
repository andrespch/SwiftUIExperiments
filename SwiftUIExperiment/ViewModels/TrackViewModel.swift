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
            .autoconnect()
            .map { [weak self] time in
                self?.dateFormatter.string(from: time) ?? "nothing"
            }.sink(receiveValue: { [weak self] value in
                self?.title = value
            })
    }
    
    deinit {
        print("trackViewModel deinit")
    }
}
