//
//  ViewController.swift
//  99RedBalloons
//
//  Created by David Vences Vaquero on 17/3/15.
//  Copyright (c) 2015 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var balloonNumberLabel: UILabel!
    @IBOutlet weak var balloonPicureImageView: UIImageView!
    
    //declaro el Array donde voy a guardar los globos
    var myBalloons:[balloon] = []
    
    //declaro una variable var = lastBalloonIndex que me va a servir para no ver el mismo globo dos veces seguidas, la indexo con valor 0, e irá cambiando al ver nuevos globos
    
    var lastBalloonIndex = 0
    var randomBalloonIndex = 0

  
    
    //----------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Llamo a la función que genera todos los globos
        balloonGenerator()
        println("testing viewDidLoad")
    }
    //----------------------------------------------------------------------------------------------------

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func nextBalloonButtonPressed(sender: UIBarButtonItem) {
        
        
//        println("\(myBalloons.count)")
        
        do {
        randomBalloonIndex = Int(arc4random_uniform(UInt32(99)))
        } while randomBalloonIndex == lastBalloonIndex
        
        balloonNumberLabel.text = "showing balloon number \(self.myBalloons[randomBalloonIndex].number)"
        balloonPicureImageView.image = self.myBalloons[randomBalloonIndex].image
        
        
    }

    //función de generación de globos:
    
    func balloonGenerator(){
        for var balloonCounter = 0; balloonCounter <= 99; ++balloonCounter {
            var currentBalloon = balloon()
            currentBalloon.number = balloonCounter
            
            let randomNumber = Int(arc4random_uniform(UInt32(4)))
            switch randomNumber{
            case 1:
                currentBalloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2:
                currentBalloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3:
                currentBalloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                currentBalloon.image = UIImage(named: "RedBalloon4.jpg")
            
            }
           // println("\(currentBalloon.number)")
            self.myBalloons.append(currentBalloon)
                
                //recuerda que el nombre de los archivos es una STRING --> entre comillas!!!!!!
            
        }
    }

    

}

