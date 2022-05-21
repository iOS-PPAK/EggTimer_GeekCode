//
//  MainViewController.swift
//  eggTimer
//
//  Created by hyeonseok on 2022/05/17.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var selectBtnView: UIView!
    @IBOutlet weak var lastRecordView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        selectBtnView.layer.cornerRadius = 15
        lastRecordView.layer.cornerRadius = 25

        statusLabel.text = "조리시간을 선택하세요"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rareBtn(_ sender: Any) {
        print("반숙선택")
        mainVcSegue()
        
    }
    
    @IBAction func welldoneBtn(_ sender: Any) {
        print("완숙선택")

    }
    
    
    
    
    
    /// 유입제어 상태조회 뷰로 이동
    /// - Parameters:
    ///   - inflowData: 토큰발급API call 하고 나온 리턴값
    ///   - useServerList: 서버 URL

    
    func mainVcSegue() {
        print("performSegue : mainVcSegue")
        self.performSegue(withIdentifier: "mainVcSegue", sender: self)
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
