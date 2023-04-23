//
//  FirstViewController.swift
//  WalkTogether
//
//  Created by Aleksei on 15.03.2023.
//

import UIKit
import MediaPlayer
import AVKit

protocol FirstViewControllerProtocol: AnyObject {
}

final class FirstViewController: UIViewController {
    // MARK: - Private Properties
    
    private let presenter: FirstViewPresenter
    
    private let routeButton = AVRoutePickerView()

    var player = AudioPlayer()
    
    var volumeSlider = VolumeSlider()
    
    // MARK: - Init
    
    init(presenter: FirstViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .red
        startAudio()
        view.addSubview(volumeSlider)
        view.addSubview(routeButton)
        routeButton.tintColor = .orange
        setupVolumeSliderLayout()
        setupRouteButtonLayout()
    }
    
    private func startAudio() {
        let url = Bundle.main.url(forResource: "music", withExtension: "mp3")!
        player.startAudioStream(url: url)
        player.addLockPlayer("test")
        player.setupTransportControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupVolumeSliderLayout() {
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            volumeSlider.widthAnchor.constraint(equalToConstant: view.frame.width - 32),
            volumeSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            volumeSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupRouteButtonLayout() {
        routeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            routeButton.heightAnchor.constraint(
                equalToConstant: 36),
            routeButton.widthAnchor.constraint(
                equalToConstant: 36),
            routeButton.topAnchor.constraint(
                equalTo: volumeSlider.bottomAnchor,
                constant: 50),
            routeButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor)
        ])
    }
}

    // MARK: - FirstViewController + FirstViewControllerProtocol

extension FirstViewController: FirstViewControllerProtocol {
}

final class VolumeSlider: UIView {
    
    // MARK: - Private Properties
    
    let minVolumeImageView = UIImageView(image: UIImage(systemName: "speaker.fill")?.withConfiguration(
        UIImage.SymbolConfiguration(pointSize: 25)))
    let maxVolumeImageView = UIImageView(image: UIImage(systemName: "speaker.wave.3.fill")?.withConfiguration(
        UIImage.SymbolConfiguration(pointSize: 25)))
    
    private let volumeSlider: MPVolumeView = {
        let slider = MPVolumeView()
        slider.tintColor = .orange
        slider.showsRouteButton = false
        
        return slider
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        selfConfig()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func selfConfig() {
        addSubview(minVolumeImageView)
        addSubview(volumeSlider)
        addSubview(maxVolumeImageView)
        setupLayout()
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.heightAnchor.constraint(equalToConstant: 44).isActive = true
        setupVolumeImageViewsLayout()
        setupVolumeSliderLayout()
    }
    
    private func setupVolumeSliderLayout() {
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            volumeSlider.leadingAnchor.constraint(equalTo: minVolumeImageView.trailingAnchor, constant: 8),
            volumeSlider.trailingAnchor.constraint(equalTo: maxVolumeImageView.leadingAnchor, constant: -8),
            volumeSlider.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupVolumeImageViewsLayout() {
        minVolumeImageView.translatesAutoresizingMaskIntoConstraints = false
        maxVolumeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            maxVolumeImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            maxVolumeImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            maxVolumeImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            maxVolumeImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
