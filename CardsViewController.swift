//
//  CardsViewController.swift
//  TinderDemo
//
//  Created by Audrey Chaing on 11/10/16.
//  Copyright © 2016 Audrey Chaing. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var point = CGPoint()

    @IBOutlet weak var draggableImaveView: DraggableImageView!
    
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        self.present(profileViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        draggableImaveView.image = #imageLiteral(resourceName: "ryan")

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
