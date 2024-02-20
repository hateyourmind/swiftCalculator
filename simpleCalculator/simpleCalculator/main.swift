func getDataFromUser(message: String) -> String {
    print(message)
    return readLine() ?? ""
}

func showResult(_ result: Int) {
    let result = String(result)
    let message = "Результат:"
    print(message + " " + result)
}

print("Добро пожаловать в простой калькулятор!")

let operation = getDataFromUser(message: "Выберите операцию: +, -, * или /")
let numberOne = getDataFromUser(message: "Введите первое целое число:")
let numberTwo = getDataFromUser(message: "Введите второе целое число:")

print("Вычисляю пример: \(numberOne) \(operation) \(numberTwo)")

if let numberOne = Int(numberOne) {
    if let numberTwo = Int(numberTwo) {
        calculate(operation: operation, numberOne: numberOne, numberTwo: numberTwo)
    } else {
        print("Вы ввели неверное второе число!")
    }
} else {
    print("Вы ввели неверное первое число!")
}


func calculate(operation: String, numberOne: Int, numberTwo: Int) {
    switch operation {
    case "+": showResult(numberOne + numberTwo)
    case "-": showResult(numberOne - numberTwo)
    case "*": showResult(numberOne * numberTwo)
    case "/":
        if numberTwo != 0 {
            showResult(numberOne / numberTwo)
        } else {
            print("На ноль делить нельзя!")
        }
            
    default: print("Вы выбрали неверную операцию!")
    }
}
