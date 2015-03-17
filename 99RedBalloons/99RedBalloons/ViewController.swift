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
    var myBalloons = []
    
    //declaro una variable var = lastBalloonIndex que me va a servir para no ver el mismo globo dos veces seguidas, la indexo con valor 0, e irá cambiando al ver nuevos globos
    
    var lastBalloonIndex = 0


  
    
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
        var randomBalloonIndex = 0
        do {
            randomBalloonIndex = Int(arc4random_uniform(UInt32(99)))
        } while randomBalloonIndex == lastBalloonIndex
        
        lastBalloonIndex = randomBalloonIndex
        println("\(randomBalloonIndex)")
        
        //con el índice aleatorio obtenido, saco de myBalloons el globo correspondiente y lo utilizo para actualizar la interfaz
        
        // var randomBalloon = myBalloons[randomBalloonIndex]
      
        balloonNumberLabel.text = "Showing balloon number \(randomBalloonIndex)"
        let randomBalloon = myBalloons[randomBalloonIndex]
        //balloonPicureImageView.image = myBalloons[randomBalloonIndex].image
        
        
        
        
    }

    //función de generación de globos:
    
    func balloonGenerator(){
        for var balloonCounter = 0; balloonCounter <= 99; balloonCounter++ {
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
                
                //recuerda que el nombre de los archivos es una STRING --> entre comillas!!!!!!
            }
        }
    }

    

}

