
import MapKit

class MapNavigationAnnotation: NSObject, MKAnnotation {
    let id: String
    let name: String
    let image: String
    let coordinate: CLLocationCoordinate2D

    init(id: String, name: String, image: String, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.image = image
        self.coordinate = coordinate
        super.init()
    }

    var title: String? {
        return name
    }

    var subtitle: String? {
        return "Tap for more info"
    }
}
