//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Серик Абдиров on 18.06.2022.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!

    var messages: [Message] = [
        Message(sender: "sm@gmail.com", body: "Hey"),
        Message(sender: "smm@gmail.com", body: "HI"),
        Message(sender: "sm@gmail.com", body: "How are you?")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true

    }

    @IBAction func sendPressed(_ sender: UIButton) {
    }

    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }

    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        cell.textLabel?.text = messages[indexPath.row].sender
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

}
