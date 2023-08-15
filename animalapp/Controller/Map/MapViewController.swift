
import UIKit
import MapKit

// Replace this with your MapNavigation data structure
struct MapNavigation {
    let id: String
    let name: String
    let image: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
}

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    let mapNavigation: [MapNavigation] = [
        MapNavigation(id: "serengeti", name: "Serengeti National Park", image: "map-serengeti", latitude: -2.3333333, longitude: 34.8333333),
        MapNavigation(id: "kruger", name: "Kruger National Park", image: "map-kruger", latitude: -23.9883848, longitude: 31.5525515),
        MapNavigation(id: "chobe", name: "Chobe National Park", image: "map-chobe", latitude: 3.8495757, longitude: 33.7525049),
        MapNavigation(id: "kidepo", name: "Kidepo Valley National Park", image: "map-kidepo", latitude: 3.8495757, longitude: 33.7525049),
        MapNavigation(id: "etosha", name: "Etosha National Park", image: "map-etosha", latitude: -18.8555909, longitude: 16.327131)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the map view delegate to self
        mapView.delegate = self

        // Call the function to display annotations
        addAnnotationsToMap()
    }

    func addAnnotationsToMap() {
        for location in mapNavigation {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            mapView.addAnnotation(annotation)
        }

        // Zoom the map to fit all annotations
        if let firstLocation = mapNavigation.first {
            let span = MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: firstLocation.latitude, longitude: firstLocation.longitude), span: span)
            mapView.setRegion(region, animated: true)
        }
    }

    // Customize the annotation view
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "LocationAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
           // annotationView?.image = UIImage(named: annotation.image)
            annotationView?.canShowCallout = true
            
            let button = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = button
        } else {
            annotationView?.annotation = annotation
        }
        
       
        
        return annotationView
    }

    // Handle the tap on the annotation's callout accessory button
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation, let name = annotation.title{
            let ac = UIAlertController(title: name, message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
}
