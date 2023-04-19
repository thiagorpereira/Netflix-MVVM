//
//  TitlePreviewViewController.swift
//  Netflix
//
//  Created by Thiago Pereira on 18/04/23.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {

    private let titleLebal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let downdloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let webView: WKWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleLebal)
        view.addSubview(webView)
        view.addSubview(overviewLabel)
        view.addSubview(downdloadButton)
        
        configureConstraints()
    }
    
    func configureConstraints() {
        
    }
    

}
