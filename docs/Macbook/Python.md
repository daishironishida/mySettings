# Python

## Pyenv

Install [pyenv](https://github.com/pyenv/pyenv)

```
brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

## Poetry

Install [poetry](https://python-poetry.org/docs/)

```
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="/Users/daishiro/.local/bin:$PATH"' >> ~/.zshrc
```

Set virtualenv folder to be in project:
```
poetry config virtualenvs.in-project true
```

## VS Code

- Install [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) extension

