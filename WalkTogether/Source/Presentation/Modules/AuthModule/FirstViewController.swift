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
        player.addLockPlayer("Music")
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
