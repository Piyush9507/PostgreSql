#!/bin/bash
# ---------------------------------------------------------------
# Complete Dev Environment Installer for macOS
# Installs: PostgreSQL, pgAdmin 4, VS Code, Git
# Author: Sayyed Siraj Ali
# ---------------------------------------------------------------

set -e

echo ""
echo "🚀 AccioJob SQL — macOS Setup Installer"
echo "========================================="
echo ""

# ── Step 1: Homebrew ─────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add Homebrew to PATH for Apple Silicon
  if [[ $(uname -m) == "arm64" ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  echo "✅ Homebrew already installed."
fi

echo "🔄 Updating Homebrew..."
brew update

# ── Step 2: PostgreSQL (latest) ──────────────────────────────────
if command -v psql &>/dev/null; then
  echo "✅ PostgreSQL already installed: $(psql --version)"
else
  echo "📦 Installing PostgreSQL (latest)..."
  brew install postgresql
  echo "🚀 Starting PostgreSQL service..."
  brew services start postgresql
fi

# ── Step 3: pgAdmin 4 ───────────────────────────────────────────
if [ -d "/Applications/pgAdmin 4.app" ]; then
  echo "✅ pgAdmin 4 already installed."
else
  echo "📦 Installing pgAdmin 4..."
  brew install --cask pgadmin4
fi

# ── Step 4: VS Code ─────────────────────────────────────────────
if command -v code &>/dev/null; then
  echo "✅ VS Code already installed: $(code --version | head -1)"
else
  echo "📦 Installing VS Code..."
  brew install --cask visual-studio-code

  # Register 'code' command in PATH
  VSCODE_BIN="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
  if [ -f "$VSCODE_BIN" ]; then
    echo "🔗 Registering 'code' command in PATH..."
    sudo ln -sf "$VSCODE_BIN" /usr/local/bin/code 2>/dev/null || {
      # If /usr/local/bin doesn't work, add to PATH via .zshrc
      echo "export PATH=\"\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin\"" >> ~/.zshrc
    }
  fi
fi

# ── Step 5: Git ──────────────────────────────────────────────────
if command -v git &>/dev/null; then
  echo "✅ Git already installed: $(git --version)"
else
  echo "📦 Installing Git..."
  brew install git

  # Ensure brew-installed git is found
  eval "$(brew shellenv 2>/dev/null)"
  hash -r 2>/dev/null
fi

# ── Summary ──────────────────────────────────────────────────────
echo ""
echo "========================================="
echo "🎯 Installation Complete! Here's your setup:"
echo "========================================="
echo ""

# PostgreSQL
psql_ver=$(psql --version 2>/dev/null || echo "not found")
echo "  🐘 PostgreSQL : $psql_ver"

# pgAdmin 4
if [ -d "/Applications/pgAdmin 4.app" ]; then
  echo "  🖥️  pgAdmin 4  : Installed (/Applications)"
else
  echo "  ⚠️  pgAdmin 4  : Not found"
fi

# VS Code
code_ver=$(code --version 2>/dev/null | head -1 || echo "not found")
echo "  📝 VS Code    : $code_ver"

# Git
git_ver=$(git --version 2>/dev/null || echo "not found")
echo "  🔀 Git        : $git_ver"

echo ""
echo "💡 Next Steps:"
echo "   1. Restart Terminal (so PATH updates take effect)"
echo "   2. Open pgAdmin 4 → Create Server → connect to localhost:5432"
echo "   3. Open VS Code → Install SQLTools + SQLTools PostgreSQL extensions"
echo ""
