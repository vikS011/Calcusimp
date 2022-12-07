//
//  ViewController.swift
//  Calcusimp
//
//  Created by Viktor Smirnov.
//Ich verwende Xcode über rdp auf MacinCloud. Die korrekte Erstellungszeit ist der 07.12.2022.
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    
    var workings: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
        
        // Do any additional setup after loading the view.
    }

    
    func clearAll() {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    func workingsIsNotEmpty() -> Bool{
        
        if(calculatorWorkings.text==""){
            return false
        }
        else{
            return true
        }
    }
    
  
    @IBAction func equalsTap(_ sender: Any) {
        
        if(workingsIsNotEmpty()){
            if(validInput()){
                let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
                let expression = NSExpression(format: checkedWorkingsForPercent)
                let result = expression.expressionValue(with: nil, context: nil) as! Double
                let resultString = formatResult(result: result)
                calculatorResults.text = resultString
            }else
            {
                let alert = UIAlertController(
                    title: "InvalidInput",
                    message: "Calculator unable to do match based on input ",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"Okay", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }
    
    
    func validInput() ->Bool
    {
        var count = 0
        
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count+=1
        }
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if(index==0){
                return false
            }
            if(index==workings.count-1){
                return false
            }
            if(previous != -1){
                if(previous-index==1){
                    return false
                }
                
            }
            previous=index
        }
        
        return true
    }
    
    var  dots = 0
    
    func dotsMoreAsOne() -> Bool{
        
      
        
        for char in workings
                
        {
            
            if(char=="."){
                dots+=1
            }
            if(mathCharacter(char: char)){
                dots-=1
            }

        }
        
        if(dots>1){
            return true
        }
        else{
            return false        }
        
    }
    
    
    func mathCharacter (char: Character) -> Bool{
        
        
        if(char=="-"){
            return true
        }
        if(char=="*"){
            return true
        }
        if(char=="/"){
            return true
        }
        if(char=="+"){
            return true
        }
        
        return false
    }
    
    
    //test
    
    
    
    
    func specialCharacter (char: Character) -> Bool{
        
        
        if(calculatorWorkings.text?.last=="%"){
            
            
            if(mathCharacter(char: char)){
                return true
                
            }
            
        }
        
        if(((char==".")&&(calculatorWorkings.text?.first=="."))||(calculatorWorkings.text?.last==".")||(dotsMoreAsOne())){
            dots=0
            return true
        }
        if((char=="%")&&(calculatorWorkings.text?.first=="%")){
            return true
        }
        if(char=="*"){
            return true
        }
        if(char=="/"){
            return true
        }
        if(char=="+"){
            return true
        }
        
        return false
    }
    
    
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1)==0){
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
            
        }
    }
    
    
    @IBAction func allClearTap(_ sender: Any) {
            clearAll()    }
    
    
    @IBAction func backTap(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            calculatorWorkings.text=workings
        }
    }
    
    func addToWorkings(value: String){
        workings = workings + value
        calculatorWorkings.text = workings
        
    }
    
    @IBAction func percentTab(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any) {
        addToWorkings(value: "/")    }
    
    @IBAction func timesTap(_ sender: Any) {
        addToWorkings(value: "*")    }
    
    @IBAction func plusTap(_ sender: Any) {
        addToWorkings(value: "+")    }
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorkings(value: "-")    }
    
    @IBAction func dezimalTap(_ sender: Any) {
        addToWorkings(value: ".")    }
    
    @IBAction func squareRootTap(_ sender: Any) {
        addToWorkings(value: "√")
        
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")     }
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1")    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")    }
    
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3")    }
    
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5")    }
    
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9")    }
    
    
    
    
}

