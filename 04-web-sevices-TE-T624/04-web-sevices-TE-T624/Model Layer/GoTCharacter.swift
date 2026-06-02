//
//  GotChar.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 02/06/26.
/*
 [
   {
     "id": 0,
     "firstName": "string",
     "lastName": "string",
     "fullName": "string",
     "title": "string",
     "family": "string",
     "image": "string",
     "imageUrl": "string"
   }
 ]
 
 */

struct GoTCharacter: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let fullName: String
    let title: String
    let family: String
    let imageUrl: String
}
