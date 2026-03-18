# LiveCaptions-Translator 打包为可执行文件（Windows）

## 1. 环境准备

- 操作系统：Windows 11（建议 22H2+）
- 安装 .NET SDK 8（建议使用 8.x）
- 在仓库根目录执行命令：`f:\proj-audio\LiveCaptions-Translator`

## 2. 还原依赖与检查

```powershell
dotnet restore
dotnet format .\LiveCaptionsTranslator.csproj --verify-no-changes --verbosity diagnostic
dotnet test --verbosity normal
```

## 3. 发布为单文件 EXE

### x64（含运行时，自包含）

```powershell
dotnet publish -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -p:EnableCompressionInSingleFile=true -o .\publish\x64\selfcontained
```

产物路径：

- `.\publish\x64\selfcontained\LiveCaptionsTranslator.exe`

### x64（不含运行时，框架依赖）

```powershell
dotnet publish -c Release -r win-x64 --self-contained false -p:PublishSingleFile=true -o .\publish\x64\framework
```

产物路径：

- `.\publish\x64\framework\LiveCaptionsTranslator.exe`

### arm64（含运行时，自包含）

```powershell
dotnet publish -c Release -r win-arm64 --self-contained true -p:PublishSingleFile=true -p:EnableCompressionInSingleFile=true -o .\publish\arm64\selfcontained
```

产物路径：

- `.\publish\arm64\selfcontained\LiveCaptionsTranslator.exe`

### arm64（不含运行时，框架依赖）

```powershell
dotnet publish -c Release -r win-arm64 --self-contained false -p:PublishSingleFile=true -o .\publish\arm64\framework
```

产物路径：

- `.\publish\arm64\framework\LiveCaptionsTranslator.exe`

## 4. 推荐分发命名

可按以下名称重命名，便于区分架构与是否内置运行时：

- `LiveCaptionsTranslator-win-x64-withruntime.exe`（x64 自包含）
- `LiveCaptionsTranslator-win-x64.exe`（x64 框架依赖）
- `LiveCaptionsTranslator-win-arm64-withruntime.exe`（arm64 自包含）
- `LiveCaptionsTranslator-win-arm64.exe`（arm64 框架依赖）

## 5. 自动化构建（可选）

仓库已配置 GitHub Actions 工作流 `.github/workflows/dotnet-build.yml`：

- push/PR 会自动构建与测试
- push `v*` tag 会额外生成 Release 附件

## 6. 模型创建命令（原脚本）

```powershell
ollama rm sakura-1.5b
python .\scripts\ollama_create_sakura.py --name sakura-1.5b --gguf "path\to\gguf file"

# qwen2.5:3b
ollama pull qwen2.5:3b
```

