# 🏥 Polimédica do Vale - Website

![ASP.NET Core](https://shields.io)
![C#](https://shields.io)
![Bootstrap](https://shields.io)
![Entity Framework](https://shields.io)

Este é o website institucional e plataforma de serviços desenvolvido para a **Polimédica do Vale**. O sistema foi construído utilizando as melhores práticas do ecossistema **.NET**, com foco em alta performance, desacoplamento de código e uma interface moderna e responsiva para os pacientes e administradores.

---

## 🚀 Funcionalidades Principais

*   **Página Inicial Dinâmica:** Banners institucionais e carrossel de ofertas gerenciados dinamicamente via banco de dados.
*   **Gestão de Categorias e Produtos:** Catálogo de serviços ou produtos médicos segmentados.
*   **Painel Administrativo:** Controle de conteúdos estruturado através do padrão MVC.
*   **Arquitetura Desacoplada:** Consultas otimizadas e isoladas que evitam o travamento de Views de Layout.

---

## 🛠️ Tecnologias e Ferramentas Utilizadas

*   **Backend:** C# com ASP.NET Core MVC (Net 8.0)
*   **Persistência de Dados:** Entity Framework Core (EF Core)
*   **Banco de Dados:** SQL Server / Azure SQL
*   **Frontend:** Razor Views (HTML5, CSS3 Customizado, JavaScript)
*   **Framework UI:** Bootstrap 5 (para total responsividade)
*   **Arquitetura:** Padrão Repository e Inversão de Controle (Dependency Injection)

---

## 🏗️ Destaques de Arquitetura e Performance

Durante o desenvolvimento do projeto, refinamos a estrutura para seguir padrões de projetos corporativos, garantindo que a aplicação seja escalável e rápida:

### 🔄 Implementação de View Components
Para resolver problemas comuns de travamento e concorrência ao carregar dados globais no `_Layout.cshtml` (como o banner rotativo), o carregamento de dados foi extraído da `ViewBag` e migrado para um **View Component** assíncrono.
*   **Resultado:** Dados isolados do fluxo principal dos controllers, tipagem forte (`Banner`) e renderização sem gargalos.

### 📐 Inversão de Dependência (IoC)
A camada de persistência utiliza o padrão **Repository** intermediado por interfaces (`IBannerRepository`, `ICategoriaRepository`). Isso desacopla as ações do banco de dados do fluxo de controle do MVC, facilitando a escrita de testes unitários no futuro.

### 🔀 Redirecionamento e Persistência de Estado
Fluxos de navegação complexos que envolvem transferência de dados entre Actions (como o envio de listas de Categorias para a página de Produtos) utilizam mecanismos seguros de sessão temporária (`TempData`) serializados em JSON, mantendo as URLs limpas e amigáveis para SEO.

---

## 📂 Estrutura do Projeto (Principais Pastas)

```text
Polimedica/
│
├── Controllers/          # Fluxo de controle das requisições (Index, Produto, etc.)
├── Models/               # Classes de domínio e entidades do banco de dados (Banner, Categoria)
├── Interfaces/           # Contratos dos repositórios (IBannerRepository, etc.)
├── Repositories/         # Implementação do acesso a dados com EF Core
├── ViewComponents/       # Componentes visuais isolados e assíncronos (BannerViewComponent)
├── Views/                
│   ├── Shared/           # Layouts globais e componentes compartilhados
│   │   └── Components/   # Subpastas específicas para as Views de componentes
│   └── ...               # Views separadas por contexto de Controller
└── wwwroot/              # Arquivos estáticos (CSS customizado, JavaScript, Imagens)
```

---

## 🔧 Como Executar o Projeto Localmente

### Pré-requisitos
*   [.NET 8.0 SDK](https://microsoft.com) instalado.
*   [Visual Studio 2022](https://microsoft.com) ou [VS Code](https://visualstudio.com).
*   Instância do SQL Server (LocalDB ou Docker).

### Passo a Passo

1.  **Clonar o repositório:**
    ```bash
    git clone https://github.com
    cd polimedica-vale
    ```

2.  **Configurar a Connection String:**
    Abra o arquivo `appsettings.json` e insira as credenciais do seu banco de dados local na chave `DefaultConnection`.

3.  **Executar as Migrations (Criar o Banco de Dados):**
    No Console do Gerenciador de Pacotes do Visual Studio, execute:
    ```bash
    Update-Database
    ```
    *Ou via CLI do .NET:*
    ```bash
    dotnet ef database update
    ```

4.  **Rodar a aplicação:**
    ```bash
    dotnet run
    ```
    Acesse no seu navegador através do endereço indicado no console (ex: `https://localhost:5001`).

---

## ✒️ Desenvolvedor

*   **Seu Nome** - *Desenvolvedor Full Stack* - [Seu GitHub](https://github.com)
