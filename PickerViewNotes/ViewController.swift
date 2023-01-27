//
//  ViewController.swift
//  PickerViewNotes
//
//  Created by CHRISTIAN BOURQUIN on 1/26/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var datePickerOutlet: UIDatePicker!

        // outlet for pickerView
        @IBOutlet weak var pickerOutlet: UIPickerView!

        var foods = ["Apple", "Steak", "Fries", "A", "B"]
        var selectedFood = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

                // need to attach the delegate of the pickerviewOutlet
                pickerOutlet.delegate = self
    }
    
    // this will be how many wheels/components you have
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

       //How many rows in each wheel/component
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if component == 0{
               return foods.count
           }
           return 0
       }

       //This function is looped for you for every row in the component
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           if component == 0{
               return foods[row]
           }
           return ""
       }

       // this function gets called when you stop on an item in a wheel
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           if component == 0{
               selectedFood = foods[row]
           }
       }

       @IBAction func foodSubmitAction(_ sender: UIButton) {
           print(selectedFood)
       }

       

       @IBAction func dateSubmitAction(_ sender: Any) {
           // formats the date that is selected from the date picker into separate strings
           let dateFormatter = DateFormatter()

           dateFormatter.dateFormat = "yyyy"
           let year = dateFormatter.string(from: datePickerOutlet.date)
           dateFormatter.dateFormat = "MMMM"
           let month = dateFormatter.string(from: datePickerOutlet.date)
           dateFormatter.dateFormat = "dd"
           let day = dateFormatter.string(from: datePickerOutlet.date)
           dateFormatter.dateFormat = "h:mm.ss"
           let time = dateFormatter.string(from: datePickerOutlet.date)

           print("\(month) \(day), \(year) \(time)")
       }

}

