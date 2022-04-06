//
//  ViewController.swift
//  3.DatePicker
//
//  Created by 이병현 on 2022/03/25.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector: Selector = #selector(DateViewController.updateTime) // 타이머가 구동되면 실행할 함수를 지정
    let interval = 1.0 // 타이머의 간격 값. 1.0은 1초를 의미함
    var count = 0 // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self,  selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender // 데이터 피커를 선택할 때 발생하는 액션 함수인 changeDatePicker 가 호출되면서 sender를 datePickerView라는 상수에 저장
        
        let formatter = DateFormatter() // 날짜를 출력하기 위해여 DateFormatter라는 클래스 상수 formatter를 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // formatter의 dateFormat 속성을 설정. 포맷은 "년-월-일 시:분:초 요일"로 설정
        lblPickerTime.text =
        "선택시간: " + formatter.string(from: datePickerView.date) // 데이트피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포멧대로 string 메서드를 사용하여 문자열로 변환. "선택시간:"이라는 문자열 위에서 문자열로 변환한 date 값을 추가하여 lblPickerTime의 text에 넣음
    }
    
    @objc func updateTime() { // Swift애서는 #selector()의 인자로 사용될 메서드를 선언할 때 Object-C와의 호환성을 위해 반드시 @objc 키워드를 붙여야 함
        //lblCurrentTime.text = String(count) // String으로 변환한 count 값을 lblCurrentTime 레이블의 text 속성에 저장
        //count = count + 1 // count 값 1 증가
        // 기존 소스 주석처리
        let date = NSDate() // 현재시간을 NSDate 함수를 사용하여 가져옴
        
        let formatter = DateFormatter() // 날짜를 출력하기 위하여 DateFormatter이라는 클래스의 상수 formatter 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" // 앞에서 선언한 formatter 의 dateFormat 속성 설정
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date) // 파커 뷰에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열로 변환함.
    }
}

