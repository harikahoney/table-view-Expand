//
//  ViewController.swift
//  TableView1
//
//  Created by R Shantha Kumar on 12/23/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {
   
    
    
    
       var name1  = [String]()
       var age    = [String]()
       var email  = [String]()
       var images = [UIImage]()

       var tableView:UITableView!
    
       var tollywood:[String] = []
       var bollywood:[String] = []
       var hollywood:[String] = []
    
       var tollywoodImages = [UIImage]()
       var bollywoodImages = [UIImage]()
       var hollywoodImages = [UIImage]()
    
       var desinfgation2 = [String]()
       var imageVie:UIImageView!
       var text4:String?
    
       var actorArray = [Actors]()
    
    
    override func viewDidLoad() {
    
                 super.viewDidLoad()
       
                 tableViewMerhod()
    
     let tollyWoodActors = Actors(ActorNames: tollywood, isExpand: true)
     let bollyWoodActors = Actors(ActorNames: bollywood, isExpand: true)
     let hollyWoodActors = Actors(ActorNames: hollywood, isExpand: true)
    
    actorArray = [tollyWoodActors,bollyWoodActors,hollyWoodActors]
   
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func edit(_ sender: Any) {
        
    tableView.isEditing = true
        
    }
    
func tableViewMerhod(){
   
        
    tableView = UITableView(frame: view.frame, style: UITableView.Style.grouped)
        
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "abc")
    
    view.addSubview(tableView)
    
        tableView.delegate = self
        tableView.dataSource = self
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//
//        if(indexPath.row % 2 == 0){
//
//            return UITableViewCell.EditingStyle.delete
//
//
//        }else{
//
//            return UITableViewCell.EditingStyle.insert
//        }
//
//
//
//
//    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
       
        }
  
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                
        let button = UIButton()
        button.backgroundColor = .black
        
        button.setTitle("expand", for: UIControl.State.normal)
        button.tag = section
        button.addTarget(self, action: #selector(eventForButton(ob:)), for: UIControl.Event.touchUpInside)
        return button
    }
    @objc func eventForButton(ob:UIButton){
        
        print("button \(ob.tag)")
       
    }
/*
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,       forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
           print("Deleted")

                if(indexPath.section == 0 ){
                
           self.tollywood.remove(at: indexPath.row)
        DBManager.shared.deleteData(entityName: "Contacts", deleteBasedOnColumn:"name" , value:tollywood[indexPath.row])
                }
                if(indexPath.section == 1 ){
                               
            self.bollywood.remove(at: indexPath.row)
   DBManager.shared.deleteData(entityName: "Contacts", deleteBasedOnColumn:"name" , value:bollywood[indexPath.row])
                }
                
                if(indexPath.section == 2 ){
                                   
                self.hollywood.remove(at: indexPath.row)
    DBManager.shared.deleteData(entityName: "Contacts", deleteBasedOnColumn:"name" , value:hollywood[indexPath.row])
                    
                    }
                
                
           self.tableView.deleteRows(at: [indexPath], with: .automatic)


           }
        

        tableView.reloadData()
        }
  */
func numberOfSections(in tableView: UITableView) -> Int {
    return actorArray.count
    }
    
    
    
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return actorArray[section].ActorNames!.count
    }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    
       let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
   
//     cell.translatesAutoresizingMaskIntoConstraints = true
       cell.heightAnchor.constraint(equalToConstant: 100).isActive = true
       cell.widthAnchor.constraint(equalToConstant: 100).isActive = true

//      cell.imageView?.heightAnchor.constraint(equalToConstant: 100).isActive = true
//      cell.imageView?.widthAnchor.constraint(equalToConstant: 100).isActive = true

    
    cell.textLabel!.text = actorArray[indexPath.section].ActorNames![indexPath.row]
      

    if(indexPath.section == 0){
        cell.textLabel?.text = tollywood[indexPath.row]
        cell.imageView?.image = tollywoodImages[indexPath.row]




    }
   else if(indexPath.section == 1){
    cell.textLabel?.text = bollywood[indexPath.row]
        cell.imageView?.image = bollywoodImages[indexPath.row]

    }
    else if(indexPath.section == 2){
        cell.textLabel?.text = hollywood[indexPath.row]
        cell.imageView?.image = hollywoodImages[indexPath.row]

    }
     
   
    
   

    cell.imageView?.layer.cornerRadius = cell.imageView!.frame.size.width/2
    cell.imageView?.clipsToBounds = true
       
        cell.textLabel!.numberOfLines = 0
        
        DBManager.shared.indexPath = indexPath.row

        return cell

        }
    
 
    
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let target = storyboard?.instantiateViewController(identifier: "abcde")
    
    navigationController?.pushViewController(target!, animated: true)
    
//    DBManager.shared.items3.append(items[indexPath.row])
   
        
        
        
    }
    
    
@IBAction func addContact(_ sender: Any) {
        
        
   
        
        let target = storyboard?.instantiateViewController(identifier: "abcd") as! TableViewController
        
        navigationController?.pushViewController(target, animated: true)
        
        
        
    }
    
    
    

    override func viewWillAppear(_ animated: Bool) {
       
 
        
        let data = DBManager.shared.fetchDAta(entityName: "Contacts")
     
//  fetching
                desinfgation2 = [String]()
                tollywood = [String]()
                bollywood = [String]()
                hollywood = [String]()
        
         tollywoodImages = [UIImage]()
         bollywoodImages = [UIImage]()
         hollywoodImages = [UIImage]()
        
        
                images = [UIImage]()
                var text:String!
       
                       
                
                for (i,x) in data.enumerated()
                {
                    
                  let path =   x.value(forKey: "designation") as? String ?? "empty"
                    
                    
                    desinfgation2.append(path)
                    
                    let defaultImage = UIImage(named: "defaultImage")
                    
                    
                   
                    let imageData = (defaultImage!.pngData()! as NSData)
                    

                    let imaged = x.value(forKey: "imageData") as? NSData ??  imageData
                    
                    let uiimage = UIImage(data:(imaged as? Data)!)


                    if let c = uiimage
                    {
                        
                        if(path == "tollywood"){
                            tollywoodImages.append(c)
                            
                        }
                        if(path == "bollywood"){
                            bollywoodImages.append(c)
                            
                        }
                        if(path == "hollywood"){
                            hollywoodImages.append(c)
                            
                        }
                    
                         
                       
                    }
              
                    
                    let name = x.value(forKey: "name") as? String ?? "empty"
                    print(name)
                    name1.append(name)
                    
                   
                    text = "Actor Name:\(name)"
                    
                    let aged = x.value(forKey: "age") as? String ?? "empty"
                    //print(aged)
                    age.append(aged)
                    
                    
                    text += "\n" + "Age:\(aged)"
                    text4 = aged
                    
                    let industry = x.value(forKey: "industry") as? String ?? "empty"
                    //print(emails)
                     text += "\n" + "Film Industry:\(industry)"
                    email.append(industry)
                    
                    
                    
                    
                    
// diffrentiate to industries
                    
                 if(path == "tollywood"){
                 tollywood.append(text)
                    print("tolly:", tollywood)
                
                     }
                    if(path == "bollywood"){
                           bollywood.append(text)
                        print("bolly:", bollywood)
                                   
                           }
                    if(path == "hollywood"){
                           hollywood.append(text)
                        print("holly:", hollywood)
                                   
                           }
                    
        }
                   tableView.reloadData()
        }
    
    
     
    
    
    

    
    
    
    
    
    
    
    
    

}

