//
//  TitlePreviewViewController.swift
//  WuuTrailers
//
//  Created by Tindwende Thierry Sawadogo on 8/31/22.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    
    private var titles: [Title] = [Title]()
    
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Test Title"
        return label
        
    }()
    
    private let overviewLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 12
        label.text = "Test Overview"
        return label
        
    }()
    
    private let downloadButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
        
    }()
    
    private let webView: WKWebView = {
        
        // allow video to be played in line sans que tt le screen soit pri koi
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        return webView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
       // view.addSubview(downloadButton)
        
        configureConstraints()
        
        UINavigationBar.appearance().tintColor = .white
        
    }
    
  
    
    func configureConstraints() {
        
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 310)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        let overviewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
//        let downloadButtonConstraints = [
//            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
//            downloadButton.widthAnchor.constraint(equalToConstant: 140),
//            downloadButton.heightAnchor.constraint(equalToConstant: 40)
//        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overviewLabelConstraints)
//        NSLayoutConstraint.activate(downloadButtonConstraints)
        
    }
    
    
    
    func configure(with model: TitlePreviewViewModel) {
        
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)?modestbranding=1") else {
            return
        }
        
        webView.load(URLRequest(url: url))
        
    }
    
   
    
    
}
