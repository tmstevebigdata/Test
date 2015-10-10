# Open Git Bash and run from directory - C:\GitHub
# To run script, use command - sh CloneFromGitHub-RepoName.sh

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
cd C:/GitHub/

# Clone using HTTPS
git clone https://github.com/RepoID/$TgtDir.git

# Go to clone directory
cd $TgtDir

# Set up origin
git remote rm origin
git remote add origin "https://github.com/RepoID/$TgtDir.git"

# Init local cloned directory
git init

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
