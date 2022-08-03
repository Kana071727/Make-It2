//
//  Edit FileViewController.swift
//  Make It
//
//  Created by 清水　佳奈音 on 2022/08/03.
//

import UIKit

class Edit_FileViewController: UIViewController {
    var userDefaults = UserDefaults.standard

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var fileColorview: UIImageView!
    @IBAction func red(){
        fileColorview.backgroundColor = UIColor.red
    }
    @IBAction func pink(){
        fileColorview.backgroundColor = UIColor.systemPink
    }
    @IBAction func blue(){
        fileColorview.backgroundColor = UIColor.blue
    }
    @IBAction func orange(){
        fileColorview.backgroundColor = UIColor.orange
    }
    @IBAction func green(){
        fileColorview.backgroundColor = UIColor.green
    }
    @IBAction func purple(){
        fileColorview.backgroundColor = UIColor.systemPurple
    }
    @IBAction func gray(){
        fileColorview.backgroundColor = UIColor.systemGray2
    }
    @IBAction func black(){
        fileColorview.backgroundColor = UIColor.black
    }
    @IBAction func lightblue(){
        fileColorview.backgroundColor = UIColor.systemMint
    }
    @IBAction func lightgreen(){
        fileColorview.backgroundColor = UIColor.systemGreen
    }
    @IBAction func save(){
            
        }
    
    
override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
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
