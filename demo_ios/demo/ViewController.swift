//
//  ViewController.swift
//  demo
//
//  Created by STLABD233 on 01/08/22.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    // Make a button to call the showFlutter function when pressed.
    let button = UIButton(type:UIButton.ButtonType.custom)
    button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
    button.setTitle("Show Flutter!", for: UIControl.State.normal)
      button.center = self.view.center
    button.frame = CGRect(x: 80.0, y: 150.0, width: 160.0, height: 40.0)
    button.backgroundColor = UIColor.blue
    self.view.addSubview(button)
      
        // Do any additional setup after loading the view.
    }
  @objc func showFlutter() {
 
        
 
        let flutterEngine = ((UIApplication.shared.delegate as? AppDelegate)?.flutterEngine)!;
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil);
        self.present(flutterViewController, animated: true, completion: nil)
        
        let bmiDataChannel = FlutterMethodChannel(name: "com.example.demo/data", binaryMessenger: flutterViewController.binaryMessenger)
        
        let jsonObject: NSMutableDictionary = NSMutableDictionary()
        jsonObject.setValue(34, forKey: "count") 
        
        var convertedString: String? = nil
        
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions.prettyPrinted)
            convertedString = String(data: data1, encoding: String.Encoding.utf8)
        } catch let myJSONError {
            print(myJSONError)
        }
        
        bmiDataChannel.invokeMethod("fromHostToClient", arguments: convertedString)
        print("Platform chanel called")
        
        
    }

}

