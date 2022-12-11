$date=date
$ObsidianDir = "C:\your\gitrepo\here"
cd $ObsidianDir
$Changes = git status
# check if repository has changes.
if ($changes -like "*Untracked files*" -or "*modified*"){
    git add .
}
else{
    echo $date "No notes taken" >> C:\your\logs\on\failure\here
}
# check if commits are needed
if ($Changes -like "*Changes to be committed*"){
    git commit -m "auto-commit"
    }
else {
    exit
    }
# upload
git push origin master
