//
//  DrawLineViewController.swift
//  animations
//
//  Created by Karthik Kumar on 07/02/18.
//  Copyright © 2018 Karthik Kumar. All rights reserved.
//

import UIKit

class DrawLineViewController: UIViewController {
    
    let lineView = LineView(frame: CGRect.zero)

    override func loadView() {
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(lineView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let width = view.bounds.size.width - 20
        lineView.frame = CGRect(x: view.bounds.midX - width / 2,
                                y: view.bounds.midY,
                                width: width,
                                height: 20)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
