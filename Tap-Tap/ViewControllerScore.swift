//
//  ViewControllerScore.swift
//  Tap-Tap
//
//  Created by Maxime Ravau on 10/01/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class ViewControllerScore: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ReturnFirstPage(_ sender: UIButton) {
    
    self.dismiss(animated: true, completion: nil)
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
