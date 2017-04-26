//
//  TodoViewController.swift
//  The Night Porter
//
//  Created by Shrey Mahendru on 2017-04-18.
//  Copyright © 2017 Shrey Mahendru. All rights reserved.
//

import UIKit


//contents
var dailyTasks = [
    Task(name: "Check all doors", type: .Daily, completed: false, lastCompleted: nil),
    Task(name: "If it's freezing, check the water pipes outside", type: .Daily, completed: false, lastCompleted: nil),
    Task(name: "heck the mail box at the end of the lane", type: .Daily, completed: false, lastCompleted: nil)
]

var weeklyTasks = [
    Task(name: "Check inside all unoccupied cabins", type: .Weekly, completed: false, lastCompleted: nil),
    Task(name: "Run all faucets for 30 seconds", type: .Weekly, completed: false, lastCompleted: nil),
    Task(name: "Walk the perimeter of the property", type: .Weekly, completed: false, lastCompleted: nil),
]


var biweeklyTask = [
    Task(name: "Run test alarm", type: .biWeekly, completed: false, lastCompleted: nil),
    Task(name: "Check motion detectors", type: .biWeekly, completed: false, lastCompleted: nil),
    Task(name: "Check Smoke Alarms", type: .biWeekly, completed: false, lastCompleted: nil),
]

var MonthlyTask = [
    Task(name: "Month 1", type: .Monthly, completed: false, lastCompleted: nil),
    Task(name: "Month 2 work", type: .Monthly, completed: false, lastCompleted: nil),
    Task(name: "Month 3 task", type: .Monthly, completed: false, lastCompleted: nil),
]





class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    @IBOutlet weak var taskTableView: UITableView!
  
    
//    @IBOutlet weak var modeLabel: UILabel!
    
    @IBAction func toggleDarkMode(_ sender: UISwitch) {
        if sender.isOn{
            view.backgroundColor = UIColor.darkGray;
        }else{
            view.backgroundColor = UIColor.white;
        }
        
        
        
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        
        //alert the user 
        let confirm = UIAlertController(title: "Are you sure?", message: "Really reset the list?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: {
            action in
            for i in 0..<dailyTasks.count{
                dailyTasks[i].completed = false
            }
            for i in 0..<weeklyTasks.count{
                weeklyTasks[i].completed = false
            }
            for i in 0..<biweeklyTask.count{
                biweeklyTask[i].completed = false
            }
            for i in 0..<MonthlyTask.count{
                MonthlyTask[i].completed = false
            }
            self.taskTableView.reloadData()
            
        })
        
        let noAction = UIAlertAction(title: "No", style: .default, handler: {
        action in
            print("no action selected")
        })
        
        //add actions to the controller 
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
//        presentingViewController(confirm, animated: true, completion: nil)

        present(confirm, animated: true, completion:nil )
    }
    
    
    
    //overditting delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("You selected Row: \(indexPath.row) in Section: \(indexPath.section)")
    }
    
    //swipping on row
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let myAction = UITableViewRowAction(style: .normal, title: "Complete", handler:{
            //closure or lambda 
            action, indexPath in
            
            switch indexPath.section{
            case 0:
                dailyTasks[indexPath.row].completed = true
            case 1:
                weeklyTasks[indexPath.row].completed = true
            case 2:
                biweeklyTask[indexPath.row].completed = true
            case 3:
                MonthlyTask[indexPath.row].completed = true
            default:
                break
            }
            
            //refresh table
            tableView.reloadData()
            
            //tell tableView it's done editing, this will make the button go away
            tableView.isEditing = false
        } )
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: deleteTask)
        
        
        let actions = [myAction, deleteAction ]
        return actions
    }
    
    func deleteTask(action : UITableViewRowAction, indexPath : IndexPath){
        
        let confirm = UIAlertController(title: "Are you sure?", message: "Really Delete this task?", preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "No", style: .default, handler: {
            action in
            self.taskTableView.isEditing = false
        })
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler : {
            action in
            
            switch indexPath.section{
            case 0:
                dailyTasks.remove(at: indexPath.row)
            case 1:
                weeklyTasks.remove(at: indexPath.row)
            case 2:
                biweeklyTask.remove(at: indexPath.row)
            case 3:
                MonthlyTask.remove(at: indexPath.row)
            default:
                break
            }
            
            //refresh table
            self.taskTableView.reloadData()
            
            //tell tableView it's done ed
            self.taskTableView.isEditing = false
            
        })
        
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        
        present(confirm, animated: true, completion: nil)
        
        
    }
    
    
    //overriding the table viw methods
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear;
        return 4
    }
    
    //overriding the table viw methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return biweeklyTask.count
        case 3:
            return MonthlyTask.count
        default:
            return 0
        }
    }
    
    //overriding the table viw methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        var task :Task!
        
        switch indexPath.section {
        case 0:
            task = dailyTasks[indexPath.row]
        case 1:
            task = weeklyTasks[indexPath.row]
        case 2:
            task = biweeklyTask[indexPath.row]
        case 3:
            task = MonthlyTask[indexPath.row]
        default:
            break
        }
        cell.textLabel!.text = task.name
        cell.backgroundColor = UIColor.clear
        
        if task.completed {
            cell.textLabel!.textColor = UIColor.lightGray
            cell.accessoryType  = .checkmark
        }else{
            cell.textLabel!.textColor = UIColor.black
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.gray;
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Bi-Weekly Tasks"
            
        case 3:
            return "Monthly Tasks"

        default:
            return ""
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Todo List"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        taskTableView.reloadData()
    }


}

