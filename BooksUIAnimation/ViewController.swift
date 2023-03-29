//
//  ViewController.swift
//  BooksUIAnimation
//
//  Created by Ben Lee on 3/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    let bView = BView()
    
    let o1ImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "LetterO")?.withRenderingMode(.alwaysOriginal))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = false
        return iv
    }()
    
    let o2ImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "LetterO")?.withRenderingMode(.alwaysOriginal))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = false
        return iv
    }()
    
    let kImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "LetterK")?.withRenderingMode(.alwaysOriginal))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = false
        return iv
    }()
    
    let sImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "LetterS")?.withRenderingMode(.alwaysOriginal))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = false
        return iv
    }()
    
    let lettersView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    fileprivate func initialSetup() {
        setupBView()
        setupLetterViews()
        addTapGesture()
    }
    
    fileprivate func addTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    fileprivate func setupBView() {
        view.addSubview(bView)
        bView.frame = CGRect(x: 65, y: 408, width: 200, height: 110)
        
    }
    
    fileprivate func setupLetterViews() {
        view.addSubview(lettersView)
        lettersView.frame = CGRect(x: 155, y: 443, width: view.frame.size.width - 155, height: 52)
        lettersView.backgroundColor = .clear
        
        lettersView.addSubview(o1ImageView)
        lettersView.addSubview(o2ImageView)
        lettersView.addSubview(kImageView)
        lettersView.addSubview(sImageView)
        
        o1ImageView.frame = CGRect(x: 0, y: 0, width: 52, height: 52)
        o2ImageView.frame = CGRect(x: 62, y: 0, width: 52, height: 52)
        kImageView.frame = CGRect(x: 126, y: 0, width: 39, height: 52)
        sImageView.frame = CGRect(x: 175, y: 0, width: 34, height: 52)

    }
    
    @objc func handleTap() {
        print("tapping")
        // need to animate BView and the Letters
        // Part 1: The initial left shift of all the views
        initialLeftShift()
        
        // Part 2: Expand animate B. Move other lettrs right and fade out
        moveLettersRightAndFadeOut()
        
        // Part 3: Contract animate B. Move other letters bac and fade in
        //moveLettersBackAndFadeIn()
    }
    
    func initialLeftShift() {
        bView.frame.origin.x = 55
        lettersView.frame.origin.x = 140
    }
    
    func moveLettersRightAndFadeOut() {
        let duration: TimeInterval = 0.25
        let pad = 40
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseIn) {
            self.sImageView.frame = CGRect(x: 175+pad, y: 0, width: 34, height: 52)
            self.sImageView.alpha = 0
        } completion: { (completed) in
            self.bView.expandAnimation()
        }
        
        UIView.animate(withDuration: duration, delay: 0.1, options: .curveEaseIn) {
            self.kImageView.frame = CGRect(x: 126+pad, y: 0, width: 39, height: 52)
            self.kImageView.alpha = 0
        }
        
        UIView.animate(withDuration: duration, delay: 0.2, options: .curveEaseIn) {
            self.o2ImageView.frame = CGRect(x: 62+pad, y: 0, width: 52, height: 52)
            self.o2ImageView.alpha = 0
        }
        UIView.animate(withDuration: duration, delay: 0.3, options: .curveEaseIn) {
            self.o1ImageView.frame = CGRect(x: 0+pad, y: 0, width: 52, height: 52)
            self.o1ImageView.alpha = 0
        } completion: { (completed) in
            self.moveLettersBackAndFadeIn()
        }
    }
    
    func setLetterFramesForFadeIn() {
        self.o1ImageView.frame = CGRect(x: 14, y: 14, width: 25, height: 25)
        self.o2ImageView.frame = CGRect(x: 75, y: 14, width: 25, height: 25)
        self.kImageView.frame = CGRect(x: 136, y: 14, width: 18.75, height: 25)
        self.sImageView.frame = CGRect(x: 185, y: 14, width: 16.35, height: 25)
    }
    
    func moveLettersBackAndFadeIn() {
        setLetterFramesForFadeIn()
        
        self.bView.contractAnimation { (completed) in
            print("Completed contract animation")
        }
        
        let duration: TimeInterval = 0.25
        //let delayConstant = self.b
        
        UIView.animate(withDuration: 0.25, delay: 1.6, options: .curveEaseOut) {
            self.o1ImageView.frame = CGRect(x: 0, y: 0, width: 52, height: 52)
        }
        UIView.animate(withDuration: 0.5, delay: 1.6, options: .curveEaseOut) {
            self.o1ImageView.alpha = 1
        }
        
        UIView.animate(withDuration: 0.25, delay: 1.7, options: .curveEaseOut) {
            self.o2ImageView.frame = CGRect(x: 62, y: 0, width: 52, height: 52)
        }
        UIView.animate(withDuration: 0.5, delay: 1.7, options: .curveEaseOut) {
            self.o2ImageView.alpha = 1
        }
        
        UIView.animate(withDuration: 0.25, delay: 1.8, options: .curveEaseOut) {
            self.kImageView.frame = CGRect(x: 126, y: 0, width: 39, height: 52)
        }
        UIView.animate(withDuration: 0.5, delay: 1.8, options: .curveEaseOut) {
            self.kImageView.alpha = 1
        }
        
        UIView.animate(withDuration: 0.25, delay: 1.9, options: .curveEaseOut) {
            self.sImageView.frame = CGRect(x: 175, y: 0, width: 34, height: 52)
        }
        UIView.animate(withDuration: 0.5, delay: 1.9, options: .curveEaseOut) {
            self.sImageView.alpha = 1
        }
        
    }
    
    
    
    
    
}

