//
//  AnaSayfaViewModel.swift
//  FilmlerUygulamasi
//
//  Created by Halil Keremoğlu on 7.04.2025.
//

import Foundation

class AnaSayfaViewModel:ObservableObject{
    @Published var kategorilerListesi = [Kategoriler]()
    
    
    func kategorileriYukle(){
        let url = URL(string: "http://kasimadalan.pe.hu/filmler/tum_kategoriler.php")!
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(KategorilerCevap.self, from: data!)
                    if let liste = cevap.kategoriler{
                        DispatchQueue.main.async{
                            self.kategorilerListesi = liste
                        }
                        
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }.resume()
        }
        
    }
    
    

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        /* let db:FMDatabase?
         
         init(){
         let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! //bilgisayardaki masaüstü klasörü gibi
         let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler .sqlite")
         db = FMDatabase(path: hedefYol.path)
         
         }
         func kategorileriYukle(){
         db?.open()
         
         var liste = [Kategoriler]()
         
         do{
         let result = try db!.executeQuery("SELECT * FROM kategoriler", values: nil)
         
         while result.next(){
         let kategori_id = Int(result.string(forColumn: "kategori_id"))!
         let kategori_ad = result.string(forColumn: "kategori_ad")!
         
         let kategori = Kategoriler(kategori_id: kategori_id, kategori_adi: kategori_ad)
         liste.append(kategori)
         
         }
         kategorilerListesi = liste
         }catch{
         print(error.localizedDescription)
         }
         
         
         
         db?.close()
         } */
    
