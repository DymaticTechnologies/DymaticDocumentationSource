set /P message="Commit Message: "

git add -A
git commit -m "%message%"
git push

git clone https://github.com/DymaticTechnologies/DymaticDocumentation.git DymaticDocumentation

SETLOCAL
SET "sourcedir=DymaticDocumentation"
SET "keepdir=git"
SET "keepfile="
FOR /d %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
FOR %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" DEL "%%a"

robocopy "book" "DymaticDocumentation" "*.*" /E

cd DymaticDocumentation
git add -A
git commit -m "%message%"
git push

cd ../

rmdir /s /q "DymaticDocumentation"

PAUSE