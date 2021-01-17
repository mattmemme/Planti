//
//  HomeViewController.swift
//  Planti
//
//  Created by Matthew Memme on 2021-01-17.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func nextViewButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "PictureSegue", sender: self)
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var weather = [WeatherData]()
    var temperature: Temperature?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Toronto&appid=d2e462852b5f64f596aa499ee47ed52d"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                
                if let jsonWeather = try? decoder.decode(Weather.self, from: data) {
                    weather = jsonWeather.weather
                    print(weather)
                    weatherLabel.text = weather[0].main
                }
                if let jsonMain = try? decoder.decode(TemperatureData.self, from: data) {
                    temperature = jsonMain.main
                    print(temperature)
                    temperatureLabel.text = "\(temperature!.temp)"
                }
                return
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
}
