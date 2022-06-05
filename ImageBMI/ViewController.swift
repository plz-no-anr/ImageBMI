//
//  ViewController.swift
//  ImageBMI
//
//  Created by TJ on 2022/06/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfCm: UITextField!
    
    @IBOutlet weak var tfKg: UITextField!
    
    @IBOutlet weak var lblDiscription: UILabel!
    
    @IBOutlet weak var ivBmi: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func btn(_ sender: Any) {
        guard let sCm = tfCm.text else { return }
        guard let sKg = tfKg.text else { return }
        
        
        if fieldCheck() && sCm.count <= 3 && sKg.count <= 3{

        let dCm = Double(Double(sCm)! * 0.01)
            
        let dKg = Double(sKg)!
        
        let bmiCheck = bmiCheck(cm: dCm, kg: dKg)
        
        let bmi = String(format: "%.2f", bmiCheck.0)
        
        lblDiscription.text = "귀하의 bmi 지수는 \(bmi)이고 \(bmiCheck.1)입니다."
            
        } else {
            errorAlert()
//            lblDiscription.text = "키와 몸무게를 정확하게 입력 해주세요."
        }
    }
    
    // 키와 몸무게 nil체크
    func fieldCheck() -> Bool{
        if(tfCm.text?.trimmingCharacters(in: .whitespacesAndNewlines))!.isEmpty ||
            (tfKg.text?.trimmingCharacters(in: .whitespacesAndNewlines))!.isEmpty{
            return false
        } else {
            return true
        }
    }
    
    func errorAlert(){
        let inputAlert = UIAlertController(title: "경고", message: "숫자를 입력해 주세요!", preferredStyle: .alert)
        let onAction = UIAlertAction(title: "네, 알겠습니다", style: .default, handler: nil)
        inputAlert.addAction(onAction)
        
        present(inputAlert, animated: true, completion: nil)
    }
    
    // bmi계산
    func bmiCheck(cm:Double, kg:Double) -> (Double,String) {
        let bmi = kg / (cm * cm)
        var sBmi = ""
        
        switch bmi {
        case 0...18.4:
            sBmi = "저체중"
            drawImage(name: "underweight.png")
            break
        case 18.5...22.9:
            sBmi = "정상체중"
            drawImage(name: "normal.png")
            break
        case 23...24.9:
            sBmi = "과체중"
            drawImage(name: "overweight.png")
            break
        case 25...29.9:
            sBmi = "비만"
            drawImage(name: "risk.png")
            break
        default:
            sBmi = "고도비만"
            drawImage(name: "obese.png")
            break
        }
        return (bmi, sBmi)
    }
    
    // 이미지 변경
    func drawImage(name:String){
        ivBmi.image = UIImage(named: name)
    }
    
    
}

