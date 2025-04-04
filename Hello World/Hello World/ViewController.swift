//
//  ViewController.swift
//  Hello World
//
//  Created by Lindsay Wells on 2/1/18.
//  Copyright © 2018 University of Tasmania. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Create an alert view with updated strings and actionSheet style
        let alert = UIAlertController(
            title: "Welcome!",
            message: "This is your first iOS app using action sheet!",
            preferredStyle: .actionSheet)  // Changed from .alert to .actionSheet

        // Add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // <-- This is where you could put the print AFTER user clicks OK
            print("User tapped OK")
        }))

        // Present the alert
        self.present(alert, animated: true, completion: nil)

        // Debug message appears immediately after presenting the alert
        print("Got to this part of the program")
    }
}
