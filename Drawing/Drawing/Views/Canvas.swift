//
//  Canvas.swift
//  Drawing
//
//  Created by 최은지 on 04/04/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    // public function
    fileprivate var strokeColor = UIColor.black
    fileprivate var strokeWidth: Float = 1
    
    func setStrokeWidth(width: Float){
        self.strokeWidth = width
    }
    
    func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }
    
    
    func undo(){
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clear(){
        lines.removeAll()
        setNeedsDisplay()
    }
    
    var lines = [Line]()
    
    override func draw(_ rect: CGRect) {
        
        
        super.draw(rect)
        print("sda")
        guard let context = UIGraphicsGetCurrentContext() else
        { return }
        
        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.storkeWidth))
            context.setLineCap(.round)
            for (i,p) in line.points.enumerated() {
                if i==0{ // first index
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(storkeWidth: strokeWidth, color: strokeColor, points: []))
    }
    
    // track the finger as we move across screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
//                print(point)
        
        guard var lastLine = lines.popLast() else { return }
        lastLine.points.append(point)
        lines.append(lastLine)
        
        
        setNeedsDisplay()
    }
    
}
