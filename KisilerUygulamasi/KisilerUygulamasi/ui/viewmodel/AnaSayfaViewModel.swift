//
//  AnaSayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Halil Keremoğlu on 6.04.2025.
//

import Foundation
import CoreData


class AnaSayfaViewModel:ObservableObject{
    @Published var kisilerListesi = [Kisiler]()
    
    func kisileriYukle(){
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        URLSession.shared.dataTask(with: url){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
                if let liste = cevap.kisiler{
                    DispatchQueue.main.sync {
                        self.kisilerListesi = liste
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func ara(aramaKelimesi:String){
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        istek.httpMethod = "POST"
        let postString = "kisi_ad=\(aramaKelimesi)"
        istek.httpBody = postString.data(using: .utf8)
        
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
                if let liste = cevap.kisiler{
                    DispatchQueue.main.sync {
                        self.kisilerListesi = liste
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func sil(kisi_id:Int){
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        istek.httpMethod = "POST"
        let postString = "kisi_id=\(kisi_id)"
        istek.httpBody = postString.data(using: .utf8)
        
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
               print("------Sil--------")
                print("Başarı: \(cevap.success!)")
                print("Mesaj: \(cevap.message!)")
                self.kisileriYukle()
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //COREDATA
   /* let context = persistentContainer.viewContext
    
    
    func kisileriYukle(){
        
        do{
            let liste = try context.fetch(KisilerModel.fetchRequest())
            kisilerListesi = liste
        }catch{
            print(error.localizedDescription)
        }
        
    }
    func ara(aramaKelimesi:String){

        do{
            
            let fr = KisilerModel.fetchRequest()
            fr.predicate  = NSPredicate(format:"kisi_ad CONTAINS[c] @",aramaKelimesi)
            
            
            let liste = try context.fetch(fr)
            kisilerListesi = liste
        }catch{
            print(error.localizedDescription)
        }



    }
    func sil(kisi:KisilerModel){
        
        context.delete(kisi)
        saveContext()
        kisileriYukle()
    }
    
    
    
    
    //SQLİTE
   let db:FMDatabase?
    
    init(){
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("rehbar.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    func kisileriYukle(){
        db?.open()
        
        var liste = [Kisiler]()
        
        do{
            let result = try db!.executeQuery("SELECT *FROM kisiler", values: nil)
            
            while result.next(){
                let kisi_id = Int(result.string(forColumn: "kisi_id"))!
                let kisi_ad = result.string(forColumn: "kisi_ad")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                liste.append(kisi)
            }
            
           kisilerListesi = liste
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func ara(aramaKelimesi:String){

           db?.open()
           
           var liste = [Kisiler]()
           
           do{
               let result = try db!.executeQuery("SELECT *FROM kisiler WHERE kisi_ad like ?" , values: ["%\(aramaKelimesi)%"])
               
               while result.next(){
                   let kisi_id = Int(result.string(forColumn: "kisi_id"))!
                   let kisi_ad = result.string(forColumn: "kisi_ad")!
                   let kisi_tel = result.string(forColumn: "kisi_tel")!
                   
                   let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                   liste.append(kisi)
               }
               
              kisilerListesi = liste
               
           }catch{
               print(error.localizedDescription)
           }
           
           db?.close()


    }
    
    func sil(kisi_id:Int){
        db?.open()
        
        do{
            try db!.executeUpdate(" DELETE FROM  kisiler WHERE kisi_id = ?", values: [kisi_id])
            kisileriYukle() // silme işleminden sonra güncel verileri gönderdik
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }*/
}


