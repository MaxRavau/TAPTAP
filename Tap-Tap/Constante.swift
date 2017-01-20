//
//  Constante.swift
//  Tap-Tap
//
//  Created by Maxime Ravau on 18/01/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import AVFoundation


var scoreActuel = 0

var scoreRecord = 0

var player2 = AVAudioPlayer()

var player3 = AVAudioPlayer()


// On a crée une fonction pour les sons
func chargeSons() {
    
    do {
        let audioPath = Bundle.main.path(forResource: "Applaudissement", ofType: "wav")
        try player2 = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    }
    catch {
        // ERREUR
    }
    
    do {
        
       let audioPath = Bundle.main.path(forResource: "Pouet", ofType: "wav")
        try player3 = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    }
    catch {
        
        //ERREUR
        
    }
}




// On a crée une fonction saveScore
func saveScore(){
// Ici on a fais passer des variable de type Int en type String
    let scoreR = String(scoreRecord)
    
    var scoreA = String(scoreActuel)
// On a crée une condition que si le score actuel est plus grand ou egal au score record alors on enregistre le scoreActuel et on mets un son positif
    if scoreActuel >= scoreRecord{
        
        player2.play()
        scoreA = scoreR
        
        UserDefaults.standard.setValue("bestScore", forKey: scoreA)
    
    }else{
// Sinon on met un son négatif
        player3.play()
    }
}

// On a crée une fonction getScore
func getScore() -> String {
    
    let scoreR = String(scoreRecord)
    
// On  récupère object dans le UserDefault stocké à la clé "bestScore"
    if ( UserDefaults.standard.object(forKey: "bestScore") == nil)
    {
// On sauvegarde cette base
        UserDefaults.standard.setValue(scoreRecord, forKey: scoreR)
    }
// et on retourne le score a la clé "bestScore" 
    return UserDefaults.standard.object(forKey: "bestScore") as! String
}


 
