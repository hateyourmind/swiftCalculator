print("Добро пожаловать в простой калькулятор!")

print("Выберите операцию: +, -, * или /")
let operation = readLine() ?? ""

print("Введите первое целое число:")
let numberOne = readLine() ?? ""

print("Введите второе целое число:")
let numberTwo = readLine() ?? ""

print("Вычисляю пример: \(numberOne) \(operation) \(numberTwo)")

if let numberOne = Int(numberOne) {
    if let numberTwo = Int(numberTwo) {
        switch operation {
        case "+": print("Результат: \(numberOne + numberTwo)")
        case "-": print("Результат: \(numberOne - numberTwo)")
        case "*": print("Результат: \(numberOne * numberTwo)")
        case "/":
            if numberTwo != 0 {
                print("Результат: \(numberOne / numberTwo)")
            } else {
                print("На ноль делить нельзя!")
            }
                
        default: print("Вы выбрали неверную операцию!")
        }
    } else {
        print("Вы ввели неверное второе число!")
    }
} else {
    print("Вы ввели неверное первое число!")
}
