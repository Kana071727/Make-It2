//
//  AddViewController.swift
//  Make It
//
//  Created by 清水　佳奈音 on 2022/06/29.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet var nametextfield: UITextField!
    @IBOutlet var alerttextfield: UITextField!
    @IBOutlet private weak var sampleButton: UIButton!
    private var selectedMenuType = MenuType.ios
    
    func read() -> Data? {
        return realm.objects(Data.self).first
    }
    @IBOutlet var duetextfield: UITextField!
    var datePicker = UIDatePicker()
    
    ///saveButton
    @IBAction func save () {
        let name: String = nametextfield.text!
        let due: String = duetextfield.text!
        let data: Data? = read()
        self.dismiss(animated: true, completion: nil)
        if data != nil {
            try! realm.write {
                data!.name = name
                data!.due = due
            }
        }else {
                let newData = Data()
                newData.name = name
            newData.due = due
                
                try! realm.write {
                    realm.add(newData)
                }
            }
        }
    ///cancelButton
    @IBAction func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ///テキストフィールドに下線
        nametextfield.setUnderLine()
        alerttextfield.setUnderLine()
        ///メニュー
        configureMenu()
        ///Datepicker
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem,doneItem], animated: true)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年 M月d日"
        datePicker.date = now
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        duetextfield.inputView = datePicker
        duetextfield.inputAccessoryView = toolbar
        
        // Do any additional setup after loading the view.
        let data: Data? = read()
        nametextfield.text = data?.name
    }
    ///DatePicker
    @objc func done() {
    let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年 M月d日"
        duetextfield.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    let now = Date()
    ///Menu
    private func configureMenu() {
        let actions = MenuType.allCases.compactMap { type in UIAction( title: type.title,state: type == selectedMenuType ? .on : .off, handler: { _ in
            self.selectedMenuType = type
            self.configureMenu()
        })}
        sampleButton.menu = UIMenu(title: "", options: .displayInline, children: actions)
        sampleButton.showsMenuAsPrimaryAction = true
        sampleButton.setTitle(selectedMenuType.title, for: .normal)
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
extension UITextField {
    func setUnderLine(){
        borderStyle = .none
        let underline = UIView()
        underline.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 0.5)
        underline.backgroundColor = .black
        addSubview(underline)
        bringSubviewToFront(underline)
    }

}
enum MenuType: CaseIterable {
    case ios
    case android
    case web
    
    var title: String{
        switch self {
        case .ios:
            return "ios"
        case .android:
            return "android"
        case .web:
            return "web"
        }
    }
}
