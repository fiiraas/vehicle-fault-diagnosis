; Automotive Expert System

; printing intro

(defrule read-direction
	(initial-fact)
	=>
	(printout t " AUTOMOBILE EXPERT SYSTEM " crlf crlf)
	(printout t " Press 1 to proceed to the system || Press 2 to read about the system: ")
	
	(assert (direction(read))))

;	about

(defrule explanation-facility
	(direction 2)
	=>
	(printout t "- This system is developed to identify the symptom of vehicle's fault." crlf)
	(printout t "- There are four main parts of vehicles that this system is focusing on. Engine, tyres, headlights and brake." crlf crlf)
	(printout t "Press 1 to continue using this system: ")
	
	(assert (direction(read))))

; defining problem type from user

(defrule problem-type
	(direction 1)
	=>
	(printout t " What is the problem type? [engine/tyres/brake/headlights] *case-sensitive* : ")
	
	(assert (problem-type(read))))

; questions for engine problem

(defrule read-engineStarts
	(problem-type engine)
	=>
	(printout t "Does your engine starts? [yes/no] *case sensitive*: ")
	(assert (engineStarts(read))))

(defrule read-engineRunNormal
	(problem-type engine)
	(engineStarts yes)
	=>
	(printout t "Does your engine runs normally? [yes/no] *case sensitive*: ")
	(assert (engineRunNormal(read))))

(defrule read-engineSluggish
	(problem-type engine)
	(engineStarts yes)
	(engineRunNormal no)
	=>
	(printout t "Does your engine sluggish? [yes/no] *case sensitive*: ")
	(assert (engineSluggish(read))))

(defrule read-engineMisfire
	(problem-type engine)
	(engineStarts yes)
	(engineRunNormal no)
	(engineSluggish no)
	=>
	(printout t "Does your engine misfire? [yes/no] *case sensitive*: ")
	(assert (engineMisfire(read))))

(defrule read-engineKnocking
	(problem-type engine)
	(engineStarts yes)
	(engineRunNormal no)
	(engineSluggish no)
	(engineMisfire no)
	=>
	(printout t "Does your engine knocking? [yes/no] *case sensitive*: ")
	(assert (engineKnocking(read))))

(defrule read-engineRotate
	(problem-type engine)
	(engineStarts no)
	=>
	(printout t "Does your engine rotates? [yes/no] *case sensitive*: ")
	(assert (engineRotate(read))))

(defrule read-haveGas
	(problem-type engine)
	(engineStarts no)
	(engineRotate yes)
	=>
	(printout t "Does your car has gas? [yes/no] *case sensitive*: ")
	(assert (haveGas(read))))

; questions for tyres problem

(defrule read-tyresInflated
	(problem-type tyres)
	=>
	(printout t "Are your tyres inflated? [yes/no] *case sensitive*: ")
	(assert (tyresInflated(read))))

(defrule read-tyresPunctured
	(problem-type tyres)
	(tyresInflated no)
	=>
	(printout t "Is there any tyres punctured? [yes/no] *case sensitive*: ")
	(assert (tyresPunctured(read))))

(defrule read-tyresAligned
	(problem-type tyres)
	(tyresInflated yes)
	=>
	(printout t "Are the tyres aligned? [yes/no] *case sensitive*: ")
	(assert (tyresAligned(read))))

(defrule read-tyresMovingFreely
	(problem-type tyres)
	(tyresInflated yes)
	(tyresAligned yes)
	=>
	(printout t "Are the tyres moving freely? [yes/no] *case sensitive*: ")
	(assert (tyresMovingFreely(read))))

(defrule read-tyresVibrating
	(problem-type tyres)
	(tyresInflated yes)
	(tyresAligned yes)
	(tyresMovingFreely yes)
	=>
	(printout t "Are the tyres moving vibrating? [yes/no] *case sensitive*: ")
	(assert (tyresVibrating(read))))

(defrule read-mudDirt
	(problem-type tyres)
	(tyresInflated yes)
	(tyresAligned yes)
	(tyresMovingFreely yes)
	(tyresVibrating yes)
	=>
	(printout t "Is there any mud or dirt at the tyres? [yes/no] *case sensitive*: ")
	(assert (mudDirt(read))))

(defrule read-tyresBearingNoise
	(problem-type tyres)
	(tyresInflated yes)
	(tyresAligned yes)
	(tyresMovingFreely yes)
	(tyresVibrating yes)
	(mudDirt no)
	=>
	(printout t "Is there any noise from tyres bearing? [yes/no] *case sensitive*: ")
	(assert (tyresBearingNoise(read))))

; questions for brake problem

(defrule read-brakeHard
	(problem-type brake)
	=>
	(printout t "Does your brake pedal feels hard? [yes/no] *case sensitive*: ")
	(assert (brakeHard(read))))

(defrule read-carUnusedLongterm
	(problem-type brake)
	(brakeHard yes)
	=>
	(printout t "Is your car been unused for a long period? [yes/no] *case sensitive*: ")
	(assert (carUnusedLongterm(read))))

(defrule read-brakePedalSquishy
	(problem-type brake)
	(brakeHard no)
	=>
	(printout t "Does the brake pedal feels squishy? [yes/no] *case sensitive*: ")
	(assert (brakePedalSquishy(read))))

(defrule read-pullOneSideWhenBrake
	(problem-type brake)
	(brakeHard no)
	(brakePedalSquishy no)
	=>
	(printout t "Does your car pull to one side when braking? [yes/no] *case sensitive*: ")
	(assert (pullOneSideWhenBrake(read))))

(defrule read-brakeRotorsThick
	(problem-type brake)
	(brakeHard no)
	(brakePedalSquishy no)
	(pullOneSideWhenBrake no)
	=>
	(printout t "Are the rotors still thick? [yes/no] *case sensitive*: ")
	(assert (brakeRotorsThick(read))))

(defrule read-leakageInMasterCylinder
	(problem-type brake)
	(brakeHard no)
	(brakePedalSquishy yes)
	=>
	(printout t "Is there any fluid leakage in master cylinder? [yes/no] *case sensitive*: ")
	(assert (leakageInMasterCylinder(read))))

; questions for headlights problem

(defrule read-headlightWorking
	(problem-type headlights)
	=>
	(printout t "Is the headlights working? [yes/no] *case sensitive*: ")
	(assert (headlightWorking(read))))

(defrule read-connectionTight
	(problem-type headlights)
	(headlightWorking no)
	=>
	(printout t "Are the wiring connections tight? [yes/no] *case sensitive*: ")
	(assert (connectionTight(read))))

(defrule read-headlightDim
	(problem-type headlights)
	(headlightWorking yes)
	=>
	(printout t "Is the headlights dim? [yes/no] *case sensitive*: ")
	(assert (headlightDim(read))))

(defrule read-oldAlternator
	(problem-type headlights)
	(headlightWorking yes)
	(headlightDim no)
	=>
	(printout t "Is the alternator old? [yes/no] *case sensitive*: ")
	(assert (oldAlternator(read))))

; repair rules for engine

(defrule engineNormalDecision
	(problem-type engine)
	(engineRunNormal yes)
	=>
	(printout t "Result: No repair needed."))

(defrule engineSluggishDecision
	(problem-type engine)
	(engineSluggish yes)
	=>
	(printout t "Result: Clean the fuel line."))

(defrule engineMisfireDecision
	(problem-type engine)
	(engineMisfire yes)
	=>
	(printout t "Result: Adjust point gap."))

(defrule engineKnockingDecision
	(problem-type engine)
	(engineKnocking yes)
	=>
	(printout t "Result: Change engine oil."))

(defrule tankFilledOrEmpty
	(problem-type engine)
	(haveGas no)
	=>
	(printout t "Result: Fill in the gas tank."))

(defrule tankFilledOrEmpty
	(problem-type engine)
	(haveGas yes)
	=>
	(printout t "Result: Take your car to the nearest mechanic."))

(defrule changeBattery
	(problem-type engine)
	(engineStarts no)
	(engineRotate no)
	=>
	(printout t "Result: Change your vehicle's battery."))

; repair rules for tyres

(defrule tyresInflatedDecision
	(problem-type tyres)
	(tyresInflated no)
	(tyresPunctured no)
	=>
	(printout t "Result: Get tyres inflated."))

(defrule tyresPuncturedDecision
	(problem-type tyres)
	(tyresInflated no)
	(tyresPunctured yes)
	=>
	(printout t "Result: Get the punctured tyre repaired."))

(defrule tyresAlignedDecision
	(problem-type tyres)
	(tyresInflated yes)
	(tyresAligned no)
	=>
	(printout t "Result: Get tyres aligned."))

(defrule tyresMovingFreelyDecision
	(problem-type tyres)
	(tyresInflated yes)
	(tyresMovingFreely no)
	=>
	(printout t "Result: Apply oil in axle."))

(defrule tyresVibratingDecision
	(problem-type tyres)
	(tyresInflated yes)
	(tyresVibrating no)
	=>
	(printout t "Result: No repair needed."))

(defrule tyresMovingFreelyDecision
	(problem-type tyres)
	(tyresInflated yes)
	(tyresMovingFreely no)
	=>
	(printout t "Result: Apply oil in axle."))

(defrule mudDirtDecision
	(problem-type tyres)
	(tyresInflated yes)
	(mudDirt yes)
	=>
	(printout t "Result: Clean mud and dirt."))

(defrule tyresBearingDecisionNo
	(problem-type tyres)
	(tyresInflated yes)
	(mudDirt no)
	(tyresBearingNoise no)
	=>
	(printout t "Result: Change tyres bearings."))

(defrule tyresBearingDecisionYes
	(problem-type tyres)
	(tyresInflated yes)
	(mudDirt no)
	(tyresBearingNoise yes)
	=>
	(printout t "Result: Take your car to the nearest mechanic."))

; repair rules for brake

(defrule carUnusedLongtermNo
	(problem-type brake)
	(brakeHard yes)
	(carUnusedLongterm no)
	=>
	(printout t "Result: Repair the leaking vacuum."))

(defrule carUnusedLongtermYes
	(problem-type brake)
	(brakeHard yes)
	(carUnusedLongterm yes)
	=>
	(printout t "Result: Check for rusting near pedal."))

(defrule pullOneSideWhenBrakeDecision
	(problem-type brake)
	(brakeHard no)
	(brakePedalSquishy no)
	(pullOneSideWhenBrake yes)
	=>
	(printout t "Result: Take your car to the nearest mechanic."))

(defrule rotorsThick
	(problem-type brake)
	(brakeHard no)
	(brakePedalSquishy no)
	(pullOneSideWhenBrake no)
	(brakeRotorsThick yes)
	=>
	(printout t "Result: Resurface rotors."))

(defrule rotorsNotThick
	(problem-type brake)
	(brakeHard no)
	(brakePedalSquishy no)
	(pullOneSideWhenBrake no)
	(brakeRotorsThick no)
	=>
	(printout t "Result: Replace the pads."))

(defrule leakageFluid
	(problem-type brake)
	(brakeHard no)
	(brakePedalSquishy yes)
	(leakageInMasterCylinder yes)
	=>
	(printout t "Result: Fix the leakage."))

(defrule noLeakageFluid
	(problem-type brake)
	(brakeHard no)
	(brakePedalSquishy yes)
	(leakageInMasterCylinder no)
	=>
	(printout t "Result: Replace the cylinder."))

; repair rules for headlights

(defrule connectionTightNo
	(problem-type headlights)
	(headlightWorking no)
	(connectionTight no)
	=>
	(printout t "Result: Replace bulb."))

(defrule connectionTightYes
	(problem-type headlights)
	(headlightWorking no)
	(connectionTight yes)
	=>
	(printout t "Result: Inspect the electrical connector and check replacement if needed."))

(defrule dimHeadlight
	(problem-type headlights)
	(headlightWorking yes)
	(headlightDim yes)
	=>
	(printout t "Result: Replace bulb."))

(defrule alternatorOld
	(problem-type headlights)
	(headlightWorking yes)
	(headlightDim no)
	(oldAlternator no)
	=>
	(printout t "Result: Replace the alternator."))

(defrule alternatorNotOld
	(problem-type headlights)
	(headlightWorking yes)
	(headlightDim no)
	(oldAlternator yes)
	=>
	(printout t "Result: Replace the alternator with high amperage."))