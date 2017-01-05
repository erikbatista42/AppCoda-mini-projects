//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Erik Batista on 12/29/16.
//  Copyright © 2016 swiftlang.eu. All rights reserved.
//

import UIKit
import MapKit

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
    
    @IBAction func ratingButtonTapped(segue: UIStoryboardSegue) {
        if let rating = segue.identifier {
            restaurant.isVisited = true
            
            switch rating {
            case "great": restaurant.rating = "Absolutely love it! Must try."
            case "good": restaurant.rating = "Preety good."
            case "dislike": restaurant.rating = "I don't like it."
            default: break
            }
        }
        tableView.reloadData()
    }
    
    @IBOutlet var mapView: MKMapView!
    
    func showMap() {
        performSegue(withIdentifier: "showMap", sender: self)
    }

        override func viewDidLoad() {
            super.viewDidLoad()
        
            // Do any additional setup after loading the view.
            restaurantImageView.image = UIImage(named: restaurant.image)
            
            tableView.separatorColor = UIColor.white
            
            title = restaurant.name
            
            tableView.estimatedRowHeight = 36.0
            tableView.rowHeight = UITableViewAutomaticDimension
            
            //Use UITapGestureRecognizer to detect tap gesture on map
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMap))
            mapView.addGestureRecognizer(tapGestureRecognizer)
            
      
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
            cell.valueLabel.text = (restaurant.isVisited) ?"Yes, I've been here before. \(restaurant.rating)": "No"
        case 4:
            cell.fieldLabel.text = "Phone:"
            cell.valueLabel.text = restaurant.phone
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReview" {
            let destinationController = segue.destination as! ReviewViewController
            destinationController.restaurant = restaurant
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

}
