//
//  ViewController.swift
//  PlanetList
//
//  Created by Natalia Wcisło on 09/01/2020.
//  Copyright © 2020 Natalia Wcisło. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let menager = CMMotionManager()
    
    func motionLoad(){
        if menager.isDeviceMotionAvailable{
            menager.deviceMotionUpdateInterval = 0.08
            menager.startDeviceMotionUpdates(to: OperationQueue.main) { (data: CMDeviceMotion?, error: Error?) in
                switch UIDevice.current.orientation {
                case .portrait:
                     print("portrait \( String(describing: data?.gravity.x))")
                case .portraitUpsideDown:
                     print("portraitUpsideDown \( String(describing: data?.gravity.x))")
                case .landscapeLeft:
                    print("landscapeLeft \( String(describing: data?.gravity.z))")
                case .landscapeRight:
                    print("landscapeRight \( String(describing: -(data?.gravity.z)!))")
                case .faceUp:
                    print("faceUp \( String(describing: data?.gravity.y))")
                case .faceDown:
                    print("faceDown \( String(describing: data?.gravity.y))")
                default:
                    print("blad")
                }
            }
        }
    }
    
    @IBOutlet weak var horizontalList: UICollectionView!
    
    let planetsImage: [UIImage] = [
    UIImage(named: "P1")!,
    UIImage(named: "P2")!,
    UIImage(named: "P3")!,
    UIImage(named: "P4")!,
    UIImage(named: "P5")!,
    UIImage(named: "P6")!,
    UIImage(named: "P7")!,
    UIImage(named: "P8")!,
    UIImage(named: "P9")!,
    UIImage(named: "P10")!,
    UIImage(named: "P11")!,
    UIImage(named: "P12")!,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        horizontalList.delegate = self
        horizontalList.dataSource = self

        motionLoad()
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return planetsImage.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
       
       cell.planetImage.image = planetsImage[indexPath.item]
       return cell
    }

    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
    }
 

}

