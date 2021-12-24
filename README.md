# Bash Script to Bootstrap ESLint and Prettier for JavaScript Projects

## Description:

- Interactive bash script
- Creates Node.js or React Projects
- Sets up ESLint Security Rules
- Sets up Prettier

## Requirements

- Visual Studio Code with Extensions:
- ESLint
- Prettier

## Usage

- Clone github repo
- Run bash script or Bootstrap

```shell
chmod +x jsinit.sh
./jsinit.sh
```

## Bootstrap

- Move jsinit.sh to:

```shell
mv jsinit.sh /usr/local/bin/
```

- Create a .bashrc or .zshrc depending on your shell

```shell
#ZSH Example
touch ~/.zshrc
```

- Create an alias to your .bashrc or .zshrc file to quickly create projects

```shell
alias jsinit='bash /usr/local/bin/jsinit.sh'
```
