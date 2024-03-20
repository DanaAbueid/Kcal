//
//  LogInController.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 20/03/2024.
//

import UIKit

class LogInController: UIViewController {

    
    
    @IBOutlet weak var EmailField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        if let backgroundImage = UIImage(named: "textFieldPink") {
            
            EmailField.setBackground(image: backgroundImage)
            PasswordTextField.setBackground(image: backgroundImage)
        }
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
