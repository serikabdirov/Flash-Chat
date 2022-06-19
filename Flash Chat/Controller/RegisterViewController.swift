//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Серик Абдиров on 18.06.2022.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    @IBAction func registerPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text,
        let password = passwordTextfield.text
        else { return }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)
            } else {
                self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
            }
        }
    }

}
