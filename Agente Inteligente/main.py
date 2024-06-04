def steps(states, finish, actions, initState):
    state=initState

    steps=[]
    steps.append(state)

    action=0
    notFinished=True
    next_step=states[state][action]

    if state in finish:
        steps.append(actions[3])

    else:
        while notFinished:
            if next_step in finish:
                notFinished = False
                steps.append(actions[action])
                steps.append(next_step)
                steps.append(actions[3])

            else:
                if next_step in steps:
                    action = action + 1
                
                else:
                    steps.append(actions[action])
                    steps.append(next_step)
                    action=0

            if action >= 3:
                notFinished = False
                steps.append(action[3])
            
            else:
                next_step=states[next_step][action]

    return steps
    
def main():
    states=[
             [4,0,1],[3,0,1], 
             [6,2,3],[3,2,3], 
             [4,4,5],[7,4,5], 
             [6,6,7],[7,6,7]
            ]
    
    clean=[6,7]
    actions=["Limpiar", "Izquierda", "Derecha", "Apagar"]
    initialState=1
    
    result = steps(states, clean, actions, initialState)
    print(result)

if __name__=='__main__':
    main()