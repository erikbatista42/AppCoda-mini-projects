//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Erik Batista on 12/25/16.
//  Copyright © 2016 swiftlang.eu. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    
    var restaurantIsNotVisited = Array(repeating: false, count: 21)
    
    var restaurantIsVisited = Array(repeating: false, count: 21)

    
    
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", image: "cafedeadend.jpg", phone: "232-923423", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", image: "homei.jpg", phone: "348-233423", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "teakha.jpg", phone: "354-243523", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "cafeloisl.jpg", phone: "453-333423", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "petiteoyster.jpg", phone: "983-284334", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", image: "forkeerestaurant.jpg", phone: "232-434222", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", image: "posatelier.jpg", phone: "234-834322", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", image: "bourkestreetbakery.jpg", phone: "982-434343", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", image: "haighschocolate.jpg", phone: "734-232323", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", image: "palominoespresso.jpg", phone: "872-734343", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", image: "upstate.jpg", phone: "343-233221", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", image: "traif.jpg", phone: "985-723623", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", image: "grahamavenuemeats.jpg", phone: "455-232345", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", image: "wafflewolf.jpg", phone: "434-232322", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", image: "fiveleaves.jpg", phone: "343-234553", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", image: "cafelore.jpg", phone: "342-455433", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", image: "confessional.jpg", phone: "643-332323", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", image: "barrafina.jpg", phone: "542-343434", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", image: "donostia.jpg", phone: "722-232323", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", image: "royaloak.jpg", phone: "343-988834", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", image: "caskpubkitchen.jpg", phone: "432-344050", isVisited: false)
    ]  ///////
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
            
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete",handler: { (action, indexPath) -> Void in
            
            // Delete the row from the data source
            self.restaurants.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            restaurants.remove(at: indexPath.row)
        }
        
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
                //Table View background color
        tableView.backgroundColor = UIColor(red: 107.0/255.0, green: 185.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        
                //Table view seperator color
        tableView.separatorColor = UIColor(red: 30.0/255.0, green: 139.0/255.0, blue: 195.0/255.0, alpha: 0.8)
        
                //NavigationBar background color, text font, and font size
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 30.0/255.0, green: 139.0/255.0, blue: 195.0/255.0, alpha: 0.8)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 21)!]
        
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            //Disable the navigation bar on swipe
        navigationController?.hidesBarsOnSwipe = true
        
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
                    //Action Menu
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//        
//        //add actions to the menu
//        
//        //check-in action
//        
//        
//        let checkInAction = UIAlertAction(title: "Check in", style: .default, handler: {
//            (action: UIAlertAction!) -> Void in
//            
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .checkmark
//            self.restaurantIsVisited[indexPath.row] = true
//        })
//        
//        let undoCheckInAction = UIAlertAction(title: "Undo Check in", style: .default) {
//            (action: UIAlertAction!) -> Void in
//            
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .none
//            self.restaurantIsNotVisited[indexPath.row] = true
//            
//        }
//            
//        tableView.deselectRow(at: indexPath, animated: true)
//            //Options in menu
//        optionMenu.addAction(undoCheckInAction)
//        
//        optionMenu.addAction(checkInAction)
//            //----
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        
//        let callActionHandler = { (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet, please retry later", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//        
//    let callAction = UIAlertAction(title: "Call " + "347-745-4934\(indexPath.row)", style: .default, handler: callActionHandler)
//    optionMenu.addAction(callAction)
//        
//        //Display the menu
//        present(optionMenu, animated: true, completion: nil)
//        
//    }
    
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
//        cell.imageView?.layer.cornerRadius = (cell.imageView?.frame.size.width)! / 2;
//        cell.imageView?.clipsToBounds = true
        
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
        cell.backgroundColor = UIColor.clear
        
                        //Checkmark-in
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            restaurants.remove(at: indexPath.row)
//        }
//        
//        tableView.deleteRows(at: [indexPath], with: .fade)
     return cell
  }
//    
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
   
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
