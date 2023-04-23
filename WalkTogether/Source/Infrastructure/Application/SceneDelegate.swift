//
//  SceneDelegate.swift
//  WalkTogether
//
//  Created by Aleksei on 15.03.2023.
//

import UIKit
import AVKit
import MediaPlayer

fileprivate enum AudioPlayerStatus {
    case play, pause
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Public Properties
    
    var window: UIWindow?
    private(set) var playingStatus = false
    
    private var player: AVPlayer?
    private var audioSession = AVAudioSession.sharedInstance()
    private let commandCenter = MPRemoteCommandCenter.shared()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        guard let window = window else { return }
        
        AppAssembler.start(window: window)
    }
    

}
