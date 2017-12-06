//: Playground - noun: a place where people can play

// Eric Sticchi Zambom
// Swift Playgrounds - 2017

import UIKit
import PlaygroundSupport


class StopWatchViewController: UIViewController {
    
    var time = 0
    
    var timeLabel = "0"

        // Timer
        var timer: Timer?
    
    //Componente Interface
    
    // Segundos
    let secondsLabel: UILabel = {
    let second = UILabel()
    second.font = UIFont.systemFont(ofSize: 60)
    second.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    second.text = "00"
        
    return second
    }()
    
    
    // Horas
    let hourLabel: UILabel = {
    let hours = UILabel()
    hours.font = UIFont.systemFont(ofSize: 60)
    hours.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    hours.text = "00"
        
    return hours
    } ()
 
    
    // Minutos
    let minuteLabel: UILabel = {
    let minutes = UILabel()
    minutes.font = UIFont.systemFont(ofSize: 60)
    minutes.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    minutes.text = "00"
    
    return minutes
    } ()


    //Time String
    func timeString(time: TimeInterval) -> String {
    let hours = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) // Set my background color
        self.title = "Stop Watch"
            
            
        view.addSubview(hourLabel)
            
        view.addSubview(minuteLabel)

        view.addSubview(secondsLabel)
            
            
        // :
        let separation1Label = UILabel()
        separation1Label.font = UIFont.systemFont(ofSize: 60)
        separation1Label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        separation1Label.text = ":"
    
        view.addSubview(separation1Label)
        
        
        // :
        let separation2Label = UILabel()
        separation2Label.font = UIFont.systemFont(ofSize: 60)
        separation2Label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        separation2Label.text = ":"
            
        view.addSubview(separation2Label)

            
        //Botão Start
        let startButton = UIButton(type: .roundedRect)
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        startButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        startButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        view.addSubview(startButton)
            
            
        //Botão Stop
        let stopButton = UIButton(type: .roundedRect)
        stopButton.setTitle("Stop", for: .normal)
        stopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)
        stopButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        view.addSubview(stopButton)
            
            
        //Botão Clear
        let clearButton = UIButton(type: .roundedRect)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
                clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        clearButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        view.addSubview(clearButton)
            
            
        func action() {
             time += 1
             timeLabel = String(time)
             secondsLabel.text = timeLabel
        }


            
            
        // Layout 
            hourLabel.translatesAutoresizingMaskIntoConstraints = false
            minuteLabel.translatesAutoresizingMaskIntoConstraints = false
            secondsLabel.translatesAutoresizingMaskIntoConstraints = false
            separation1Label.translatesAutoresizingMaskIntoConstraints = false
            separation2Label.translatesAutoresizingMaskIntoConstraints = false
            startButton.translatesAutoresizingMaskIntoConstraints = false
            stopButton.translatesAutoresizingMaskIntoConstraints = false
            clearButton.translatesAutoresizingMaskIntoConstraints = false


            
            NSLayoutConstraint.activate([
                hourLabel.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
                hourLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
                minuteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                minuteLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
                secondsLabel.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
                secondsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
                startButton.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 235),
                startButton.centerYAnchor.constraint(equalTo: secondsLabel.bottomAnchor, constant: 60),
                separation1Label.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 135),
                separation1Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 245),
                separation2Label.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 245),
                separation2Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 245),
                stopButton.centerXAnchor.constraint(equalTo: hourLabel.leadingAnchor, constant: 100),
                stopButton.centerYAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 60),
                clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                clearButton.centerYAnchor.constraint(equalTo: minuteLabel.bottomAnchor, constant: 120)
                ])

        
    }// End of viewDidLoad
 
    @objc private func start(sender: UIButton){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo:nil, repeats:true)
    }
    
    @objc private func stop(sender: UIButton){
        timer?.invalidate()
    }
    
    @objc private func clear(sender: UIButton){
        timer?.invalidate()
        time = 0
        secondsLabel.text = "00"
    }
    
    func action() {
        time += 1
        timeLabel = String(time)
        secondsLabel.text = timeLabel
    }
    
}


class TimerViewController: UIViewController {
    
    var time = 60
    
    var timeLabel = "0"
    
    // Timer
    var timer: Timer?
    
    //Componente Interface
    
    // Segundos
    let secondsLabel: UILabel = {
        let second = UILabel()
        second.font = UIFont.systemFont(ofSize: 60)
        second.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        second.text = "00"
        
        return second
    }()
    
    //Time String
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) // Set my background color
        self.title = "Timer"
        
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo:nil, repeats:true)
        
        
        // Horas
        let hourLabel = UILabel()
        hourLabel.font = UIFont.systemFont(ofSize: 60)
        hourLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        hourLabel.text = "00"
        
        view.addSubview(hourLabel)
        
        // Minutos
        let minuteLabel = UILabel()
        minuteLabel.font = UIFont.systemFont(ofSize: 60)
        minuteLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        minuteLabel.text = "00"
        
        view.addSubview(minuteLabel)
        
        view.addSubview(secondsLabel)
        
        
        // :
        let separation1Label = UILabel()
        separation1Label.font = UIFont.systemFont(ofSize: 60)
        separation1Label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        separation1Label.text = ":"
        
        view.addSubview(separation1Label)
        
        
        // :
        let separation2Label = UILabel()
        separation2Label.font = UIFont.systemFont(ofSize: 60)
        separation2Label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        separation2Label.text = ":"
        
        view.addSubview(separation2Label)
        
        
        //Botão Start
        let startButton = UIButton(type: .roundedRect)
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        startButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        startButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(startButton)
        
        
        //Botão Stop
        let stopButton = UIButton(type: .roundedRect)
        stopButton.setTitle("Stop", for: .normal)
        stopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)
        stopButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(stopButton)
        
        
        //Botão Clear
        let clearButton = UIButton(type: .roundedRect)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        clearButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(clearButton)
        
        
        func action() {
            time += 1
            timeLabel = String(time)
            secondsLabel.text = timeLabel
        }
        
        
        
        
        // Layout
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        minuteLabel.translatesAutoresizingMaskIntoConstraints = false
        secondsLabel.translatesAutoresizingMaskIntoConstraints = false
        separation1Label.translatesAutoresizingMaskIntoConstraints = false
        separation2Label.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            hourLabel.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            hourLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            minuteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minuteLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            secondsLabel.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
            secondsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            startButton.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 235),
            startButton.centerYAnchor.constraint(equalTo: secondsLabel.bottomAnchor, constant: 60),
            separation1Label.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 135),
            separation1Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 245),
            separation2Label.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 245),
            separation2Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 245),
            stopButton.centerXAnchor.constraint(equalTo: hourLabel.leadingAnchor, constant: 100),
            stopButton.centerYAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 60),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearButton.centerYAnchor.constraint(equalTo: minuteLabel.bottomAnchor, constant: 120)
            ])
        
        
    }// End of viewDidLoad
    
    @objc private func start(sender: UIButton){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo:nil, repeats:true)
    }
    
    @objc private func stop(sender: UIButton){
        timer?.invalidate()
    }
    
    @objc private func clear(sender: UIButton){
        timer?.invalidate()
        time = 60
        secondsLabel.text = "00"
    }
    
    func action() {
        time -= 1
        if time == 0 {
            timer?.invalidate()
        }
        timeLabel = String(time)
        secondsLabel.text = timeLabel
    }
    
}// End of FormViewController


class MyTabBarController: UITabBarController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // My Stop Watch View Controller
        let stopWatchViewController = StopWatchViewController()
        let tabBarItem1 = UITabBarItem(title: "Stop Watch", image: nil , tag: 1)
        stopWatchViewController.tabBarItem = tabBarItem1
        
        
        // My Timer View Controller
        let timerViewController = TimerViewController()
        let tabBarItem2 = UITabBarItem(title: "Timer", image: nil , tag: 2)
        timerViewController.tabBarItem = tabBarItem2
        
        // Setup my two ViewController into my TabBarController
        self.viewControllers = [stopWatchViewController, timerViewController]
        
    }
    
}





// PlaygroundPage.current.liveView = MyTableViewController()

PlaygroundPage.current.liveView = UINavigationController(rootViewController: MyTabBarController())

// PlaygroundPage.current.liveView = MyTabBarController()
