//
//  KisiDetayViewModel.swift
//  KisilerUygulamasi
//
//  Created by Halil Keremoğlu on 6.04.2025.
//

import Foundation
import CoreData

class KisiDetayViewModel{
   
    
    func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!)
        istek.httpMethod = "POST"
        let postString = "kisi_id=\(kisi_id)&kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        istek.httpBody = postString.data(using: .utf8)
        
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
               print("------Güncelle--------")
                print("Başarı: \(cevap.success!)")
                print("Mesaj: \(cevap.message!)")
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*func guncelle(kisi:KisilerModel,kisi_ad:String,kisi_tel:String){
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        saveContext()
    }*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  /*  let db:FMDatabase?
    
    init(){
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("rehbar.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){

        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ? , kisi_tel = ? WHERE kisi_id = ? ", values: [kisi_ad,kisi_tel,kisi_id])
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    
    } */ // SQLİTE KISMI
}
