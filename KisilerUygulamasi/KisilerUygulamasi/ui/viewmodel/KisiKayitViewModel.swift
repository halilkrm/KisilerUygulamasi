//
//  KisiKayitViewModel.swift
//  KisilerUygulamasi
//
//  Created by Halil Keremoğlu on 6.04.2025.
//

import Foundation
import CoreData

class KisiKayitViewModel{
    
    func kaydet(kisi_ad:String,kisi_tel:String){ // URLSession
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
        istek.httpMethod = "POST"
        let postString = "kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        istek.httpBody = postString.data(using: .utf8)
        
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
               print("------Kaydet--------")
                print("Başarı: \(cevap.success!)")
                print("Mesaj: \(cevap.message!)")
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
}
    
    
    
    
    
    

    
    
    
    /* let context = persistentContainer.viewContext
     
     
     func kaydet(kisi_ad:String,kisi_tel:String){
     let kisi = KisilerModel(context: context)
     kisi.kisi_ad = kisi_ad
     kisi.kisi_tel = kisi_tel
     
     
     saveContext()
     }
     
     
     
     }
     
     let db:FMDatabase?
     
     init(){
     let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
     let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("rehbar.sqlite")
     db = FMDatabase(path: hedefYol.path)
     }
     
     func kaydet(kisi_ad:String,kisi_tel:String){
     db?.open()
     
     do{
     try db!.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [kisi_ad,kisi_tel])
     }catch{
     print(error.localizedDescription)
     }
     
     
     db?.close()
     }*/
    
}
