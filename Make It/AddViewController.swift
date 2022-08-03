//
//  AddViewController.swift
//  Make It
//
//  Created by 清水　佳奈音 on 2022/06/29.
//

import UIKit


class AddViewController: UIViewController {
    
    
    
    @IBOutlet var nametextfield: UITextField!
    @IBOutlet private weak var alertButton: UIButton!
    @IBOutlet private weak var sampleButton: UIButton!
    private var selectedMenuType = MenuType.red
    
    @IBOutlet var duetextfield: UITextField!
    var datePicker = UIDatePicker()
    
    ///saveButton
    @IBAction func save () {
        
        }
    ///cancelButton
    @IBAction func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ///テキストフィールドに下線
        nametextfield.setUnderLine()
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
    case red
    case pink
    case blue
    case orange
    case green
    case purple
    case grey
    case black
    case lightblue
    case lightgreen
    
    var title: String{
        switch self {
        case .red:
            return "ios"
        case .pink:
            return "android"
        case .blue:
            return "web"
        case .orange:
            return "orange"
        case .green:
            return "orange"
        case .purple:
            return "orange"
        case .grey:
            return "orange"
        case .black:
            return "orange"
        case .lightblue:
            return "orange"
        case .lightgreen:
            return "orange"
        }
    }
}
