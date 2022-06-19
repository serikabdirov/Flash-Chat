//
//  WelcomeViewController.swift
//  Flash Chat
//
//  Created by Серик Абдиров on 18.06.2022.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "⚡️FlashChat"
//        overrideUserInterfaceStyle = .light
    }


}
