//
//  Kategoriler.swift
//  FilmlerUygulamasi
//
//  Created by Halil Keremoğlu on 2.04.2025.
//

import Foundation
 
class Kategoriler : Identifiable,Codable{
    var kategori_id:String?
    var kategori_ad:String?
    
    init(){
        
    }
    
    init(kategori_id:String, kategori_ad:String){
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}
