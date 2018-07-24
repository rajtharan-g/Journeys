//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 23, 2018

import Foundation

class Address : NSObject, NSCoding{

    var city : String!
    var district : String!
    var formattedAddress : String!
    var lat : Float!
    var lng : Float!
    var pincode : String!
    var placeId : String!
    var state : String!
    var street : String!
    var subDistrict : String!
    var subSubLocality : String!
    var type : String!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        city = json["city"].stringValue
        district = json["district"].stringValue
        formattedAddress = json["formatted_address"].stringValue
        lat = json["lat"].floatValue
        lng = json["lng"].floatValue
        pincode = json["pincode"].stringValue
        placeId = json["place_id"].stringValue
        state = json["state"].stringValue
        street = json["street"].stringValue
        subDistrict = json["subDistrict"].stringValue
        subSubLocality = json["subSubLocality"].stringValue
        type = json["type"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
        var dictionary = [String:Any]()
        if city != nil{
        	dictionary["city"] = city
        }
        if district != nil{
        	dictionary["district"] = district
        }
        if formattedAddress != nil{
        	dictionary["formatted_address"] = formattedAddress
        }
        if lat != nil{
        	dictionary["lat"] = lat
        }
        if lng != nil{
        	dictionary["lng"] = lng
        }
        if pincode != nil{
        	dictionary["pincode"] = pincode
        }
        if placeId != nil{
        	dictionary["place_id"] = placeId
        }
        if state != nil{
        	dictionary["state"] = state
        }
        if street != nil{
        	dictionary["street"] = street
        }
        if subDistrict != nil{
        	dictionary["subDistrict"] = subDistrict
        }
        if subSubLocality != nil{
        	dictionary["subSubLocality"] = subSubLocality
        }
        if type != nil{
        	dictionary["type"] = type
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		city = aDecoder.decodeObject(forKey: "city") as? String
		district = aDecoder.decodeObject(forKey: "district") as? String
		formattedAddress = aDecoder.decodeObject(forKey: "formatted_address") as? String
		lat = aDecoder.decodeObject(forKey: "lat") as? Float
		lng = aDecoder.decodeObject(forKey: "lng") as? Float
		pincode = aDecoder.decodeObject(forKey: "pincode") as? String
		placeId = aDecoder.decodeObject(forKey: "place_id") as? String
		state = aDecoder.decodeObject(forKey: "state") as? String
		street = aDecoder.decodeObject(forKey: "street") as? String
		subDistrict = aDecoder.decodeObject(forKey: "subDistrict") as? String
		subSubLocality = aDecoder.decodeObject(forKey: "subSubLocality") as? String
		type = aDecoder.decodeObject(forKey: "type") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if district != nil{
			aCoder.encode(district, forKey: "district")
		}
		if formattedAddress != nil{
			aCoder.encode(formattedAddress, forKey: "formatted_address")
		}
		if lat != nil{
			aCoder.encode(lat, forKey: "lat")
		}
		if lng != nil{
			aCoder.encode(lng, forKey: "lng")
		}
		if pincode != nil{
			aCoder.encode(pincode, forKey: "pincode")
		}
		if placeId != nil{
			aCoder.encode(placeId, forKey: "place_id")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}
		if street != nil{
			aCoder.encode(street, forKey: "street")
		}
		if subDistrict != nil{
			aCoder.encode(subDistrict, forKey: "subDistrict")
		}
		if subSubLocality != nil{
			aCoder.encode(subSubLocality, forKey: "subSubLocality")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}
