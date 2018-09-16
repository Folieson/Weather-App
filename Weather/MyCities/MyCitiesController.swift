//
//  MyCitiesController.swift
//  Weather
//
//  Created by Андрей Понамарчук on 16.09.2018.
//  Copyright © 2018 Андрей Понамарчук. All rights reserved.
//

import UIKit

class MyCitiesController: UITableViewController {
    
    var cities = [String]()
    
    @IBAction func addCity(segue: UIStoryboardSegue) {
        
        // Проверим идентификатор segue и убедимся, что это нужный нам переход
        if segue.identifier == "addCity" {
            
            // Получим ссылку на контроллер, с которого был совершен переход
            let allCitiesController = segue.source as! AllCitiesController
            
            // Получим индекс выделенной ячейки
            if let indexPath = allCitiesController.tableView.indexPathForSelectedRow {
                
                // Обратившись к массиву городов allCitiesController, получаем город, который соответствует выделенной ячейке
                let city = allCitiesController.cities[indexPath.row]
                
                // Проверяем, что такого города нет в списке
                if !cities.contains(city) {
                    
                    // Пролученный город добавляем в массив выбранных
                    cities.append(city)
                    
                    // Так как в массиве появился новый город, необходимо обновить данные, чтобы изменения применились
                    tableView.reloadData()
                }
                
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCitiesCell", for: indexPath) as! MyCitiesCell
        
        // Получаем город для конкретной строки
        let city = cities[indexPath.row]
        
        // Устанавливаем город для конкретной строки
        cell.cityName.text = city

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Если была нажата кнопка "Удалить"
        if editingStyle == .delete {
            
            // Удаляем город из массива
            cities.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


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
