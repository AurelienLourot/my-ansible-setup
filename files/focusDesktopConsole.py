#!/usr/bin/python

import subprocess

COMMAND_LIST_WINDOWS = "wmctrl -l" # command for listing windows

'''
Character indicating if a windows is docked in the output of
COMMAND_LIST_WINDOWS.
'''
CHAR_COMMAND_LIST_WINDOWS_DOCKED = '-'

# Position of CHAR_COMMAND_LIST_WINDOWS_DOCKED:
POS_COMMAND_LIST_WINDOWS_DOCKED = 11

def runCommand(command):
    """ Run a shell command. 

    Blocks until the command has returned.
    return - Standard output. 

    """
    p = subprocess.Popen([command], stdout=subprocess.PIPE, shell=True)
    p.wait() # waits for termination

    result = ""
    for line in p.stdout: 
        result += line

    return result

def currentDesktop():
    """ Determine the ID of the current desktop. 

    Determines the ID (0..9) of the current desktop by parsing the output of 
    "wmctrl -d" which looks like
    0  - DG: 1280x1024  VP: 0,0  WA: 0,0 1280x1007  desktop 1
    1  * DG: 1280x1024  VP: 0,0  WA: 0,0 1280x1007  desktop 2
    2  - DG: 1280x1024  VP: 0,0  WA: 0,0 1280x1007  desktop 3
    3  - DG: 1280x1024  VP: 0,0  WA: 0,0 1280x1007  desktop 4
    4  - DG: 1280x1024  VP: 0,0  WA: 0,0 1280x1007  desktop 5
    5  - DG: 1280x1024  VP: 0,0  WA: 0,0 1280x1007  desktop 6
    6  - DG: 1280x1024  VP: 0,0  WA: 0,0 1280x1007  desktop 7
    7  - DG: 1280x1024  VP: 0,0  WA: 0,0 1280x1007  desktop 8

    Note: only IDs with one digit are supported. 
    return - ID of the desktop.

    """
    stdout = runCommand("wmctrl -d | grep \"*\"")
    return stdout[0] # first character

def numWindowsOnDesktop(desktopID):
    """ Determine the amount of windows on the given desktop.

    Determines the amount of windows including the console by parsing the output
    of COMMAND_LIST_WINDOWS which looks like
    0x0180006b -1 aurelien-f16 panel
    0x01a0005a -1 aurelien-f16 pcmanfm
    0x02800056  3 aurelien-f16 DesktopConsole4
    0x02800075  5 aurelien-f16 DesktopConsole6
    0x02800084  7 aurelien-f16 DesktopConsole8
    0x02800093  2 aurelien-f16 DesktopConsole3
    0x028000a2  0 aurelien-f16 DesktopConsole1
    0x028000b1  6 aurelien-f16 DesktopConsole7
    0x028000c0  4 aurelien-f16 DesktopConsole5
    0x028000cf  1 aurelien-f16 DesktopConsole2
    0x0b8000c3  0 aurelien-f16 Mozilla Firefox
    0x0b6000e6  1 aurelien-f16 *terminal<1>* - emacs@aurelien-f16

    param desktopID - Desktop ID
    return          - Number of windows.

    """
    stdout = runCommand(COMMAND_LIST_WINDOWS)
    result = 0
    for i in iter(stdout.splitlines()):
        if i[POS_COMMAND_LIST_WINDOWS_DOCKED] != CHAR_COMMAND_LIST_WINDOWS_DOCKED and i[12] == desktopID:
            result += 1

    return result

def numDockedWindows():
    """ Determine the amount of docked windows (i.e. visible on all desktops).

    return - Number of windows.

    """
    stdout = runCommand(COMMAND_LIST_WINDOWS)
    result = -2 # first two windows are actually not windows and don't count
    for i in iter(stdout.splitlines()):
        if i[POS_COMMAND_LIST_WINDOWS_DOCKED] == CHAR_COMMAND_LIST_WINDOWS_DOCKED:
            result += 1

    return result

def focusConsole():
    """ Give focus to console of current desktop. """
    consoleID = int(currDesktop) + 1
    command = "wmctrl -a DesktopConsole" + str(consoleID)
    runCommand(command)

def isConsoleAlone():
    """ Test if console is alone on the current desktop. 
    
    return - True if the console is alone. 

    """
    return numWindowsOnDesktop(currDesktop) == 1 and numDockedWindows() == 0

def main():
    """ Run the program. 

    Makes sure that the DesktopConsole gets the focus if it's currently alone on
    the current desktop. 

    """
    global currDesktop
    currDesktop = currentDesktop()
    if isConsoleAlone():
        focusConsole()

if __name__ == "__main__":
    main()
