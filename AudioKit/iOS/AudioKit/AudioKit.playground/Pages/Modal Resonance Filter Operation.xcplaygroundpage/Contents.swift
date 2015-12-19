//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
//:
//: ---
//:
//: ## Modal Resonance Filter Operation
//: ### Add description
import XCPlayground
import AudioKit

let audiokit = AKManager.sharedInstance
let bundle = NSBundle.mainBundle()
let file = bundle.pathForResource("drumloop", ofType: "wav")
let player = AKAudioPlayer(file!)
player.looping = true
let fm = AKFMOscillator(table: AKTable(.Sine, size: 4096), baseFrequency: 100,  amplitude:0.1)

let frequency = sineWave(frequency: 0.3.ak).scaledTo(minimum: 200, maximum: 1200)

let filter  = AKOperation.input.modalResonanceFiltered(frequency: frequency, qualityFactor: 50.ak) * 0.2

let effect = AKNode.effect(player, operation: filter)

audiokit.audioOutput = effect
audiokit.start()
player.play()

let plotView = AKAudioOutputPlot.createView()
XCPlaygroundPage.currentPage.liveView = plotView
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
