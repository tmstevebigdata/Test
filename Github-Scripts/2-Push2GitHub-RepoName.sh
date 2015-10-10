# Open Git Bash and run from directory - C:\GitHub
# To run script, use command - sh Push2GitHub-RepoName.sh

# Change only the parameter below
TgtDir="RepoName"

# Define Function
function pause() {
   read -p "$*"
}

# Clear the screen
clear

# Main
echo Target Directory = $TgtDir
echo.

# Set up name and email address for git commits
# Once off
git config --global user.name  "RepoID"
git config --global user.email "UserEmail"

# Set up Proxy
git config --global --unset http.proxy
git config --system --unset http.proxy

# Go to working directory
cd C:/GitHub/$TgtDir

# Set up remote origin
git remote rm origin
git config remote.origin.url "https://RepoID:RepoPSW@github.com/RepoID/$TgtDir.git"

# Pull files from GitHub
git pull -u origin master

# Add and commit all files
git add -A
git commit -m "Committed file"

# Push files to GitHub
git remote -v

git branch --track $remote
git push -u origin master

# Show current directory and files
echo -- Current Directory --
pwd
echo.
echo -- Files --
ls -al

# End
echo.
pause "Paused! Press a key to exit."

exit
