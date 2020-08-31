//
//  PetDetailProfileModel.swift
//  SJPetAdoption
//
//  Created by Zero on 2020/8/28.
//  Copyright © 2020 Zero. All rights reserved.
//

import Foundation

struct PetDetailProfileModel: Codable {
    var animal_id:String?
    let animal_subid:String?
    var animal_area_pkid:String?
    let animal_shelter_pkid:String?
    let animal_place:String?
    let animal_kind:String?
    let animal_sex:String?
    let animal_bodytype:String?
    let animal_colour:String?
    let animal_age:String?
    let animal_sterilization:String?
    let animal_bacterin:String?
    let animal_foundplace:String?
    let animal_title:String?
    let animal_status:String?
    let animal_remark:String?
    let animal_caption:String?
    let animal_opendate:String?
    let animal_closeddate:String?
    let animal_update:String?
    let animal_createtime:String?
    let shelter_name:String?
    let album_file:String?
    let album_update:String?
    let cDate:String?
    let shelter_address:String?
    let shelter_tel:String?
    
    private enum PetKeys: String, CodingKey {
        case id = "animal_id",
        subid = "animal_subid",
        area_pkid = "animal_area_pkid",
        shelter_pkid = "animal_shelter_pkid",
        place = "animal_place",
        kind = "animal_kind",
        sex = "animal_sex",
        bodytype = "animal_bodytype",
        colour = "animal_colour",
        age = "animal_age",
        sterilization = "animal_sterilization",
        bacterin = "animal_bacterin",
        foundplace = "animal_foundplace",
        title = "animal_title",
        status = "animal_status",
        remark = "animal_remark",
        caption = "animal_caption",
        closeddate = "animal_closeddate",
        opendate = "animal_opendate",
        update = "animal_update",
        createtime = "animal_createtime",
        name = "shelter_name",
        album_file = "album_file",
        album_update = "album_update",
        cDate = "cDate",
        shelter_address = "shelter_address",
        shelter_tel = "shelter_tel"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PetKeys.self)
        do {
            animal_id = try String(container.decode(Int.self, forKey: .id))
            animal_area_pkid = try String(container.decode(Int.self, forKey: .area_pkid))
            animal_shelter_pkid = try String(container.decode(Int.self, forKey: .shelter_pkid))
        } catch DecodingError.typeMismatch {
            animal_id = try container.decode(String.self, forKey: .id)
            animal_area_pkid = try container.decode(String.self, forKey: .area_pkid)
            animal_shelter_pkid = try container.decode(String.self, forKey: .shelter_pkid)
        }
        
        animal_subid = try container.decode(String.self, forKey: .subid)
        
        animal_place = try container.decode(String.self, forKey: .place)
        animal_kind = try container.decode(String.self, forKey: .kind)
        animal_sex = try container.decode(String.self, forKey: .sex)
        animal_bodytype = try container.decode(String.self, forKey: .bodytype)
        animal_colour = try container.decode(String.self, forKey: .colour)
        animal_age = try container.decode(String.self, forKey: .age)
        animal_sterilization = try container.decode(String.self, forKey: .sterilization)
        animal_bacterin = try container.decode(String.self, forKey: .bacterin)
        animal_foundplace = try container.decode(String.self, forKey: .foundplace)
        animal_title = try container.decode(String.self, forKey: .title)
        animal_status = try container.decode(String.self, forKey: .status)
        animal_remark = try container.decode(String.self, forKey: .remark)
        animal_caption = try container.decode(String.self, forKey: .caption)
        animal_opendate = try container.decode(String.self, forKey: .opendate)
        animal_closeddate = try container.decode(String.self, forKey: .closeddate)
        animal_update = try container.decode(String.self, forKey: .update)
        animal_createtime = try container.decode(String.self, forKey: .createtime)
        shelter_name = try container.decode(String.self, forKey: .name)
        album_file = try container.decode(String.self, forKey: .album_file)
        album_update = try container.decode(String.self, forKey: .album_update)
        cDate = try container.decode(String.self, forKey: .cDate)
        shelter_address = try container.decode(String.self, forKey: .shelter_address)
        shelter_tel = try container.decode(String.self, forKey: .shelter_tel)
    }
}
