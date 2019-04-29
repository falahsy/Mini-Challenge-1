//
//  HistoryViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 28/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController {

    @IBOutlet weak var currentMonthButton: UIButton!
    @IBOutlet weak var currentMonthStackDetail: UIStackView!
    @IBOutlet weak var lastMonthStackDetail: UIStackView!
    
    @IBOutlet weak var lastMonthButton: UIButton!
    //MARK: Legend rectangle
    
    @IBOutlet weak var legendBottleRect: UILabel!
    @IBOutlet weak var legendSpoonRect: UILabel!
    @IBOutlet weak var legendCupRect: UILabel!
    @IBOutlet weak var legendStrawRect: UILabel!
    @IBOutlet weak var legendBagRect: UILabel!
    @IBOutlet weak var legendCigaretteButtRect: UILabel!
    @IBOutlet weak var legendFoodPackagingRect: UILabel!
    @IBOutlet weak var pieChart: FRPieChartUIView!
    
    @IBOutlet weak var currentMonthUsage: UILabel!
    @IBOutlet weak var lastMonthUsage: UILabel!
    
    let database = try! Realm()
    var user = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonthStackDetail.isHidden = true
        lastMonthStackDetail.isHidden = true
        
        // Do any additional setup after loading the view.
        user = database.objects(Person.self)[0]
        
        legendBottleRect.backgroundColor = pieChart.color1
        legendSpoonRect.backgroundColor = pieChart.color2
        legendCupRect.backgroundColor = pieChart.color3
        legendStrawRect.backgroundColor = pieChart.color4
        legendBagRect.backgroundColor = pieChart.color5
        legendCigaretteButtRect.backgroundColor = pieChart.color6
        legendFoodPackagingRect.backgroundColor = pieChart.color7
        
        pieChart.categoriesData.append(Float(user.bottleUsage))
        pieChart.categoriesData.append(Float(user.spoonUsage))
        
        pieChart.categoriesData.append(Float(user.cupUsage))
        pieChart.categoriesData.append(Float(user.strawUsage))
        
        pieChart.categoriesData.append(Float(user.bagUsage))
        pieChart.categoriesData.append(Float(user.cigaretteUsage))
        
        pieChart.categoriesData.append(Float(user.foodPackaging))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let data:[Float] = [Float(user.bottleUsage),
                            Float(user.spoonUsage),
                            Float(user.cupUsage),
                            Float(user.strawUsage),
                            Float(user.bagUsage),
                            Float(user.cigaretteUsage),
                            Float(user.foodPackaging) ]
        pieChart.categoriesData = data
        pieChart.setNeedsDisplay()
    }
    
    @IBAction func currentMonthButtonClick(_ sender: Any) {
        if currentMonthStackDetail.isHidden{
            animate(toogle: true, type: currentMonthButton)
        }
        else{
            animate(toogle: false, type: currentMonthButton)
        }
    }
    
    @IBAction func lastMonthButtonClick(_ sender: Any) {
        if lastMonthStackDetail.isHidden{
            animate(toogle: true, type: lastMonthButton)
        }
        else{
            animate(toogle: false, type: lastMonthButton)
        }
    }
    
    
    func animate(toogle: Bool, type: UIButton) {
        if type == currentMonthButton{
            if lastMonthStackDetail.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.lastMonthStackDetail.isHidden = true
                }
            }
            
            if toogle{
                UIView.animate(withDuration: 1){
                    self.currentMonthStackDetail.isHidden = false
                }
            }
            else{
                UIView.animate(withDuration: 1){
                    self.currentMonthStackDetail.isHidden = true
                }
            }
        }
        else if type == lastMonthButton{
            if currentMonthStackDetail.isHidden == false{
                UIView.animate(withDuration: 1){
                    self.currentMonthStackDetail.isHidden = true
                }
            }
            if toogle{
                UIView.animate(withDuration: 1){
                    self.lastMonthStackDetail.isHidden = false
                }
            }
            else{
                UIView.animate(withDuration: 1){
                    self.lastMonthStackDetail.isHidden = true
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
