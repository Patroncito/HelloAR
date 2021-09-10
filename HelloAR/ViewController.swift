//
//  ViewController.swift
//  HelloAR
//
//  Created by Fermin Alfonso Bañuelos Patron on 09/09/21.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Step #1 - 3D Model
        let object = create3dObject()
        
        // Step #2 - Create Anchor
        addObjectToRealWord(object: object, at: SIMD3(x: 0, y: 0, z: 0))

        // Step #3 - Add Anchor to Word
         addGesturesToVRObject(on: object)
    }
    
    func create3dObject() -> ModelEntity {
        let object = MeshResource.generateSphere(radius: 0.5)
        let objectMaterial = SimpleMaterial(color: .blue, roughness: 0, isMetallic: true)
        let objectEntity =  ModelEntity(mesh: object, materials: [objectMaterial])
        return objectEntity
    }
    
    func addObjectToRealWord(object : ModelEntity, at position : SIMD3<Float>) {
        let objectAnchor = AnchorEntity(world: SIMD3(x: 0, y: 0, z: 0))
        objectAnchor.addChild(object)
        arView.scene.addAnchor(objectAnchor)
    }
    
    
    func addGesturesToVRObject(on Object:ModelEntity){
        Object.generateCollisionShapes(recursive: true)
        arView.installGestures([.all], for: Object)
    }
    
}
