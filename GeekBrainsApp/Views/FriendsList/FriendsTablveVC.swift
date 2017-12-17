//
//  FriendsTableViewController.swift
//  GeekBrainsApp
//
//  Created by Laptev Sasha on 03/12/2017.
//  Copyright © 2017 Laptev Sasha. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class FriendsTablveVC: UITableViewController {
    var friendsList: [UserInfo] = []
    @IBOutlet var friendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFriendsList()
    }
        
    var environment: Environment {
        return EnvironmentImp.VKEnvironment()
    }
    
    func loadFriendsList(){
        let tabsVC = navigationController?.tabBarController as! TabsVCProtocol
        let userService = UserService(environment: environment, token: tabsVC.token)
        userService.downloadFriendsList(){
             [weak self] in
            self?.loadFriends()
            self?.tableView?.reloadData()
        }
        
    }

    func loadFriends()-> [UserInfo]{
        do{
            let realm = try Realm()
            self.friendsList = Array(realm.objects(UserInfo.self))
        }
        catch{
            print(error)
        }
        return [UserInfo]()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCellView", for: indexPath) as! UserCell
        cell.nameLabel.text = friendsList[indexPath.row].name
        if let url = URL(string: friendsList[indexPath.row].photoUrl){
        let data = try? Data(contentsOf: url) 
            cell.avatarImageView.image = UIImage(data: data!)}
        else{
            cell.avatarImageView.image = #imageLiteral(resourceName: "no_avatar")
        }
        return cell
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhotos",
            let ctrl = segue.destination as? PhotoCollectionVC,
            let indexpath = tableView.indexPathForSelectedRow{
            let id = friendsList[indexpath.row].id
            ctrl.userId = id
        }
    }
}
