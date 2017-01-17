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
    @IBOutlet var scoreEnregistrer: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ceci est un Test")
        print("Ceci est un autre test")
        
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
    
    func getScore() -> String {
        // On  récupère object dans le UserDefault stocké à la clé "score"
        if ( UserDefaults.standard.object(forKey: "score") == nil){
            // On créer une base vide
            let scored : String = "0"
            // On sauvegarde cette base
            UserDefaults.standard.set(scored, forKey: "score")
        }
        return UserDefaults.standard.object(forKey: "score") as! String
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


