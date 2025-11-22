# Text Elite - 



A Windows-compatible build (Linux Soon) system for Text Elite 1.5, the classic space trading game by Ian Bell and David Braben.

You can find the original application here: http://elitehomepage.org/text/index.htm

Diven by CMake, the project will download and extract the original source code and apply a small patch automatically that will allow it to be compiled on modern systems.


## Quick Start / Build & Run
- `.\scripts\build.ps1` - Download source, configure, and build
- `.\scripts\run.ps1` - Run the game with proper console encoding
- `.\scripts\clean.ps1` - Remove all generated files


## Project Structure

```
TxtElite/
├── scripts/          # PowerShell helper scripts
├── trades/           # Automated trading strategies
├── download/         # Downloaded source archive (generated)
├── src/              # Extracted and patched source (generated)
├── build/            # Build artifacts and executable (generated)
├── CMakeLists.txt    # Build configuration
├── goatsoup_fix.patch # Windows compatibility patch
└── .gitignore
```

## Trading Strategies

The game includes pre-programmed trading routes. The best route is **Diso ↔ Leesti**:
- 100 cycles: ~48,000 CR profit (480x return)
- Shorter distances than other routes
- Best price margins

Run with:
```powershell
.\build\Release\txtelite.exe .\trades\check_markets.txt
```

## Requirements

- Windows 10/11
- Visual Studio 2022 (Community Edition or higher)
- CMake 3.10+
- PowerShell 5.1+

## How It Works

1. CMake downloads Text Elite 1.5 source from http://elitehomepage.org
2. Applies Windows compatibility fixes:
   - Removes incompatible headers (conio.h, graph.h, malloc.h)
   - Fixes character encoding in goat_soup function
3. Builds with Visual Studio 2022
4. Sets proper console encoding for text display

---

## TODO 

- Linux 

---

## Credits

- Original Elite: Ian Bell & David Braben
- Text Elite: Ian Bell
- Source: http://elitehomepage.org/text/

## License

Original Text Elite 1.5 - See source header for details


