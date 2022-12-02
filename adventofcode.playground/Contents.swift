let adventcode = """
This is a driver for all of the advent of code 2022 problems
Created by krosener, mostly to get some of my code back onto github
"""

day1()

func day1() {
    let problem = "01"
    let input = ResourceReader.shared.readInputForProblem(problem)
    let answer = CalorieCounter.findMostCalorieCount(input)
    print(answer)
    let answer2 = CalorieCounter.topThreeHeapifyCalorieCounts(input)
    print(answer2)
}


