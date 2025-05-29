//
//  Yonetmenler.swift
//  FilmlerUygulamasi
//
//  Created by Halil Keremoğlu on 2.04.2025.
//

import Foundation


class Yonetmenler : Identifiable,Codable{
   var yonetmen_id:String?
   var yonetmen_adi:String?
   
   init(){
       
   }
   
   init(yonetmen_id:String, yonetmen_adi:String){
       self.yonetmen_id = yonetmen_id
       self.yonetmen_adi = yonetmen_adi
   }
}
