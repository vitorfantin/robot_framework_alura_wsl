# 🚀 Projeto Robot Framework - Alura (WSL Ubuntu)

Este projeto é um exemplo didático de automação de testes com **Robot Framework + Selenium + FakerLibrary**, usando o **WSL Ubuntu no Windows 11**.

Obs: Processo de instalação WSL não está incluso no treinamento da plataforma alura, inseri aqui como uma maneira de salvar os processos, guia abaixo foi gerado com auxilio do ChatGPT. 

---

## 🎯 Objetivo

Aprender a configurar um ambiente de testes automatizados no Linux (via WSL), com organização de pastas, ambiente virtual, dependências e execução de testes.

---

## 🧱 Estrutura do Projeto

```
robot_framework_alura_wsl/
├── ambiente-virtual/        # Ambiente virtual Python (nome customizado)
├── tests/                   # Casos de teste em arquivos .robot
├── requirements.txt         # Lista de dependências Python
└── README.md                # Este arquivo de instruções
```

---

## ⚙️ Parte 1 — Configurações no SISTEMA WSL (fora do ambiente virtual)

Essas instalações são **globais no Ubuntu do WSL**, e **não fazem parte do ambiente virtual Python**.

### 1. Atualizar pacotes do sistema

```bash
sudo apt update && sudo apt upgrade -y
```

---

### 2. Instalar Python 3, pip e ferramentas básicas

```bash
sudo apt install python3 python3-pip python3-venv wget unzip curl -y
```

> **Importante:** O `pip` é o gerenciador de pacotes Python, necessário para instalar bibliotecas dentro do ambiente virtual.

Verifique se está tudo certo:

```bash
python3 --version
pip3 --version
```

Se quiser usar o comando `pip` diretamente (sem `pip3`), crie um link simbólico:

```bash
sudo ln -s /usr/bin/pip3 /usr/bin/pip
```

---

## 🌐 Instalar o navegador Google Chrome e ChromeDriver

### 3. Instalar o Google Chrome oficial

```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
```

Verifique:

```bash
google-chrome --version
```

---

### 4. Instalar o ChromeDriver compatível

> **Pré-requisito:** Instale o `jq`, ferramenta para manipular JSON no shell:

```bash
sudo apt install jq -y
```

> Depois execute os comandos:

```bash
CHROME_VERSION=$(google-chrome --version | grep -oP '\d+\.\d+\.\d+' | head -1)
echo "Versão do Chrome: $CHROME_VERSION"

DRIVER_URL=$(curl -s https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json | jq -r --arg ver "$CHROME_VERSION" '.channels.Stable.downloads.chromedriver[] | select(.platform == "linux64") | .url')
echo "URL do ChromeDriver: $DRIVER_URL"

wget -O chromedriver.zip "$DRIVER_URL"
unzip chromedriver.zip
chmod +x chromedriver-linux64/chromedriver
sudo mv chromedriver-linux64/chromedriver /usr/local/bin/chromedriver
```

Verifique a instalação com:

```bash
chromedriver --version
```

---

## 🐍 Parte 2 — Configurações dentro do ambiente virtual Python

### 1. Criar a pasta do projeto

```bash
mkdir robot_framework_alura_wsl
cd robot_framework_alura_wsl
```

### 2. Criar o ambiente virtual

```bash
python3 -m venv ambiente-virtual
```

> Usamos `ambiente-virtual` como nome didático. Padrões comuns: `.venv`, `env`, `.env`.

### 3. Ativar o ambiente virtual

```bash
source ambiente-virtual/bin/activate
```

Você verá algo assim no terminal:

```bash
(ambiente-virtual) vitor@vfantin:~/robot_framework_alura_wsl$
```

---
### Instalar FakerLibrary - será usado para utilizar massa de dados

No verá algo assim no terminal:

```bash
(ambiente-virtual) vitor@vfantin:~/robot_framework_alura_wsl$
```
digite ```pip install robotframework-faker```

### 4. Criar o arquivo de dependências

Crie o arquivo `requirements.txt` com este conteúdo:

```
robotframework
selenium
robotframework-seleniumlibrary
robotframework-faker
```

### 5. Instalar as dependências Python no ambiente virtual

```bash
pip install -r requirements.txt
```

---

## 📁 Criando o primeiro teste

1. Criar a pasta de testes:

```bash
mkdir tests
```

2. Criar `tests/exemplo_teste.robot` com o conteúdo:

```robot
*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Acessar Página do Google
    Open Browser    https://www.google.com    chrome
    Sleep    3s
    Close Browser
```

> Se estiver sem interface gráfica no WSL, use modo `headless`:

```robot
Open Browser    https://www.google.com    chrome    options=add_argument(--headless)
```

---

## 🧪 Executando os testes

Com o ambiente virtual ativado:

```bash
robot tests/
```

Relatórios gerados:
- `log.html`
- `report.html`
- `output.xml`

---

## ✅ Resumo: O que vai aonde?

| Item                         | Local                     | Observações                              |
|------------------------------|---------------------------|-------------------------------------------|
| `robotframework`, `selenium` | ✅ Dentro do ambiente virtual | Instalado com `pip install`              |
| `google-chrome`              | ✅ Sistema (WSL Ubuntu)    | Instalado com `apt`                      |
| `chromedriver`               | ✅ Sistema (WSL Ubuntu)    | Copiado para `/usr/local/bin`           |
| Testes `.robot`              | ✅ Dentro do projeto       | Pasta `tests/`                           |

---

## 🧠 Dicas Finais

- Sempre ative o ambiente virtual antes de rodar os testes.
- Atualize o Chrome e o ChromeDriver juntos.
- Se não tiver GUI no WSL, use `--headless`.

---

Pronto! Você tem um ambiente de testes 100% funcional com Robot Framework no WSL Ubuntu.

# Abaixo readme do site organo faz parte das aulas da alura

# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
