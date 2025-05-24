# russian roulette game implementation in python
import random


def print_menu():
    print("1 - Show RULES")
    print("2 - Start New Game")
    print("3 - Exit Game")


def game():
    choice = int(input("Enter the key to choose: "))

    if (choice==1):
        print(" - Choose a random chamber of the revolver from 1-6")
        print(" - If the bullet is in that chamber you are DEAD!!")
        print(" - Else you SURVIVED the ROULETTE!!")
        print_menu()
        game()
    elif (choice==3):
        print("----- OKAY EXITING... -----")
    elif (choice==2):
        playOn = True;
        while (playOn):
            num = int(input("Choose the chamber [1-6]: "))
            if (num>=1 and num<=6):
                randNum = random.randint(1,6)
                if (randNum==num):
                    print("You Died!!")
                    print("----- GAME OVER -----");
                    break;
                else:
                    print("You Survived!!")
                    toCont = int(input("Do you want to continue playing?(1-yes/0-no): "))
                    if (toCont!=1):
                        playOn = False
            else:
                print("Wrong Input");
                print("Try Again...");
        if (playOn==False):
            print("----- OKAY EXITING... -----")
    else:
        print("Wrong Key!")
        print("Try Again...")
        game()

print("----- RUSSIAN ROULETTE -----")
print()
print_menu()
game()

