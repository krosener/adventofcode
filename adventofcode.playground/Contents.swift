let adventcode = """
This is a driver for all of the advent of code 2022 problems
Created by krosener, mostly to get some of my code back onto github
"""

day8()

func day1() {
    let problem = "01"
    let input = ResourceReader.shared.readInputForProblem(problem)
    let answer = CalorieCounter.findMostCalorieCount(input)
    print(answer)
    let answer2 = CalorieCounter.topThreeHeapifyCalorieCounts(input)
    print(answer2)
}

func day2() {
    let problem = "02"
    let input = ResourceReader.shared.readInputForProblem(problem)
    let answer = RPSScoreCounter.countP1Score(input)
    print(answer)
    let answer2 = RPSScoreCounter.countP2Score(input)
    print(answer2)
}

func day3() {
    let problem = "03"
    let input = ResourceReader.shared.readInputForProblem(problem)
    let answer = RucksackReorganizer.p1GetPriorities(input)
    print(answer)
    let answer2 = RucksackReorganizer.p2GetBadges(input)
    print(answer2)
}

func day4() {
    let problem = "04"
    let input = ResourceReader.shared.arrayInputForProblem(problem)
    let answer = AssignmentOptimizer.p1GetOverlap(input)
    print(answer)
    let answer2 = AssignmentOptimizer.p2GetAnyOverlap(input)
    print(answer2)
}

func day5() {
    let problem = "05"
    let input = ResourceReader.shared.arrayInputForProblem(problem)
    let answer = CrateMover.p1MoveCrates(input)
    print(answer)
    let answer2 = CrateMover.p2MoveCrates(input)
    print(answer2)
}

func day6() {
    let problem = "06"
    let input = ResourceReader.shared.readInputForProblem(problem)
    let answer = SignalFinder.p1GetStartOfPacket(input)
    print(answer)
    let answer2 = SignalFinder.p2GetStartOfMessage(input)
    print(answer2)
}

func day7() {
    let problem = "07"
    let input = ResourceReader.shared.arrayInputForProblem(problem)
    let edf = ElfDeleteFolder(input)
    let answer = edf.p1FindSumOfSmallFolders()
    print(answer)
    let answer2 = edf.p2FindSmallestDirToDelete()
    print(answer2)
}

func day8() {
    let problem = "08"
    let input = ResourceReader.shared.arrayInputForProblem(problem)
    let calculator = THVisibleCalculator(input)
    let answer = calculator.p1CountVisibleTrees()
    print(answer)
    let answer2 = calculator.p2CountScenicScores()
    print(answer2)
}
