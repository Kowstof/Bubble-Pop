//
//  ViewController.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 24/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreButton.layer.cornerRadius = 5
        playButton.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) { // Hides the navigation bar. source: https://stackoverflow.com/a/29209623
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}

