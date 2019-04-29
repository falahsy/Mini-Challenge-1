//
//  FRPieChartUIView.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 29/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit

@IBDesignable
class FRPieChartUIView: UIView {
    // MARK : @IBInspectable
    
    //must not bigger than width/2
    //@IBInspectable var arcWidth: CGFloat = 150
    
    //must not bigger than view width
    @IBInspectable var diameter: CGFloat = 300
    @IBInspectable var counter: Int = 5
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.blue
    @IBInspectable var counterColor2: UIColor = UIColor.yellow
    @IBInspectable var showLegend: Bool = true
    
    
    @IBInspectable var numberOfCategory: Int = 2
    @IBInspectable var categoriesData: [Float] = []
    @IBInspectable var categoriesLabel: [String] = ["Bottle", "Cup", "Bag", "Food Packaging", "Spoon or Fork", "Straw", "Cigarette Butt"]
    
    
    
    //var counterColorRange: [UIColor] = [UIColor.blue, UIColor.red, UIColor.green , UIColor.yellow, UIColor.cyan, UIColor.darkGray, UIColor.orange, UIColor.black]
    
    let color1 = UIColor(red:0.31, green:0.71, blue:0.20, alpha:1.0)
    let color2 = UIColor(red:0.802, green:0.232, blue:0.354, alpha:1.0)
    let color3 = UIColor(red:0.93, green:0.34, blue:0.11, alpha:1.0)
    let color4 = UIColor(red:0.044, green:0.815, blue:1.00, alpha:1.0)
    let color5 = UIColor(red:0.87, green:0.87, blue:0.00, alpha:1.0)
    let color6 = UIColor(red:0.052, green:0.232, blue:0.554, alpha:1.0)
    let color7 = UIColor(red:0.50, green:0.13, blue:0.322, alpha:1.0)
    
    var counterColorRange: [UIColor] = [
        UIColor(red:0.31, green:0.71, blue:0.20, alpha:1.0),
        UIColor(red:0.802, green:0.232, blue:0.354, alpha:1.0),
        UIColor(red:0.93, green:0.34, blue:0.11, alpha:1.0),
        UIColor(red:0.044, green:0.815, blue:1.00, alpha:1.0),
        UIColor(red:0.87, green:0.87, blue:0.00, alpha:1.0),
        UIColor(red:0.052, green:0.232, blue:0.554, alpha:1.0),
        UIColor(red:0.50, green:0.13, blue:0.322, alpha:1.0)
    ]
    
    
    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        //static let arcWidth: CGFloat = 150
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
        
        static let plusLineWidth: CGFloat = 17.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    func calculateCategoriesData()->Float{
        var sum: Float = 0
        for data in categoriesData{
            sum += data
        }
        return sum
    }
    
    override func draw(_ rect: CGRect) {
        
        //make sure diamater not out of bound
        let maxDiameter = min(diameter, bounds.width, bounds.height )
        
        let gapY = abs(bounds.height - diameter)
        let gapX = abs(bounds.width - diameter)
        
        if (diameter > maxDiameter){
            diameter = maxDiameter
        }
        //diameter = min(diameter, bounds.width, bounds.height )
        let radius = diameter/2
        
        
        let arcWidth: CGFloat = diameter/2
        
        //keliling dari lingkaran
        let keliling = Float(bounds.width * .pi)
        let halfKeliling = keliling / 2
        
        //nilai total dari nilai
        let total: Float = calculateCategoriesData()
        let x = keliling / total
        //let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        let center = CGPoint(x: (diameter + gapX ) / 2, y: (diameter) / 2 )
        
        // 2
        //let radius: CGFloat = max(bounds.width, bounds.height)
        
        //MARK: INIT ANGGLE
        var startAngle: CGFloat = 2 * .pi
        var endAngle: CGFloat = 2 * .pi
        var sumData: Float = 0
        var i: Int = 0
        for cdata in categoriesData{
            sumData += cdata
            endAngle = CGFloat(sumData * x / halfKeliling * .pi)
            let path = UIBezierPath(arcCenter: center,
                                    radius: radius - arcWidth/2,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
            path.lineWidth = arcWidth
            counterColorRange[i].setStroke()
            path.stroke()
            
            startAngle = endAngle
            i += 1
        }
        
        //MARK : draw Rectangle For label
        //set up the width and height variables
        //for the horizontal stroke
        //let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        //let halfPlusWidth = plusWidth / 2
        
        //create the path
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = Constants.plusLineWidth
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusPath.move(to: CGPoint(
            x: 150,
            y: 280 ))
        
        //add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(
            x: 200,
            y: 280))
        
        //set the stroke color
        UIColor.gray.setStroke()
        
        //draw the stroke
        //plusPath.stroke()
    }
}

