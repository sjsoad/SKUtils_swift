//
//  SKLoginMV.swift
//  SKUtilsSwift
//
//  Created by Mac on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class SKLoginMV: UIViewController {
    
    @IBOutlet var loginVM: SKLoginVM!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldDidBeginEditing(sender: UITextField) {
        
    }
    @IBAction func textFieldDidEndEditing(sender: UITextField) {
        
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        
    }
    
}
