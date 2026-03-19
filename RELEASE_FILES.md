# Recommended release bundle

1. `LiveCaptionsTranslator-win-x64-withruntime.exe`
2. `OllamaSetup.exe`
4. `scripts/install_qwen2.5-3b.ps1`

## User steps

1. Run `OllamaSetup.exe` to install Ollama.
2. Run `scripts/install_qwen2.5-3b.ps1` to pull model `qwen2.5:3b`.
3. Start `LiveCaptionsTranslator-win-x64-withruntime.exe`.

## Notes

- If Ollama is already installed, users can skip step 1.
- Step 2 requires internet access for first-time model download.
- If the script cannot find `ollama`, restart terminal/Windows and run again.
