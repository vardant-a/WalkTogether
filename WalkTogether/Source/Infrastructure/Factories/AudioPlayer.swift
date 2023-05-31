//
//  AudioPlayer.swift
//  WalkTogether
//
//  Created by Aleksei on 23.04.2023.
//

import UIKit
import AVKit
import MediaPlayer
import AVFoundation

fileprivate enum AudioPlayerStatus {
    case play, pause
}

final class AudioPlayer {
    
    // MARK: - Private Properties
    
    private var player: AVPlayer?
    private var audioSession = AVAudioSession.sharedInstance()
    private let commandCenter = MPRemoteCommandCenter.shared()
    
    private(set) var playingStatus = false
    
    // MARK: - Public Methods
    
    func startAudioStream(url: URL) {
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        player?.automaticallyWaitsToMinimizeStalling = true
        setupAudioPlayerStatus(.play)
    }
    
    func changeStation(url: URL) {
        stopAudioStream()
        startAudioStream(url: url)
    }
    
    func stopAudioStream() {
        setupAudioPlayerStatus(.pause)
        player = nil
    }
    
    func changeStatusAudioPlaying() {
        if player?.timeControlStatus == .playing {
            setupAudioPlayerStatus(.pause)
        } else {
            setupAudioPlayerStatus(.play)
            playbackAudio()
        }
    }
    
    func addLockPlayer(_ title: String, image: UIImage? = nil) {
        var audioDescription: [String: Any] = [:]
        audioDescription[MPMediaItemPropertyTitle] = title
        
        if let image = image {
            audioDescription[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(
                boundsSize: image.size, requestHandler: { _ in
                return image
            })
        }
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = audioDescription
    }
    
    func setupTransportControl() {
        commandCenter.togglePlayPauseCommand.addTarget { [unowned self] _ in
            if player?.rate == 0.0 {
                setupAudioPlayerStatus(.play)
                return .success
            } else if player?.rate == 1.0 {
                setupAudioPlayerStatus(.pause)
                return .success
            }
            return .commandFailed
        }
        
        commandCenter.nextTrackCommand.addTarget { _ in
            print("next")
            return .success
        }
        
        commandCenter.previousTrackCommand.addTarget { _ in
            print("previus")
            return .success
        }
    }
    
    private func setupAudioPlayerStatus(_ status: AudioPlayerStatus) {
        playingStatus = status == .play ? true : false
        switch status {
        case .play:
            player?.play()
        case .pause:
            player?.pause()
        }
    }
    
    func playbackAudio() {
        do {
            try audioSession.setCategory(.playback, mode: .default, options: [])
        } catch {
            print("AudioSession don`t work")
        }
    }
}
