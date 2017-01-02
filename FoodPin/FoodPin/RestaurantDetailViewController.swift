//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Erik Batista on 12/29/16.
//  Copyright © 2016 swiftlang.eu. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var restaurantImageView:UIImageView!
   var restaurant:Restaurant!
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
        var restaurantName = Restaurant!.self
    
    @IBOutlet weak var restaurantTypeLabel: UILabel!
        var restaurantLabel = Restaurant!.self
    
    @IBOutlet weak var restaurantLocationLabel: UILabel!
        var restaurantLocations = Restaurant!.self
    
    @IBOutlet var tableView:UITableView!
    
    @IBAction func close(segue: UIStoryboardSegue) {
        
    }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            restaurantImageView.image = UIImage(named: restaurant.image)
//            restaurantNameLabel.text = restaurant.name
//            restaurantTypeLabel.text = restaurant.type
//            restaurantLocationLabel.text = restaurant.location
             tableView.separatorColor = UIColor.white
            
            
//            UINavigationBar.appearance().barTintColor = UIColor.red
//       
//            if let barFont = UIFont(name: "Avenir-Light", size: 24.0) {
//                UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red, NSFontAttributeName: barFont]
//            }
            
            title = restaurant.name
            
            tableView.estimatedRowHeight = 36.0
            tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailTableViewCell
        
        //configure the cell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type:"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location:"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Been here:"
            cell.valueLabel.text = (restaurant.isVisited) ?"Yes, I've been here before": "No"
        case 4:
            cell.fieldLabel.text = "Phone:"
            cell.valueLabel.text = restaurant.phone
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        return cell
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
