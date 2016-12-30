//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Erik Batista on 12/29/16.
//  Copyright © 2016 swiftlang.eu. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet var restaurantImageView:UIImageView!
   var restaurant:Restaurant!
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
        var restaurantName = Restaurant!.self
    
    @IBOutlet weak var restaurantTypeLabel: UILabel!
        var restaurantLabel = Restaurant!.self
    
    @IBOutlet weak var restaurantLocationLabel: UILabel!
        var restaurantLocations = Restaurant!.self

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            restaurantImageView.image = UIImage(named: restaurant.image)
//            restaurantNameLabel.text = restaurant.name
//            restaurantTypeLabel.text = restaurant.type
//            restaurantLocationLabel.text = restaurant.location
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
