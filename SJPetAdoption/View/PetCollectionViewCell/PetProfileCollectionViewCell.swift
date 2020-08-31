//
//  PetProfileCollectionViewCell.swift
//  SJPetAdoption
//
//  Created by Zero on 2020/8/28.
//  Copyright © 2020 Zero. All rights reserved.
//

import UIKit

class PetProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var petKindLabel: UILabel!
    @IBOutlet weak var petPlaceLabel: UILabel!
    
    var petProfileCellModel: PetDetailProfileModel?{
        didSet{
            if  let url = URL(string: petProfileCellModel?.album_file ?? "") {
                let data = try! Data(contentsOf: url )
                petImageView.image = (data.isEmpty ? UIImage() : UIImage(data: data))
            }
            petKindLabel.text = "類型：\(petProfileCellModel?.animal_kind ?? "")"
            petPlaceLabel.text = "所在地區：\(petProfileCellModel?.animal_place ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//       self.petImageView.layer.cornerRadius = self.petImageView.frame.size.width / 2
    }
    
}
