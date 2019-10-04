//
//  ResultViewController.swift
//  Rambo
//
//  Created by Khalid Ajlan on 10/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var matcch : RPSMatch!
    @IBAction func dismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated:Bool) {
           super.viewWillAppear(animated)
           messageLabel.text = Message(matcch)
    }
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)

        
    }
    func Message(_ message: RPSMatch) -> String{
        if (message.p1 == message.p2){
            
            return "It's a tie"
        }else if (message.winner == message.p1){
            if(message.p1 == RPS.paper){
               return "You win, Paper beats rock"
            } else if(message.p1 == RPS.rock){
                return "You win, rock beats scissors"
            }else {
                 return "You win, scissors beats paper"
            }
    
    
        }else {
            if(message.p2 == RPS.rock){
                return "You lose, rock beats scissors"
            }else  if(message.p2 == RPS.paper){
                return "You lose, paper beats rock"
            }else {
                return " you lose, scissors beats paper"
            }
    
    
        }
    }
}
