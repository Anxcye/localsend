# winget install -e --id JRSoftware.InnoSetup --location "D:\Inno Setup 6"

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

# 7z a -tzip "D:\inno-result\app.zip" "D:\inno\*"


# Copy-Item "scripts\ChineseSimplified.isl" "D:\Inno Setup 6\Languages\"
# Copy-Item "scripts\ChineseTraditional.isl" "D:\Inno Setup 6\Languages\"
# & "D:\Inno Setup 6\ISCC.exe" ".\scripts\compile_windows_setup-inno.iss"

# Copy-Item "D:\inno-result\app.exe" "build\windows\app.exe"
# Copy-Item "D:\inno-result\app.zip" "build\windows\app.zip"

# Write-Output 'Generated Windows exe installer!'

# 设置错误操作首选项
$ErrorActionPreference = "Stop"

# 定义 Inno Setup 安装路径
$innoSetupPath = "C:\Program Files (x86)\Inno Setup 6"

# 安装 Inno Setup
Write-Host "Installing Inno Setup..."
winget install -e --id JRSoftware.InnoSetup --silent

# 验证 Inno Setup 安装
if (-not (Test-Path $innoSetupPath)) {
    throw "Inno Setup installation failed or path is incorrect"
}

# Flutter 构建步骤
Write-Host "Building Flutter application..."
flutter clean
flutter pub get
flutter config --enable-windows-desktop
# 确保启用了 generate
flutter gen-l10n
flutter build windows

# 准备打包目录
$innoDir = "D:\inno"
$innoResultDir = "D:\inno-result"

# 清理并创建目录
Remove-Item $innoDir -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item $innoResultDir -Force -Recurse -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path $innoDir
New-Item -ItemType Directory -Force -Path $innoResultDir

# 复制构建文件
Write-Host "Copying build files..."
Copy-Item -Path "build\windows\x64\runner\Release\*" -Destination $innoDir -Recurse
Copy-Item -Path "windows\runner\resources\app_icon.ico" -Destination "$innoDir\logo.ico"
Copy-Item -Path "scripts\windows\x64\*" -Destination $innoDir -Recurse -ErrorAction SilentlyContinue

# 创建 ZIP 包
Write-Host "Creating ZIP package..."
7z a -tzip "$innoResultDir\app.zip" "$innoDir\*"

# 复制语言文件
$languagesDir = Join-Path $innoSetupPath "Languages"
if (-not (Test-Path $languagesDir)) {
    New-Item -ItemType Directory -Force -Path $languagesDir
}

Write-Host "Copying language files..."
Copy-Item "scripts\ChineseSimplified.isl" $languagesDir -ErrorAction Continue
Copy-Item "scripts\ChineseTraditional.isl" $languagesDir -ErrorAction Continue

# 编译安装程序
Write-Host "Compiling installer..."
$iscc = Join-Path $innoSetupPath "ISCC.exe"
if (-not (Test-Path $iscc)) {
    throw "ISCC.exe not found at expected location"
}

& $iscc ".\scripts\compile_windows_setup-inno.iss"

# 复制最终结果
Write-Host "Copying final results..."
Copy-Item "$innoResultDir\app.exe" "build\windows\app.exe" -ErrorAction Continue
Copy-Item "$innoResultDir\app.zip" "build\windows\app.zip" -ErrorAction Continue

Write-Output 'Windows exe installer generated successfully!'