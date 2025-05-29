//
//  FilmSayfaViewModel.swift
//  FilmlerUygulamasi
//
//  Created by Halil Keremoğlu on 7.04.2025.
//

import Foundation

class FilmSayfaViewModel:ObservableObject{
    @Published var filmlerListesi = [Filmler]()
    
    func filmleriYukle(kategori_id:Int){
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/filmler/filmler_by_kategori_id.php")!)
        istek.httpMethod = "POST"
        let postString = "kategori_id=\(kategori_id)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(FilmlerCevap.self, from: data!)
                    if let liste = cevap.filmler{
                        DispatchQueue.main.async{
                            self.filmlerListesi = liste
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
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler .sqlite")
        db = FMDatabase(path: hedefYol.path)
        
    }
    
    func filmleriYukle(kategori_id:Int){
        db?.open()
        
        var liste = [Filmler]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM kategoriler,yonetmenler,filmler WHERE filmler.kategori_id = kategoriler.kategori_id and  filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = ?", values: [kategori_id])
            
            while result.next(){
                let kategori_id = Int(result.string(forColumn: "kategori_id"))!
                let kategori_ad = result.string(forColumn: "kategori_ad")!
                    
                let kategori = Kategoriler(kategori_id: kategori_id, kategori_adi: kategori_ad)
                
                let yonetmen_id = Int(result.string(forColumn: "yonetmen_id"))!
                let yonetmen_ad = result.string(forColumn: "yonetmen_ad")!
                
                let yonetmen = Yonetmenler(yonetmen_id: yonetmen_id, yonetmen_adi: yonetmen_ad)
                
                let film_id = Int(result.string(forColumn: "film_id"))!
                let film_ad = result.string(forColumn: "film_ad")!
                let film_yil = Int(result.string(forColumn: "film_yil"))!
                let film_resim = result.string(forColumn: "film_resim")!
                
                let film = Filmler(film_id: film_id, film_adi: film_ad, film_yil: film_yil, film_resim: film_resim, kategori: kategori, yonetmen: yonetmen) // composition yaptık
                
                liste.append(film)
                
            }
            
            filmlerListesi = liste
            
        }catch{
            print(error.localizedDescription)
        }
        
        
        
        db?.close()
        
        
    }
    
}*/
