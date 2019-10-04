//
//  ViewController.swift
//  Rambo
//
//  Created by Khalid Ajlan on 10/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var Rock: UIButton!
    @IBOutlet weak var Scissors: UIButton!
    @IBOutlet weak var Paper: UIButton!
    var match : RPSMatch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Move(_ sender: UIButton){
        let opponent = RPS()
        var move: RPS!
        switch (sender){
        case Rock:
             move = RPS.rock
        case Scissors:
             move = RPS.scissors
        default:
            move = RPS.paper
        }
        self.match = RPSMatch(p1: move, p2: opponent)
        if(move == RPS.scissors){
            let storyboard = UIStoryboard (name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
            controller.matcch = self.match
            self.present(controller, animated: true, completion: nil)
        }else if (move == RPS.paper){
            performSegue(withIdentifier: "maatch", sender: self)
        }
        

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultViewController
        controller.matcch = self.match
        
    }
    
}

enum RPS {
    case rock,paper,scissors
    var value: String {
        get{
            switch self{
            case .rock:
                return "Rock"
            case .paper:
                return "Paper"
            default:
                return "Scissors"
            }
        }
    }
    init(){
        switch (arc4random() % 3) {
        case 0:
            self = .rock
        case 1:
            self = .paper
        default:
            self = .scissors
        }
    }
    func defeats(_ comp: RPS) -> Bool{
        switch(self,comp)  {
        case (.rock,.scissors) , (.scissors, .paper), (.paper, .rock) :
            return true
        default:
            return false
        }
    }
}

struct RPSMatch {
    
    // MARK: Properties
    
    let p1: RPS
    let p2: RPS
    
    // MARK: Initializer
    
    init(p1: RPS, p2: RPS) {
        self.p1 = p1
        self.p2 = p2
    }
    
    // MARK: Computed Properties
    
    var winner: RPS {
        get {
            return p1.defeats(p2) ? p1 : p2
        }
    }
    
    var loser: RPS {
        get {
            return p1.defeats(p2) ? p2 : p1
        }
    }
}
