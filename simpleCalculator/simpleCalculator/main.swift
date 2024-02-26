import Darwin

func getDataFromUser(message: String) -> String {
    print(message)
    return readLine() ?? ""
}

func showResult(_ result: Int) {
    print("Результат: \(String(result))")
}

print("Добро пожаловать в простой калькулятор!")

var history: [String] = []

while true {
    let operation = getDataFromUser(message: "Выберите операцию: +, -, * или /. Для завершения работы введите q. Для просмотра истории вычислений введите h.")
    if operation == "q" {
        exit(0)
    } else if operation == "h" {
        for example in history {
            print(example)
        }
        continue
    }
    
    let numberOne = getDataFromUser(message: "Введите первое целое число:")
    let numberTwo = getDataFromUser(message: "Введите второе целое число:")
    let example = "\(numberOne) \(operation) \(numberTwo)"
    print("Вычисляю пример: \(example)")

    if let numberOne = Int(numberOne) {
        if let numberTwo = Int(numberTwo) {
            let result = calculate(operation: operation, numberOne: numberOne, numberTwo: numberTwo)
            if let result = result {
                showResult(result)
                history.append(example + " = " + String(result))
            }
        } else {
            print("Вы ввели неверное второе число!")
        }
    } else {
        print("Вы ввели неверное первое число!")
    }
    print("")
    print("————————————————————————————————")
    print("")
}

func calculate(operation: String, numberOne: Int, numberTwo: Int) -> Int? {
    switch operation {
    case "+": return numberOne + numberTwo
    case "-": return numberOne - numberTwo
    case "*": return numberOne * numberTwo
    case "/":
        if numberTwo != 0 {
            return numberOne / numberTwo
        } else {
            print("На ноль делить нельзя!")
            return nil
        }
    default: 
        print("Вы выбрали неверную операцию!")
        return nil
    }
}
