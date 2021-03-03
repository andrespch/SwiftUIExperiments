import Foundation
import SwiftUI
import CoreData

class PlaylistViewModel: NSObject, ObservableObject {
    private let context: NSManagedObjectContext
    private let controller: NSFetchedResultsController<Track>
    
    @Published var faults: [AnyObject] =  []
        
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()

    
    func trackViewModel(for index: Int) -> TrackViewModel {
        guard let track = controller.fetchedObjects?[index] else {
            preconditionFailure("index out of bounds")
        }
        let viewModel = TrackViewModel(track: track, dateFormatter: dateFormatter)
        return viewModel
    }
    
    private(set) var numberOfTracks: Int = 0
    
    init(context: NSManagedObjectContext) {
        self.context = context
        
        let fetchRequest = NSFetchRequest<Track>(entityName: "Track")
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Track.releaseDate, ascending: true)]
        fetchRequest.fetchBatchSize = 10
        self.controller = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                    managedObjectContext: context,
                                                    sectionNameKeyPath: nil,
                                                    cacheName: nil)
        
        super.init()
        
        do {
            try controller.performFetch()
            numberOfTracks = controller.fetchedObjects?.count ?? 0
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
    }
    
}
