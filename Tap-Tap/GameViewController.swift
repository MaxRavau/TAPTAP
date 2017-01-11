import UIKit


class GameViewController: UIViewController {
  
    
    
    var score = 0
    
    var counter = 20

    var time = Timer()
//  j'ai créer les différentes variables de mon jeu pour créer mes fonctions.
    
    
    @IBOutlet weak var compteurLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var tapButton: UIButton!
    
    @IBOutlet weak var restartPlayButton: UIButton!
    
    @IBOutlet weak var finJeuLabel: UILabel!
    
   @IBAction func RestartPlayButtonPress(_ sender: UIButton) {
       
        debutJeu()
    }
    
    @IBAction func goBack(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBack2(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // j'ai souscris la fonction restartPlayButtonPress et en déclarant le début du jeu.
    
    
    override func viewDidLoad() {
        
        debutJeu()
        
    }
    // j'ai créer la fonction viewDidLoad(), ou la fonction déclaré est débutJeu.
    
    
    @IBAction func buttonPress(_ sender: UIButton) {
        score += 1
        print("le score est de \(score)")
        compteurLabel.text = "\(score)"
        
        
        if score == 1 {
            
            
            boucleJeu()
        }
    }
    
    // la fonction buttonPress c'est quand on appuye sur le bouton, on a ajouté +1 a chaque tap, on imprime le score, et on change le compteur sur l'interface de l'application à chaque tap.
    
    func timerAction(){
        counter -= 1
        timeLabel.text = "\(counter)"
        
        if counter == 0 {
            finJeu()
        }
    }
    
    // j'ai créer la fonction timerAction, en déduisant 1 a chaque seconde. et de l'intégrer à l'interface.
    // si le temps est à 0 alors c'est la fin du jeu.
    
    func debutJeu () {
      
        tapButton.isEnabled = true
        score = 0
        counter = 20
        restartPlayButton.isHidden = true
        finJeuLabel.isHidden = true
        timeLabel.text = "\(counter)"
        compteurLabel.text = "\(score)"
        

    }
    //j'ai créer la fonction debutJeu, en disant que le boutton tap est actif, que le score est à 0, que le temps est a 15, le boutton restart est caché, que le label fin du jeu est aussi caché, on affiche le score et le temps sur l'interface et l'encouragement est caché
    func boucleJeu () {
        
        time = Timer.scheduledTimer(timeInterval: 1,
                                    target: self,
                                    selector: #selector(timerAction),
                                    userInfo: nil,
                                    repeats: true)

    }
    // on a créer la fonction boucleJeu, avec un modèle temps.
    func finJeu () {
        
        time.invalidate ()
        tapButton.isEnabled = false
        restartPlayButton.isHidden = false
        finJeuLabel.isHidden = false
        
    }
    
    }
