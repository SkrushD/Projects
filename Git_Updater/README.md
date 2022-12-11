### Variables
First I set up variables that I would need through the script.
```PowerShell
$ObsidianDir = "C:\path\to\obsidian\gitrepo"
# I used this in a variable to easily test against a test repository as well as in case I move my repository it is as simple as changing my variable in order to update the script.
$Changes = "git status" 
# This $Changes variable will be used in our if statements to see if there are untracked files or file modifications and/or new commits that need to be made.
```
before getting into the body of the script we first point it to our directory variable
```PowerShell
cd $ObsidianDir
```
### For Loops
The entire functionality of the script hinges on two for loops to first check the changes variable and then execute actions based on that output
```PowerShell
if ($changes -like "*untracked files*" -or "*modified*"){
	git add .
}
else{
	echo $date "No notes taken" >> C:\path\to\gitupdatelog.txt
}
```
This first for loop checks our git status command for keywords that tell us we need to add files to be staged for commit.
```PowerShell
if ($Changes -like "*Changes to be committed*"){
	git commit -m "auto-commit"
}
else{
	exit
}
```
This second for loop essentially check to see if anything from the previous for loop was staged for commit and commits it to our repository locally.
### Upload
The final piece to the script is a simple command to upload our changes to github
```PowerShell
git push origin master
```
Keep in mind this final piece will be dependent on your own branch name but in this case I used the branch master.
### Schedule
Don't forget this can be automated with schtasks in order to run at the end of the week if you desire a weekly update to your github!