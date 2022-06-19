//
//  LoginViewController.swift
//  Flash Chat
//
//  Created by Серик Абдиров on 18.06.2022.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!


    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text, let password = passwordTextfield.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if let e = error {
                let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                strongSelf.present(alert, animated: true)
            } else {
                strongSelf.performSegue(withIdentifier: Constants.loginSegue, sender: strongSelf)
            }
        }
    }

}
