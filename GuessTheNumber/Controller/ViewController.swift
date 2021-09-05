//
//  ViewController.swift
//  swiftUIkit
//
//  Created by Роман Каменский on 20.08.2021.
//

import UIKit

class ViewController: UIViewController {
    

    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    // MARK: - Жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
        let generator = NumberGenerator(startValue: 1, endValue: 50)!
        game = Game(valueGenerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    // MARK: - Взаимодействие View - Model
    
    @IBAction func checkNumber() {
        game.currentRound.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    // MARK: - Обновление View

    func updateLabelWithSecretNumber(newText: String ) {
        label.text = newText
    }

    private func showAlertWith( score: Int ) {
        let alert = UIAlertController(
                        title: "Игра окончена",
                        message: "Вы заработали \(score) очков",
                        preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

/*class ViewController: UIViewController {
 // загаданное число
 var number: Int = 0
 // раунд
 var round: Int = 0
 // сумма очков за раунд
 var points: Int = 0
 
 lazy var secondViewController: presentVC = getSecondViewController()
 
 @IBOutlet weak var slider: UISlider!
 @IBOutlet weak var label: UILabel!
 
 override func viewWillAppear(_ animated: Bool)
 {
 super.viewWillAppear(animated)
 print("viewWillAppear")
 }
 override func viewDidAppear(_ animated: Bool)
 {
 super.viewDidAppear(animated)
 print("viewDidAppear")
 }
 override func viewWillDisappear(_ animated: Bool)
 {
 super.viewWillDisappear(animated)
 print("viewWillDisappear")
 }
 override func viewDidDisappear(_ animated: Bool)
 {
 super.viewDidDisappear(animated)
 print("viewDidDisappear")
 }
 
 override func loadView()
 {
 super.loadView()
 print("loadView")
 
 let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
 // изменяем текст метки
 versionLabel.text = "Версия 1.1"
 // добавляем метку в родительский
 view.addSubview(versionLabel)
 }
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 print("viewDidLoad")
 // генерируем случайное число
 self.number = Int.random(in: 1...50)
 // устанавливаем загаданное число в метку
 self.label.text = String(self.number)
 // Do any additional setup after loading the view.
 }
 
 private func getSecondViewController() -> presentVC {
 let storyboard = UIStoryboard(name: "Main", bundle: nil)
 let viewController = storyboard.instantiateViewController(identifier: "presentVC")
 return viewController as! presentVC
 }
 
 @IBAction func checkNumber(_ sender: UIButton){
 // получаем значение на слайдере
 let numSlider = Int(self.slider.value) // сравниваем значение с загаданным
 // и подсчитываем очки
 if numSlider > self.number {
 self.points += 50 - numSlider + self.number } else if numSlider < self.number {
 self.points += 50 - self.number + numSlider
 } else {
 self.points += 50
 }
 if self.round == 5 {
 // выводим информационное окно // с результатами игры
 let alert = UIAlertController(
 title: "Игра окончена",
 message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
 alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
 self.present(alert, animated: true, completion: nil)
 self.round = 1
 self.points = 0
 } else {
 self.round += 1
 }
 // генерируем случайное число
 self.number = Int.random(in: 1...50)
 // передаем значение случайного числа в label
 self.label.text = String(self.number)
 }
 
 @IBAction func presentButton(_ sender: UIButton) {
 self.present(secondViewController, animated: true, completion: nil)
 
 /*// загрузка Storyboard
 let storyboard = UIStoryboard(name: "Main", bundle: nil)
 // загрузка View Controller и его сцены со Storyboard
 let viewController = storyboard.instantiateViewController(identifier:
 "presentVC")
 // отображение сцены на экране
 self.present(viewController, animated: true, completion: nil)*/
 }
 }
 */



