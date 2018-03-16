//
//  ARViewController.swift
//  LocationWithAR
//
//  Created by Sergey on 12.03.2018.
//Copyright © 2018 Sergey. All rights reserved.
//

import UIKit
import ARKit
import CoreLocation
import MapKit

class ARViewController: UIViewController, ARInterface {

    var presenter: AROutput?

    @IBOutlet private weak var sceneView: ARSCNView!
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Lifecycle -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupScene()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        presenter?.viewDidLoad()
        
    }

    // MARK: - Private -
    
    private func setupMap() {
        mapView.showsUserLocation = true
        mapView.showsCompass = true
    }
    
    private func setupScene() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        sceneView.session.run(config)
        sceneView.session.delegate = self
    }
    
    private func addLocationNode(locationNode: LocationNode) {
        updatePositionAndScaleOfLocationNode(locationNode: locationNode, initialSetup: true, animated: false)
        sceneView.scene.rootNode.addChildNode(locationNode)
    }
    
    private func clearScene() {
        sceneView.scene.rootNode.childNodes.forEach { (node) in
            node.removeFromParentNode()
        }
    }
    
    private func updatePositionAndScaleOfLocationNode(locationNode: LocationNode,
                                                      initialSetup: Bool = false,
                                                      animated: Bool = false,
                                                      duration: TimeInterval = 0.1) {
        guard let currentPosition = currentScenePosition(), let currentLocation = presenter?.currentLocation else { return }
        SCNTransaction.begin()
        if animated {
            SCNTransaction.animationDuration = duration
        } else {
            SCNTransaction.animationDuration = 0
        }
        
        let distance = locationNode.location.distance(from: currentLocation)
        if distance <= Double(Defaults.maxVisibleDistance) {
            // Position is set to a position coordinated via the current position
            let locationTranslation = currentLocation.translation(toLocation: locationNode.location)
            let position = SCNVector3(
                x: currentPosition.x + Float(locationTranslation.longitudeTranslation),
                y: currentPosition.y + Float(locationTranslation.altitudeTranslation),
                z: currentPosition.z - Float(locationTranslation.latitudeTranslation))
            
            locationNode.position = position
            locationNode.scale = SCNVector3(x: 1, y: 1, z: 1)
        }
        
        SCNTransaction.commit()
    }
    
    // MARK: - Utils -
    
    private func currentScenePosition() -> SCNVector3? {
        guard let pointOfView = sceneView.pointOfView else {
            return nil
        }
        
        return sceneView.scene.rootNode.convertPosition(pointOfView.position, to: sceneView.scene.rootNode)
    }
    
    private func currentEulerAngles() -> SCNVector3? {
        return sceneView.pointOfView?.eulerAngles
    }
    
    // MARK: - ARInterface -
    
    func add(places: [PlaceAnnotation]) {
        clearScene()
        mapView.removeAnnotations(mapView.annotations)
        guard let altitude = presenter?.currentLocation?.altitude else { return }
        for place in places {
            let pinLocation = CLLocation(coordinate: place.coordinate, altitude: altitude)
            let pinImage = UIImage(named: "pin")!
            let pinLocationNode = LocationAnnotationNode(location: pinLocation, image: pinImage)
            addLocationNode(locationNode: pinLocationNode)
        }
        mapView.addAnnotations(places)
    }
    
}

// MARK: - ARSCNViewDelegate -

extension ARViewController: ARSCNViewDelegate {
    
}

// MARK: - ARSessionDelegate -

extension ARViewController: ARSessionDelegate {
    
}