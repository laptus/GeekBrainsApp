//
//  PhotoCollectionViewController.swift
//  GeekBrainsApp
//
//  Created by Laptev Sasha on 04/12/2017.
//  Copyright © 2017 Laptev Sasha. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class PhotoCollectionVC: UICollectionViewController {
    
    var photoList: [PhotoInfo] = []
    var userId: Int = 0
    
    
    var labelPhotoText=""
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserPhotos()
    }

    var environment: Environment {
        return EnvironmentImp.VKEnvironment()
    }
    
    func loadUserPhotos(){
        let tabsVC = navigationController?.tabBarController as! TabsVCProtocol
        let UserServie = UserService(environment: environment, token: tabsVC.token)
        UserServie.downloadPhoto(forUser: userId){
            [weak self] in
            // сохраняем полученные данные в массиве, чтобы коллекция могла получить к ним доступ
            self?.loadPhotos()
            // коллекция должна прочитать новые данные
            self?.collectionView?.reloadData()
        }
        
    }
    
    func loadPhotos(){
        do{
            let realm = try Realm()
            self.photoList = Array(realm.objects(PhotoInfo.self))
        }
        catch{
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoViewCell", for: indexPath) as! PhotoCell
        let url = URL(string: photoList[indexPath.row].url)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        cell.photoImage.image = UIImage(data: data!)
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    
}
