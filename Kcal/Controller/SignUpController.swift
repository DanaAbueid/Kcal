//
//  SignUpController.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 19/03/2024.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let backgroundImage = UIImage(named: "textFieldPink") {
            NameTextField.setBackground(image: backgroundImage)
            EmailTextField.setBackground(image: backgroundImage)
            PasswordTextField.setBackground(image: backgroundImage)
        }
        
    }
    
    @IBAction func LogInPressed(_ sender: UIButton) {
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
       // performSegue(withIdentifier: "GoToWelcome", sender: self)
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

// MARK: - TextField



extension UITextField {
    func setBackground(image: UIImage) {
        // Resize image if needed, and adjust the contentMode
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        backgroundImageView.image = image
        backgroundImageView.contentMode = .scaleAspectFill // Adjust as needed

        // Add the image view to the background view of the text field
        self.background = image
        
        // To ensure the image view doesn't obstruct the text, you can add padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

