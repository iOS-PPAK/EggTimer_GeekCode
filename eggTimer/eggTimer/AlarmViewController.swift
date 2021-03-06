//
//  AlarmViewController.swift
//  eggTimer
//
//  Created by hyeonseok on 2022/05/18.
//

import UIKit

class AlarmViewController: UIViewController {

    var timeRemaining: Int = 10
    var timer: Timer!
    var seconds: Int = 0
    var minutes: Int = 0
    var customRecord: Int = 0
    
    @IBOutlet weak var remainTimeLbl: UILabel!
    @IBOutlet weak var playPauseImage: UIImageView!
    @IBOutlet weak var pauseBtnImage: UIImageView!
    
    @IBOutlet weak var playPauseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playPauseBtn.setTitle("", for: .normal)
        resetBtn.setTitle("", for: .normal)

        self.playPauseImage.image = UIImage(systemName: "play.circle.fill")
        self.playPauseImage.tintColor = UIColor.customDeepYellow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if !Constants.isCheckTutorial {
            moveTutorialView()
        }
        updateRemainTime()
        updateBtnImage()
    }
    
    @IBAction func playTapped(_ sender: Any) {
        if !(Constants.isStartAlarm) {
            Constants.isStartAlarm = true

            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(operateTimer), userInfo: nil, repeats: true)
            print("playTapped")
            updateBtnImage()
        } else {
            Constants.isStartAlarm = false
            timer.invalidate()
            print("pauseTapped")
            updateBtnImage()
        }
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        timer.invalidate()
        remainTimeLbl.text = "\(timeRemaining)"
        updateRemainTime()
    }

    @objc func operateTimer() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timer.invalidate()
            updateRemainTime()
        }
        var stringValue = intToDigitFormatter(remainTime: timeRemaining)
        remainTimeLbl.text = stringValue
        
    }
    func updateBtnImage() {
        self.playPauseImage.image = Constants.isStartAlarm ?  UIImage(systemName: "pause.circle.fill") : UIImage(systemName: "play.circle.fill")
    }

    func updateRemainTime() {
    
        if Constants.selectedSeconds == selectType.rareType.rawValue {
            timeRemaining = selectType.rareType.rawValue
//            remainTimeLbl.text = String(timeRemaining)

        } else if Constants.selectedSeconds == selectType.welldoneType.rawValue {
            timeRemaining = selectType.welldoneType.rawValue
//            remainTimeLbl.text = String(timeRemaining)

        } else  if customRecord != 0 {
            timeRemaining = customRecord

        }
        var stringValue = intToDigitFormatter(remainTime: timeRemaining)
        remainTimeLbl.text = stringValue

    }
    
    
    
    func intToDigitFormatter(remainTime: Int) -> String{
        
        let totalSeconds = remainTime
        let minute = String(remainTime / 60)
        let second = String(remainTime % 60)
        
        let currentMinute = (minute.count < 2) ? "0\(minute)" : minute
        let currentSecond = (second.count < 2) ? "0\(second)" : second
        
        var array = [String]()
        array.append(contentsOf: [(currentMinute), (currentSecond)])
        let stringValue = array.joined(separator: ":")
        print(totalSeconds, currentMinute, currentSecond, "array: ", array, stringValue)

        return stringValue
        
    }
    
    func moveTutorialView() {
        print("tutorial View Check")
        let VC = TutorialViewController(nibName: "TutorialViewController", bundle: nil)
            present(VC, animated: true, completion: nil)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



