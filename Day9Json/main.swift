//
//  main.swift
//  Day9Json
//
//  Created by MacStudent on 2019-06-14.
//  Copyright © 2019 Tarlochan5268. All rights reserved.
//

import Foundation




func readJsonFile(jsonFileName: String)
{
    
    let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
    guard let jsonData = url else { return }
    guard let data = try? Data(contentsOf: jsonData)else{ return }
    guard let json = try? JSONSerialization.jsonObject(with: data, options: [])else{ return }
    
    print(json)
    var UsersStruct = Users()
    if let jsonDictionary = json as? [String:Any]
    {
        if let id = jsonDictionary["id"] as? Int
        {
            print("id : \(id)")
            UsersStruct.id=id
        }
        if let name = jsonDictionary["name"] as? String
        {
            print("name : \(name)")
            UsersStruct.name=name
        }
        if let username = jsonDictionary["username"] as? String
        {
            print("username : \(username)")
            UsersStruct.username=username
        }
        if let email = jsonDictionary["email"] as? String
        {
            print("email : \(email)")
            UsersStruct.email=email
        }
        var address : Address
        //read Address dictionary
        if let addressDict = jsonDictionary["address"] as? Dictionary<String,Any>
        {
            address = Address()
            if let street = addressDict["street"] as? String
            {
                print("street : \(street)")
                address.street=street
            }
            if let suite = addressDict["suite"] as? String
            {
                print("suite : \(suite)")
                address.suite=suite
            }
            if let city = addressDict["city"] as? String
            {
                print("city : \(city)")
                address.city=city
            }
            if let zipcode = addressDict["zipcode"] as? String
            {
                print("zipcode : \(zipcode)")
                address.zipcode=zipcode
            }
            var geo : Geo
            if let geoDict = addressDict["geo"] as? Dictionary<String,Any>
            {
                geo = Geo()
                if let lat = geoDict["lat"] as? String
                {
                    print("lat : \(lat)")
                    geo.lat=lat
                }
                if let lng = geoDict["lng"] as? String
                {
                    print("lng : \(lng)")
                    geo.lng=lng
                }
                address.geo=geo
            }
            UsersStruct.address=address
            
        }
        if let phone = jsonDictionary["phone"] as? String
        {
            print("phone : \(phone)")
            UsersStruct.phone=phone
        }
        if let website = jsonDictionary["website"] as? String
        {
            print("website : \(website)")
            UsersStruct.website=website
        }
        var company : Company
        if let companyDict = jsonDictionary["company"] as? Dictionary<String,Any>
        {
            company = Company()
            if let name = companyDict["name"] as? String
            {
                print("name : \(name)")
                company.name=name
            }
            if let catchPhrase = companyDict["catchPhrase"] as? String
            {
                print("catchPhrase : \(catchPhrase)")
                company.catchphrase=catchPhrase
            }
            if let bs = companyDict["bs"] as? String
            {
                print("bs : \(bs)")
                company.bs=bs
            }
            UsersStruct.company=company
        }
    }
    print(UsersStruct.address)
}

//readJsonFile(jsonFileName: "Users")
var userList = [String : Users]()

func readJsonFileArray(jsonFileName: String)
{
    
    let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
    guard let jsonData = url else { return }
    guard let data = try? Data(contentsOf: jsonData)else{ return }
    guard let json = try? JSONSerialization.jsonObject(with: data, options: [])else{ return }
    
    print(json)
    if let jsonArray = json as? [Any]
    {
        var UsersStruct = Users()
        for userObject in jsonArray
        {
            
            if let jsonDictionary = json as? [String:Any]
            {
                if let id = jsonDictionary["id"] as? Int
                {
                    print("id : \(id)")
                    UsersStruct.id=id
                }
                if let name = jsonDictionary["name"] as? String
                {
                    print("name : \(name)")
                    UsersStruct.name=name
                }
                if let username = jsonDictionary["username"] as? String
                {
                    print("username : \(username)")
                    UsersStruct.username=username
                }
                if let email = jsonDictionary["email"] as? String
                {
                    print("email : \(email)")
                    UsersStruct.email=email
                }
                var address : Address
                //read Address dictionary
                if let addressDict = jsonDictionary["address"] as? Dictionary<String,Any>
                {
                    address = Address()
                    if let street = addressDict["street"] as? String
                    {
                        print("street : \(street)")
                        address.street=street
                    }
                    if let suite = addressDict["suite"] as? String
                    {
                        print("suite : \(suite)")
                        address.suite=suite
                    }
                    if let city = addressDict["city"] as? String
                    {
                        print("city : \(city)")
                        address.city=city
                    }
                    if let zipcode = addressDict["zipcode"] as? String
                    {
                        print("zipcode : \(zipcode)")
                        address.zipcode=zipcode
                    }
                    var geo : Geo
                    if let geoDict = addressDict["geo"] as? Dictionary<String,Any>
                    {
                        geo = Geo()
                        if let lat = geoDict["lat"] as? String
                        {
                            print("lat : \(lat)")
                            geo.lat=lat
                        }
                        if let lng = geoDict["lng"] as? String
                        {
                            print("lng : \(lng)")
                            geo.lng=lng
                        }
                        address.geo=geo
                    }
                    UsersStruct.address=address
                    
                }
                if let phone = jsonDictionary["phone"] as? String
                {
                    print("phone : \(phone)")
                    UsersStruct.phone=phone
                }
                if let website = jsonDictionary["website"] as? String
                {
                    print("website : \(website)")
                    UsersStruct.website=website
                }
                var company : Company
                if let companyDict = jsonDictionary["company"] as? Dictionary<String,Any>
                {
                    company = Company()
                    if let name = companyDict["name"] as? String
                    {
                        print("name : \(name)")
                        company.name=name
                    }
                    if let catchPhrase = companyDict["catchPhrase"] as? String
                    {
                        print("catchPhrase : \(catchPhrase)")
                        company.catchphrase=catchPhrase
                    }
                    if let bs = companyDict["bs"] as? String
                    {
                        print("bs : \(bs)")
                        company.bs=bs
                    }
                    UsersStruct.company=company
                    
                }
                
            }
            print(UsersStruct.address)
        }
        userList[UsersStruct.username!] = UsersStruct
    }
    
}

//readJsonFileArray(jsonFileName: "UserList")

/*
func readTextfile(fileName : String)
{
    if let pathOfText = Bundle.main.path(forResource: "Sample", ofType: "txt")
    {
        do{
            let text = try String(contentsOfFile: <#T##String#>)
        }
    }
}
*/
