//
//  ViewController.swift
//  CoverFlowTest
//
//  Created by Next on 25/04/17.
//  Copyright © 2017 Next. All rights reserved.
//

import UIKit

class ViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {

    @IBOutlet weak var mCarouselView: iCarousel!
    
    @IBOutlet weak var mNavigationView: UIView!
    var items: [Int] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0...10{
            items.append(i)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mCarouselView.type = iCarouselType.coverFlow2
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        mCarouselView.currentItemIndex = 3
    }
    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        var itemView: UIView
        
        //reuse view if available, otherwise create a new view
        if let view = view {
            itemView = view
            //get a reference to the label in the recycled view
            label = itemView.viewWithTag(1) as! UILabel
        } else {
            //don't do anything specific to the index within
            //this `if ... else` statement because the view will be
            //recycled and used with other index values later
            itemView = UIView(frame: CGRect(x: 0, y: 0, width: carousel.frame.width*0.5, height: carousel.frame.height*0.8))
            itemView.backgroundColor = UIColor.cyan
            label = UILabel(frame: itemView.bounds)
            label.backgroundColor = .clear
            label.textAlignment = .center
            label.font = label.font.withSize(50)
            label.tag = 1
            
            let customView = UIView(frame: CGRect(x: 0, y: 0, width: carousel.frame.width*0.5-5, height: carousel.frame.height*0.8-5))
            customView.backgroundColor = UIColor.lightGray
            customView.center = itemView.center
            customView.addSubview(label)
            
            itemView.addSubview(customView)
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        label.text = "\(items[index])"
        
        return itemView
    }
    func carousel(_ carousel: iCarousel, shouldSelectItemAt index: Int) -> Bool {
        print("should : -\(index)")
        if carousel.currentItemIndex == index{
            return true
        }
        return true
    }
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        print(index)
    }
    func carousel(_ carousel: iCarousel, itemTransformForOffset offset: CGFloat, baseTransform transform: CATransform3D) -> CATransform3D {
        return CATransform3D.init(
            m11: 1, m12: 0, m13: 0, m14: 0,
            m21: 0, m22: 1, m23: 0, m24: 0,
            m31: 0, m32: 0, m33: 1, m34: 0,
            m41: 0, m42: 0, m43: 0, m44: 1)
    }
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        switch option {
        case .spacing:
            return value*6
        case .tilt:
            return value*0.1
        default:
            return value
        }
    }

    var isBool  = true
    @IBAction func ButtonTapped(_ sender: UIButton) {
        if isBool{
            
        }
        
    }
}

