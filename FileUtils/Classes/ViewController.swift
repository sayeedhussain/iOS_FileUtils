//
//  ViewController.swift
//  FileUtils
//
//  Created by Sayeed Munawar Hussain on 12/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        do {
        
            let path = try FileManager.default.fu_persistentAppDataPath()
            print("\(path)")
        
        } catch {
            print("\(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

