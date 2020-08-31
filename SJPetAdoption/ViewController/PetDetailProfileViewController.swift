//
//  PetDetailProfileViewController.swift
//  SJPetAdoption
//
//  Created by Zero on 2020/8/30.
//  Copyright © 2020 Zero. All rights reserved.
//

import UIKit

class PetDetailProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var petDetail:PetDetailProfileModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    func initView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        self.tableView.register(PetDetailTableViewCell.self, forCellReuseIdentifier: "PetDetailTableViewCell")
    }
}

extension PetDetailProfileViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row != 11 ? 44 : 80)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PetDetailTableViewCell", for: indexPath) as? PetDetailTableViewCell else {
            fatalError()
        }
        
        cell.parsingPetDetail(With: petDetail, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let petImageView:UIImageView?
        petImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 180, height: 180))
        
        if  let url = URL(string: petDetail?.album_file ?? "") {
             let data = try! Data(contentsOf: url )
            petImageView?.image = UIImage(data: data)
        }
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        headerView.backgroundColor = UIColor.white
        headerView.addSubview(petImageView!)
        
        return headerView
    }
}
