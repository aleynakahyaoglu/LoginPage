//
//  GirisViewController.swift
//  Egitim
//
//  Created by Aleyna on 14.03.2022.
//

import UIKit
import Firebase

class GirisViewController: UIViewController {
    
    @IBOutlet weak var userIcon: UIButton!
    @IBOutlet weak var kayitButonu: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var sifreTextfield: UITextField!
    @IBOutlet weak var girisButon: UIButton!
    
  
    @IBAction func UserChangeClick(_ sender: Any) {
        /*label.text = "Admin Girişi"
        userIcon.setImage(UIImage(systemName: "person"), for:.normal)*/
        if (userIcon.currentImage == UIImage(systemName: "person.fill")){ //let label.text = "Admin Girisi"
            userIcon.setImage(UIImage(systemName: "person"), for:.normal)
            label.text = "ADMIN GİRİŞİ"
            kayitButonu.isHidden = false
            kayitButonu.isHidden = true
            
        }else{
            userIcon.setImage(UIImage(systemName: "person.fill"), for:.normal)
            label.text = "KULLANICI GİRİŞİ"
            kayitButonu.isHidden = true
            kayitButonu.isHidden = false
            
        }
        
    }
    @IBAction func girisYapButon(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let sifre = sifreTextfield.text {
            Auth.auth().signIn(withEmail: email, password: sifre) { [self] authResult, error in
                if let e = error {
                    print(e)
                }else{
                    if (self.userIcon.currentImage == UIImage(systemName: "person")){
                    print(Auth.auth().currentUser?.uid)
                    self.performSegue(withIdentifier: sabitler.girisSegue, sender: self)
                    
                }else{
                    print(Auth.auth().currentUser?.uid)

                    self.performSegue(withIdentifier: sabitler.girisToEgitimlerim, sender: self)
                    
                    }
                    
                }
    }
                
            }
            
        }
    @IBAction func kayitOlButonu(_ sender: Any) {
        performSegue(withIdentifier: "girisToKayitOl", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //otomatik doldurma
        emailTextfield.text = "kahyaogluu@gmail.om"
        sifreTextfield.text = "123456"
        girisButon.layer.cornerRadius = girisButon.frame.size.height / 5
        emailTextfield.layer.cornerRadius = emailTextfield.frame.size.height / 5
        sifreTextfield.layer.cornerRadius = sifreTextfield.frame.size.height / 5
    }
    
    @IBAction func unwindd( _ seg: UIStoryboardSegue) {
        
    }
    @IBAction func logoutUnwind( _ seg: UIStoryboardSegue) {
        
    }

    
    }
