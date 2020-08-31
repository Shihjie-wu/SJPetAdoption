//
//  PetDetailTableViewCell.swift
//  SJPetAdoption
//
//  Created by Zero on 2020/8/30.
//  Copyright © 2020 Zero. All rights reserved.
//

import UIKit

class PetDetailTableViewCell: UITableViewCell {
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func parsingPetDetail(With petContent: PetDetailProfileModel?, indexPath: IndexPath?) {
        
        switch indexPath?.row {
        case 0:
            self.textLabel?.text = "編號：\(String(petContent?.animal_subid ?? ""))"
            
        case 1:
            self.textLabel?.text = "實際所在地：\(String(petContent?.animal_place ?? ""))"
            self.textLabel?.numberOfLines = 0
            
        case 2:
            self.textLabel?.text = "性別：\(String(petContent?.animal_sex ?? ""))"
            
        case 3:
            self.textLabel?.text = "體型：\(String(petContent?.animal_bodytype ?? ""))"
            
        case 4:
            self.textLabel?.text = "毛色：\(String(petContent?.animal_colour ?? ""))"
            
        case 5:
            self.textLabel?.text = "年紀：\(String(petContent?.animal_age ?? ""))"
            
        case 6:
            self.textLabel?.text = "開放領養日期：\(String(petContent?.animal_opendate ?? ""))"
            
        case 7:
            self.textLabel?.text = "結束領養日期：\(String(petContent?.animal_closeddate ?? ""))"
            
        case 8:
            self.textLabel?.text = "領養狀態：\(String(petContent?.animal_status ?? ""))"
            
        case 9:
            self.textLabel?.text = "是否絕育：\(String(petContent?.animal_sterilization ?? ""))"
            
        case 10:
            self.textLabel?.text = "疫苗接種：\(String(petContent?.animal_bacterin ?? ""))"
            
        case 11:
            self.textLabel?.text = "領養所地址：\(String(petContent?.shelter_address ?? ""))"
            self.textLabel?.numberOfLines = 0
            
        default: break
            
        }
    }
}
