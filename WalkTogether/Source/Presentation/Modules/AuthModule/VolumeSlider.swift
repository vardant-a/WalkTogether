//
//  VolumeSlider.swift
//  RadioApp
//
//  Created by Aleksei on 20.04.2023.
//

import UIKit
import MediaPlayer

final class VolumeSlider: UIView {
    
    // MARK: - Private Properties
    
    private let minVolumeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .orange
        imageView.image = UIImage(systemName: "speaker.fill")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 20))
        
        return imageView
    }()
    
    private let maxVolumeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .orange
        imageView.image = UIImage(systemName: "speaker.wave.3.fill")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 20))
        
        return imageView
    }()
    
    private let volumeSlider: MPVolumeView = {
        let slider = MPVolumeView()
        slider.tintColor = .orange
        slider.backgroundColor = .black
        slider.showsRouteButton = false
        
        return slider
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(
            minVolumeImageView, volumeSlider, maxVolumeImageView)
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        setupVolumeImageViewLayouts()
        setupVolumeSliderLayout()
    }
    
    private func setupVolumeSliderLayout() {
        NSLayoutConstraint.activate([
            volumeSlider.centerYAnchor.constraint(equalTo: minVolumeImageView.centerYAnchor),
            volumeSlider.leadingAnchor.constraint(
                equalTo: minVolumeImageView.trailingAnchor, constant: 8),
            volumeSlider.trailingAnchor.constraint(equalTo: maxVolumeImageView.leadingAnchor, constant: -8)
        ])
    }
    
    private func setupVolumeImageViewLayouts() {
        NSLayoutConstraint.activate([
            minVolumeImageView.centerYAnchor.constraint(
                equalTo: centerYAnchor),
            minVolumeImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            
            minVolumeImageView.centerYAnchor.constraint(
                equalTo: centerYAnchor),
            maxVolumeImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor)
        ])
    }
}
