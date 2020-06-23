//
//  ViewController.swift
//  iOS-Swift-DateTimeStringFormat
//
//  Created by Pooya on 2020-06-21.
//  Copyright © 2020 centurytrail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
        self.entryDate.text = today.toString(toFromat: "yyyy-MM-dd HH:mm:ss")
        self.inputFormat.text = "yyyy-MM-dd HH:mm:ss"
        self.outputFormat.text = "dd-MMM-yyyy HH:mm:ss"
        
        update()

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

