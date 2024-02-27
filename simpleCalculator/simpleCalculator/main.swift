import Darwin

print("Добро пожаловать в простой калькулятор!")

var history: [String] = []

while true {
    let action = getDataFromUser(message: "Что вы хотите сделать? с - посчитать пример. q - завершить работу. h - посмотреть историю.")
    switch action {
    case "c": calculate()
    case "q": exit(0)
    case "h": showHistory()
    default: print("Недопустимое действие.")
    }
    print("")
    print("————————————————————————————————")
    print("")
}



func calculate() {
    let operation = getDataFromUser(message: "Выберите операцию: +, -, * или /.")
    guard operation == "+" || operation == "-" || operation == "*" || operation == "/" else {
        print("Вы ввели недопустимую операцию!")
        return
    }
    
    let firstNumber = getDataFromUser(message: "Введите первое целое число:")
    guard let firstNumber = Int(firstNumber) else {
        print("Вы ввели неверное первое число!")
        return
    }
    
    let secondNumber = getDataFromUser(message: "Введите второе целое число:")
    guard let secondNumber = Int(secondNumber) else {
        print("Вы ввели неверное второе число!")
        return
    }
    
    let example = "\(firstNumber) \(operation) \(secondNumber)"
    print("Вычисляю пример: \(example)")
    
    let result = calculate(operation: operation, firstNumber: firstNumber, secondNumber: secondNumber)
    guard let result = result else { return }
    
    showResult(result)
    history.append("\(example) = \(result)")
}

func calculate(operation: String, firstNumber: Int, secondNumber: Int) -> Int? {
    
    switch operation {
    case "+": return firstNumber + secondNumber
    case "-": return firstNumber - secondNumber
    case "*": return firstNumber * secondNumber
    case "/" where secondNumber == 0:
        print("На ноль делить нельзя!")
        return nil
    case "/": return firstNumber / secondNumber
    default:
        print("Вы выбрали неверную операцию!")
        return nil
    }
}

func getDataFromUser(message: String) -> String {
    print(message)
    return readLine() ?? ""
}

func showResult(_ result: Int) {
    print("Результат: \(String(result))")
}

func showHistory() {
    for example in history {
        print(example)
    }
}
