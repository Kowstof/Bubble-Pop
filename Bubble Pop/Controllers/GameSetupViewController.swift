//
//  SetupViewController.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 26/4/21.
//

import UIKit

class GameSetupViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var maxBubbleSlider: UISlider!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var maxBubblesLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        startButton.isEnabled = false
        durationSlider.setValue(60, animated: false)
        maxBubbleSlider.setValue(15, animated: false)
        updateSliderAndLabel(slider: durationSlider, label: durationLabel, interval: 5.0, text: " seconds")
        updateSliderAndLabel(slider: maxBubbleSlider, label: maxBubblesLabel, interval: 1.0, text: nil)
    }
    
    @IBAction func durationSliderValueChanged(_ sender: Any) {
        updateSliderAndLabel(slider: durationSlider, label: durationLabel, interval: 5.0, text: " seconds")
    }
    
    @IBAction func maxBubblesSliderChanged(_ sender: Any) {
        updateSliderAndLabel(slider: maxBubbleSlider, label: maxBubblesLabel, interval: 1.0, text: nil)
    }
    
    @IBAction func nameFieldChanged(_ sender: Any) {
        if nameField.hasText {
            startButton.isEnabled = true
        } else {
            startButton.isEnabled = false
        }
    }
    
    func updateSliderAndLabel(slider: UISlider, label: UILabel, interval: Float, text: String?) {
        let sliderVal = slider.value
        let nearestFive = customRound(value: sliderVal, toNearest: interval)
        
        slider.setValue(nearestFive, animated: false)
        if text == nil {
            label.text = String(Int(slider.value))
        } else {
            label.text = String(Int(slider.value)) + text!
        }
    }
    
    func customRound(value: Float, toNearest: Float) -> Float {
        let result = round(value / toNearest) * toNearest
        return result
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let vc = segue.destination as! GameViewController
            vc.name = nameField.text!
            vc.timeRemaining = Int(durationSlider.value)
            vc.maxBubbles = Int(maxBubbleSlider.value)
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }}


