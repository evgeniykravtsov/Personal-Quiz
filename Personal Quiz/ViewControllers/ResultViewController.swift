

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var titleResult: UILabel!
    
    @IBOutlet weak var descriptionResult: UILabel!

    var answers: [Answer] = []
    var results: [AnimalType : Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        for answer in answers {
            if results[answer.type] != nil {
                results[answer.type]! += 1
            }
            else {
                results[answer.type] = 1
            }
        }
        var maxValue: Int = 0
        var animalWithMaxValue: AnimalType = answers.first!.type

        for (animal, value) in results {
            if value > maxValue {
                maxValue = value
                animalWithMaxValue = animal
            }
        }
        titleResult.text = "Вы - \(animalWithMaxValue.rawValue)"
        descriptionResult.text = animalWithMaxValue.definition
    }
}
