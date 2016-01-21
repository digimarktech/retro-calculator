//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Marc Aupont on 1/20/16.
//  Copyright © 2016 Digimark Technical Solutions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String {
        
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
        
    }
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation:Operation = Operation.Empty
    var result = ""

    @IBOutlet var outputLabel: UILabel!
    
    @IBAction func numberPressed(btn: UIButton!) {
        
        playSound()
        
        runningNumber += "\(btn.tag)"
        
        outputLabel.text = runningNumber
        
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        
        processOperation(currentOperation)
    }
    
    
    var btnSound:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Path of Audio file(btn.wav)
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            
            btnSound.prepareToPlay()
            
        } catch let error as NSError{
            
            print(error.debugDescription)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func processOperation(op: Operation) {
        
        playSound()
        
        if currentOperation != Operation.Empty {
            
           //Run some math
            
            if runningNumber != "" {
                
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                    
                } else if currentOperation == Operation.Divide {
                    
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                    
                } else if currentOperation == Operation.Subtract {
                    
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                    
                } else if currentOperation == Operation.Add {
                    
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLabel.text = result
                
            }
            
            currentOperation = op
            
        } else {
            
            //This is the first time the operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
            
        }
        
    }
    
    func playSound() {
        
        if btnSound.playing {
            
            btnSound.stop()
        }
        
        btnSound.play()
    }


}

