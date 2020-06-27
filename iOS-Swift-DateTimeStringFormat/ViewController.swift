//
//  ViewController.swift
//  iOS-Swift-DateTimeStringFormat
//
//  Created by Pooya on 2020-06-21.
//  Copyright © 2020 centurytrail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let datePicker = UIDatePicker()
    var activeDateField : UITextField!
    
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var entryDate: UITextField!
    @IBOutlet weak var inputFormat: UITextField!
    @IBOutlet weak var outputFormat: UITextField!
    @IBOutlet weak var nowLabel: UILabel!
    @IBOutlet weak var next30minLabel: UILabel!
    @IBOutlet weak var past30minLabel: UILabel!
    @IBOutlet weak var tommorowLabel: UILabel!
    @IBOutlet weak var yesterdayLabel: UILabel!
    @IBOutlet weak var nowTimeSatmpLabel: UILabel!
    @IBOutlet weak var nextweekLabel: UILabel!
    @IBOutlet weak var nextweekTimeStampLabel: UILabel!
    @IBOutlet weak var lastweekLabel: UILabel!
    @IBOutlet weak var nextMonthLabel: UILabel!
    @IBOutlet weak var lastMonthLabel: UILabel!
    @IBOutlet weak var lastMonthTimeStampLabel: UILabel!

    var today : Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inputFormat.text = "yyyy-MM-dd HH:mm:ss"
        self.outputFormat.text = "dd-MMM-yyyy HH:mm:ss"
        self.entryDate.text = today.toString(toFromat: self.inputFormat.text ?? "")
        
        update()

    }

    
    func showDatePicker()  {
        //Formate Date
        datePicker.datePickerMode = .dateAndTime
        datePicker.date = activeDateField.text?.toDate(byFormat: self.inputFormat.text ?? "yyyy-MM-dd HH:mm:ss") ?? Date()
        //Tollbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Calcel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        activeDateField.inputAccessoryView = toolbar
        activeDateField.inputView = datePicker
    }
    
    @IBAction func doneDatePicker()  {
        let formatter = DateFormatter()
        formatter.dateFormat = self.inputFormat.text ?? "yyyy-MM-dd HH:mm:ss"
        activeDateField.text = formatter.string(from: datePicker.date)
        update()
        self.view.endEditing(true)
    }
    
    @IBAction func cancelDatePicker()  {
        self.view.endEditing(true)
    }

    @IBAction func dateEntry_get_act(_ sender : Any){
        activeDateField = entryDate
        showDatePicker()
    }
    
    
    @IBAction func update_act(_ sender:Any){
        update()
    }
    
    func update() {
        let entryDateString = self.entryDate.text ?? ""
        let inFormat = self.inputFormat.text ?? ""
        let outFormat = self.outputFormat.text ?? ""

        //        @IBOutlet weak var nowLabel: UILabel!
        self.nowLabel.text = entryDateString.toDate(byFormat: inFormat).toString(toFromat: outFormat)
//        @IBOutlet weak var next30minLabel: UILabel!
        self.next30minLabel.text = entryDateString.addMinToDate(fromFormat: inFormat, toFormat: outFormat, byTimes: 30)
//        @IBOutlet weak var past30minLabel: UILabel!
        self.past30minLabel.text = entryDateString.addMinToDate(fromFormat: inFormat, toFormat: outFormat, byTimes: -30)
//        @IBOutlet weak var tommorowLabel: UILabel!
        self.tommorowLabel.text = entryDateString.addDayToDate(fromFormat: inFormat, toFormat: outFormat, byTimes: 1)
//        @IBOutlet weak var yesterdayLabel: UILabel!
        self.yesterdayLabel.text = entryDateString.addDayToDate(fromFormat: inFormat, toFormat: outFormat, byTimes: -1)
//        @IBOutlet weak var nowTimeSatmpLabel: UILabel!
        self.nowTimeSatmpLabel.text = String(entryDateString.toTimeStamp(byFormat: inFormat))
//        @IBOutlet weak var nextweekLabel: UILabel!
        self.nextweekLabel.text = entryDateString.addDayToDate(fromFormat: inFormat, toFormat: outFormat, byTimes: 7)
//        @IBOutlet weak var nextweekTimeStampLabel: UILabel!
        self.nextweekTimeStampLabel.text = String(entryDateString.addDayToDate(fromFormat: inFormat, toFormat: outFormat, byTimes: 7).toTimeStamp(byFormat: outFormat))
//        @IBOutlet weak var lastweekLabel: UILabel!
        self.lastweekLabel.text = entryDateString.addDayToDate(fromFormat: inFormat, toFormat: outFormat, byTimes: -7)
//        @IBOutlet weak var nextMonthLabel: UILabel!
        self.nextMonthLabel.text = entryDateString.addDayToDate(fromFormat: inFormat, toFormat: outFormat, byTimes: 30)
//        @IBOutlet weak var lastMonthLabel: UILabel!
        self.lastMonthLabel.text = entryDateString.addDayToDate(fromFormat: inFormat, toFormat: outFormat, byTimes: -30)
//        @IBOutlet weak var lastMonthTimeStampLabel: UILabel!
        self.lastMonthTimeStampLabel.text = String(entryDateString.addDayToDate(fromFormat: inFormat, toFormat: outFormat, byTimes: -30).toTimeStamp(byFormat: outFormat))

    }

}

