//
//  FAQViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 25/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController {

    
    @IBOutlet weak var whatIsActicButton: UIButton!
    @IBOutlet weak var whatIsActicLabel: UILabel!
    
    @IBOutlet weak var howBadIsTheSituationButton: UIButton!
    @IBOutlet weak var howBadIsTheSituationLabel: UILabel!
    
    @IBOutlet weak var whatCanIDoToHelpButton: UIButton!
    @IBOutlet weak var whatCanIDoToHelpLabel: UILabel!
    
    @IBOutlet weak var whyThereAre7CategoriesButton: UIButton!
    @IBOutlet weak var whyThereAre7CategoriesLabel: UILabel!
    
    @IBOutlet weak var whatIsTheIdeaLimitButton: UIButton!
    @IBOutlet weak var whatIsTheIdeaLimitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whatIsActicLabel.isHidden = true
        howBadIsTheSituationLabel.isHidden = true
        whatCanIDoToHelpLabel.isHidden = true
        whyThereAre7CategoriesLabel.isHidden = true
        whatIsTheIdeaLimitLabel.isHidden = true
        
    }

    @IBAction func whatIsActicClick(_ sender: Any) {
        if whatIsActicLabel.isHidden{
            animate(toogle: true, type: whatIsActicButton)
        }
        else{
            animate(toogle: false, type: whatIsActicButton)
        }
    }
    
    @IBAction func howBadIsTheSituationClick(_ sender: Any) {
        if howBadIsTheSituationLabel.isHidden{
            animate(toogle: true, type: howBadIsTheSituationButton)
        }
        else{
            animate(toogle: false, type: howBadIsTheSituationButton)
        }
    }
    
    @IBAction func whatCanIDoToHelpClick(_ sender: Any) {
        if whatCanIDoToHelpLabel.isHidden{
            animate(toogle: true, type: whatCanIDoToHelpButton)
        }
        else{
            animate(toogle: false, type: whatCanIDoToHelpButton)
        }
    }
    
    @IBAction func whyThereAre7CategoriesClick(_ sender: Any) {
        if whyThereAre7CategoriesLabel.isHidden{
            animate(toogle: true, type: whyThereAre7CategoriesButton)
        }
        else{
            animate(toogle: false, type: whyThereAre7CategoriesButton)
        }
    }
    
    @IBAction func whatIsTheIdeaLimitClick(_ sender: Any) {
        if whatIsTheIdeaLimitLabel.isHidden{
            animate(toogle: true, type: whatIsTheIdeaLimitButton)
        }
        else{
            animate(toogle: false, type: whatIsTheIdeaLimitButton)
        }
    }
    
    func animate(toogle:Bool, type: UIButton){
        if type == whatIsActicButton {
            if howBadIsTheSituationLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.howBadIsTheSituationLabel.isHidden = true
                }
            }
            else if whatCanIDoToHelpLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatCanIDoToHelpLabel.isHidden = true
                }
            }
            else if whyThereAre7CategoriesLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whyThereAre7CategoriesLabel.isHidden = true
                }
            }
            else if whatIsTheIdeaLimitLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatIsTheIdeaLimitLabel.isHidden = true
                }
            }
            
            if toogle{
                UIView.animate(withDuration: 1){
                    self.whatIsActicLabel.isHidden = false
                }
            }
            else{
                UIView.animate(withDuration: 1){
                    self.whatIsActicLabel.isHidden = true
                }
            }
        }
        else if type == howBadIsTheSituationButton{
            if whatIsActicLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatIsActicLabel.isHidden = true
                }
            }
            else if whatCanIDoToHelpLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatCanIDoToHelpLabel.isHidden = true
                }
            }
            else if whyThereAre7CategoriesLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whyThereAre7CategoriesLabel.isHidden = true
                }
            }
            else if whatIsTheIdeaLimitLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatIsTheIdeaLimitLabel.isHidden = true
                }
            }
            
            if toogle{
                UIView.animate(withDuration: 1){
                    self.howBadIsTheSituationLabel.isHidden = false
                }
            }
            else{
                UIView.animate(withDuration: 1){
                    self.howBadIsTheSituationLabel.isHidden = true
                }
            }
        }
        else if type == whatCanIDoToHelpButton{
            if howBadIsTheSituationLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.howBadIsTheSituationLabel.isHidden = true
                }
            }
            else if whatIsActicLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatIsActicLabel.isHidden = true
                }
            }
            else if whyThereAre7CategoriesLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whyThereAre7CategoriesLabel.isHidden = true
                }
            }
            else if whatIsTheIdeaLimitLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatIsTheIdeaLimitLabel.isHidden = true
                }
            }
            
            if toogle{
                UIView.animate(withDuration: 1){
                    self.whatCanIDoToHelpLabel.isHidden = false
                }
            }
            else{
                UIView.animate(withDuration: 1){
                    self.whatCanIDoToHelpLabel.isHidden = true
                }
            }
        }
        else if type == whyThereAre7CategoriesButton{
            if howBadIsTheSituationLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.howBadIsTheSituationLabel.isHidden = true
                }
            }
            else if whatCanIDoToHelpLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatCanIDoToHelpLabel.isHidden = true
                }
            }
            else if whatIsActicLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatIsActicLabel.isHidden = true
                }
            }
            else if whatIsTheIdeaLimitLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatIsTheIdeaLimitLabel.isHidden = true
                }
            }
            
            if toogle{
                UIView.animate(withDuration: 1){
                    self.whyThereAre7CategoriesLabel.isHidden = false
                }
            }
            else{
                UIView.animate(withDuration: 1){
                    self.whyThereAre7CategoriesLabel.isHidden = true
                }
            }
        }
        else if type == whatIsTheIdeaLimitButton{
            if howBadIsTheSituationLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.howBadIsTheSituationLabel.isHidden = true
                }
            }
            else if whatCanIDoToHelpLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatCanIDoToHelpLabel.isHidden = true
                }
            }
            else if whyThereAre7CategoriesLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whyThereAre7CategoriesLabel.isHidden = true
                }
            }
            else if whatIsActicLabel.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.whatIsActicLabel.isHidden = true
                }
            }
            
            if toogle{
                UIView.animate(withDuration: 1){
                    self.whatIsTheIdeaLimitLabel.isHidden = false
                }
            }
            else{
                UIView.animate(withDuration: 1){
                    self.whatIsTheIdeaLimitLabel.isHidden = true
                }
            }
        }
    }
}
