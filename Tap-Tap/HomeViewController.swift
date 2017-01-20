//
//  HomeViewController.swift
//  Tap-Tap
//
//  Created by Maxime Ravau on 05/10/2016.
//  Copyright © 2016 Maxime Ravau. All rights reserved.
//

import UIKit
import Social
import AVFoundation

class HomeViewController: UIViewController{
    
    var player = AVAudioPlayer()
    
    @IBOutlet var buttonShare: UIButton!
    @IBOutlet weak var diamantLabel: UILabel!
    @IBOutlet var scoreRecord: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
// On peut aussi mettre le chargement des sons dans viewDidLoad.
        do {
            let audioPath = Bundle.main.path(forResource: "Parapluie", ofType: "wav")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch {
            // ERREUR
        
         
            
        }

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPlay(_ sender: Any) {
    
    player.play()
    
    
    }
// Fonction viewWillAppear quand on apparait sur la page HomeViewController la page ce mets a jours
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
        
    }
// Fonction button Facebook pour partager sur Facebook
    @IBAction func buttonShare(_ sender: UIButton) {
    
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            self.present(fbShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Compte", message: "Veuillez vous connecter à un compte Facebook pour partager.",
                                          
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
// Fonction button Twitter pour partager sur Twitter
    @IBAction func shareTwitter(_ sender: UIButton) {
    
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            
            let tweetShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            self.present(tweetShare, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title: "Compte", message: "Veuillez vous connecter à un compte Twitter pour tweeter.",
                                          
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        

    
    }
    
    
    
    
}
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


