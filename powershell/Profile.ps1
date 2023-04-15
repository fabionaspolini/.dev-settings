Import-Module posh-git

function docker {
    wsl.exe -d Ubuntu-20.04 docker $args
}