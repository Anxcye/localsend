winget install -e --id JRSoftware.InnoSetup --location "D:\Inno Setup 6"
# list all installed packages
winget list
# list dir d:\inno setup 6
ls "D:\Inno Setup 6"

Copy-Item "scripts\ChineseSimplified.isl" "D:\Inno Setup 6\Languages\"

# flutter clean
# flutter pub get
# flutter gen-l10n
# flutter build windows

# Remove-Item "D:\inno" -Force  -Recurse -ErrorAction SilentlyContinue
# New-Item -ItemType Directory -Force -Path "D:\inno"
# Copy-Item -Path "build\windows\x64\runner\Release\*" -Destination "D:\inno" -Recurse
# Copy-Item -Path "windows\runner\resources\app_icon.ico" -Destination "D:\inno\logo.ico"

# Copy-Item -Path "scripts\windows\x64\*" -Destination "D:\inno" -Recurse -ErrorAction SilentlyContinue
# Remove-Item "D:\inno-result" -Force  -Recurse -ErrorAction SilentlyContinue
# New-Item -ItemType Directory -Force -Path "D:\inno-result"

# # 7z a -tzip "D:\inno-result\app.zip" "D:\inno\*"


# Copy-Item "scripts\ChineseSimplified.isl" "D:\Inno Setup 6\Languages\"
# Copy-Item "scripts\ChineseTraditional.isl" "D:\Inno Setup 6\Languages\"
# & "D:\Inno Setup 6\ISCC.exe" ".\scripts\compile_windows_setup-inno.iss"

# Copy-Item "D:\inno-result\app.exe" "build\windows\app.exe"
# Copy-Item "D:\inno-result\app.zip" "build\windows\app.zip"

# Write-Output 'Generated Windows exe installer!'

