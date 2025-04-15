��
@echo off
cls
:menu
cls
echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
echo      XOR Encryptor - By luca
echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
echo                Menu
echo ===================================
echo [1] Encrypt Text
echo [2] Decrypt Text
echo [3] Exit
echo ===================================
echo Please be patient while crypting.
echo ===================================
set /p choice=%username%: 

if "%choice%"=="1" goto encrypt
if "%choice%"=="2" goto decrypt
if "%choice%"=="3" exit
goto menu

:encrypt
cls
set /p plaintext=Enter text to encrypt: 
set /p key=Enter encryption key: 
powershell -NoProfile -Command ^
  "$input='%plaintext%'; $key='%key%'; $out='';" ^
  "for ($i=0; $i -lt $input.Length; $i++) {" ^
    "$out += [int]([char]$input[$i] -bxor [char]$key[$i %% $key.Length]);" ^
    "if ($i -lt $input.Length - 1) { $out += ',' }" ^
  "}; Write-Host 'Encrypted: ' $out"
pause
goto menu

:decrypt
cls
set /p encrypted=Enter comma-separated numbers: 
set /p key=Enter decryption key: 
powershell -NoProfile -Command ^
  "$input='%encrypted%'.Split(','); $key='%key%'; $out='';" ^
  "for ($i=0; $i -lt $input.Length; $i++) {" ^
    "$out += [char]([int]$input[$i] -bxor [char]$key[$i %% $key.Length])" ^
  "}; Write-Host 'Decrypted: ' $out"
pause
goto menu
