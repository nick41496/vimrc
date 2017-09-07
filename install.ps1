If (Test-Path $Env:LOCALAPPDATA\nvim -PathType Container) {
  rm $Env:LOCALAPPDATA\nvim
  cmd /c mklink /D $Env:LOCALAPPDATA\nvim $Env:HOMEPATH\.vim
  cmd /c mklink $Env:LOCALAPPDATA\nvim\init.vim $Env:HOMEPATH\.vim\.vimrc
}
cmd /c mklink $Env:HOMEPATH\.vim\.vimrc $Env:HOMEPATH\.vimrc
cmd /c mkdir $Env:HOMEPATH\.vimundo
git submodule init
git submodule update

