//
//  ViewController.swift
//  Fight_To_Death
//
//  Created by David Clare on 2/15/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var actionTxt: UILabel!
    
    @IBOutlet weak var player1Btn: UIButton!
    
    @IBOutlet weak var player1Lbl: UILabel!
    
    @IBOutlet weak var player2Btn: UIButton!
    
    @IBOutlet weak var player2Lbl: UILabel!

    @IBOutlet weak var player1Hp: UILabel!
    
    @IBOutlet weak var player2Hp: UILabel!
    
    
    var player1: Player1!
    var player2: Player2!
    
    var btnSound: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path = NSBundle.mainBundle().pathForResource("Victory", ofType: "mp3")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do{
            
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }

        btnSound.play()
        
        
        player1 = Player1(startingHp: 110, attackPwr: 15, name: "Smorc")
        player2 = Player2(startingHp: 110, attackPwr: 15, name: "Charge")
        
        player1Hp.text = "\(player1.hp) HP"
        player2Hp.text = "\(player2.hp) HP"
        
        
    }

    @IBAction func onPlayer1Attack(sender: AnyObject) {
        
        player1Btn.hidden = true
        player1Lbl.hidden = true
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "RevealPlayer1Btn", userInfo: nil, repeats: false)
        
        if player2.attempAttack(player1.attackPwr)
        {
            actionTxt.text = "\(player1.name) Attacked \(player2.name) for \(player1.attackPwr) HP"
            player2Hp.text = "\(player2.hp) HP"
        }
        
        if !player2.isAlive{
            restartGame()
        }
    }


    @IBAction func onPlayer2Attack(sender: AnyObject) {
        
        player2Btn.hidden = true
        player2Lbl.hidden = true
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "RevealPlayer2Btn", userInfo: nil, repeats: false)
        
        if player1.attempAttack(player2.attackPwr)
        {
            actionTxt.text = "\(player2.name) Attacked \(player1.name) for \(player2.attackPwr) HP"
            player1Hp.text = "\(player1.hp) HP"
        }
        
        if !player1.isAlive{
            restartGame()
        }

        
    }
    
    func RevealPlayer1Btn(){
        player1Btn.hidden = false
        player1Lbl.hidden = false
        
    }
    
    func RevealPlayer2Btn(){
        player2Btn.hidden = false
        player2Lbl.hidden = false
        
    }
    
    func restartGame(){
        player1.setHp(110)
        player2.setHp(110)
        
        player1Hp.text = "\(player1.hp) HP"
        player2Hp.text = "\(player2.hp) HP"
        
    }
    
    
    
}

