//
//  ViewController.swift
//  MyHeroApp
//
//  Created by mac on 11/06/20.
//  Copyright © 2020 Tonsu Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Pahlawan Indonesia"
        
        heroTableView.dataSource = self
        
        heroTableView.delegate = self
        
        heroTableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroCell")
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as! HeroTableViewCell
        
        let hero = heroes[indexPath.row]
        cell.nameHero.text = hero.name
        cell.descHero.text = hero.description
        cell.photoHero.image = hero.photo
        
        cell.photoHero.layer.cornerRadius = cell.photoHero.frame.height / 2
        cell.photoHero.clipsToBounds = true
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detail.hero = heroes[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
