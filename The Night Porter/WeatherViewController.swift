//
//  WeatherViewController.swift
//  The Night Porter
//
//  Created by Shrey Mahendru on 2017-04-26.
//  Copyright © 2017 Shrey Mahendru. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather"
        
        let url = "http://www.weather-forecast.com/locations/Toronto/forecasts/latest"
        
        let nsUrl = URL(string: url)!
        
        let req = URLSession.shared.dataTask(with: nsUrl){
            data, response, error in
            print("in call back")
            if error == nil{
                print("no error")
                if let content = data{
                    print("data found")
                    let page =  String(data: content, encoding: String.Encoding.utf8)
                    let weather = page?.components(separatedBy: "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")[1].components(separatedBy: "</span>")[0]
                   let display = weather?.replacingOccurrences(of: "&deg;", with: "º") ?? "Network Error, Sorry :("
                    //self.weatherLabel.text =
                    //doing async here is very fast
                        DispatchQueue.main.async {
                          self.weatherLabel.text = display
                    }
                }
                
            }
        }
        
    req.resume()
        
        // Do any additional setup after loading the view.
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
