//
//  NewTaskViewController.swift
//  The Night Porter
//
//  Created by Shrey Mahendru on 2017-04-25.
//  Copyright © 2017 Shrey Mahendru. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taskDescription: UITextField!
    
    @IBOutlet weak var taskTag: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Task"
        // Do any additional setup after loading the view.
        
        //init the dletgate for key board functions
        taskDescription.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitTask(_ sender: Any) {
        
        let name = taskDescription.text! as String

       
        switch taskTag.selectedSegmentIndex{
        case 0:
            let new = Task(name: name, type: .Daily, completed: false, lastCompleted: nil)
            dailyTasks.append(new)
        case 1:
            let new = Task(name: name, type: .Weekly, completed: false, lastCompleted: nil)
            weeklyTasks.append(new)
        case 2:
            let new = Task(name: name, type: .biWeekly, completed: false, lastCompleted: nil)
            biweeklyTask.append(new)
        case 3:
            let new = Task(name: name, type: .Monthly, completed: false, lastCompleted: nil)
            biweeklyTask.append(new)
        default:
            break
        }
        
        let alert = UIAlertController(title: "New Task Created!",
                                      message: "",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
       let confirm = UIAlertAction(title: "Okay", style: .default, handler: changeView)
        
       alert.addAction(confirm)
        
    present(alert, animated: true, completion:nil )
        
    }
    
    func changeView( action : UIAlertAction ){
        self.navigationController?.popViewController(animated: true)
    }
    
    // this closes the editor when touches anywhere but keykoard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // this is done to close the keybourd on enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        taskDescription.resignFirstResponder()
        return true
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
