//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Erik Batista on 1/2/17.
//  Copyright © 2017 swiftlang.eu. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var restaurantImageView: UIImageView!
    var restaurant:RestaurantMO?

    
    @IBOutlet var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
                   //Pass image data through segue
        if let restaurant = restaurant {
            restaurantImageView.image = UIImage(data: restaurant.image as! Data)
        }
        
        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)

        //Do image animation
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y:0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        
        //Do X button animation
//        let secondTransform = CGAffineTransform.init(scaleX: 100, y:0)
//        let secondTranslateTransform = CGAffineTransform.init(translationX:0, y:0)
//let secondCombineTransform = secondTransform.concatenating(secondTranslateTransform)
        closeButton.transform = CGAffineTransform.init(translationX: 1000, y:0)
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0, animations: {
            self.containerView.transform = CGAffineTransform.identity
            self.closeButton.transform = CGAffineTransform.identity
        })
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


