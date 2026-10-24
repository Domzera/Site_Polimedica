# 🏥 Polimedica - Sistema de E-commerce Hospitalar & Gerenciamento

O **Polimedica** é uma aplicação web completa voltada para o setor de e-commerce e gerenciamento hospitalar/médico. Desenvolvido com uma arquitetura moderna e escalável utilizando **ASP.NET Core**, o sistema separa de forma clara as responsabilidades e oferece tanto uma interface amigável para o cliente final quanto painéis administrativos robustos para o gerenciamento de produtos, marcas e categorias.

---

## 🛠️ Tecnologias Utilizadas

O projeto foi construído utilizando as seguintes tecnologias e frameworks:

*   **Backend:** .NET 8.0 (C#) / ASP.NET Core
*   **Padrão de Arquitetura:** MVC (Model-View-Controller) + Repository Pattern
*   **Banco de Dados / ORM:** Entity Framework Core + Migrations
*   **Frontend:** HTML5, CSS3, JavaScript (Bootstrap 5 & jQuery para responsividade e validações)
*   **Serviços de Mídia:** Integração com Cloudinary para armazenamento e gerenciamento de imagens

---

## 📂 Estrutura do Projeto

A solução foi arquitetada seguindo boas práticas de desenvolvimento no ecossistema .NET, dividida logicamente nas seguintes pastas principais:

*   `Controllers/`: Controlam o fluxo da aplicação e gerenciam as requisições HTTP (Banners, Categorias, Produtos, Usuários, etc.).
*   `Data/`: Configurações de acesso ao banco de dados (`PolimedicaDbContext`), Enums e definições de permissões (`UserRoles`).
*   `Interface/`: Contratos e assinaturas de métodos para injeção de dependência dos repositórios e serviços.
*   `Models/`: Classes de domínio que representam as entidades do negócio e as tabelas do banco de dados (Produto, Categoria, Cupom, Pedido, etc.).
*   `Repository/`: Implementação concreta do acesso ao banco de dados encapsulando as queries do Entity Framework Core.
*   `ViewModel/`: Objetos de transferência de dados otimizados para validações e renderização segura nas Views.
*   `Views/`: Telas e componentes visuais renderizados através da engine Razor.

---

## ⚙️ Como Executar o Projeto Localmente

### Pré-requisitos
*   [.NET SDK 8.0](https://microsoft.com) instalado.
*   IDE recomendada: [Visual Studio 2022](https://microsoft.com) ou [Visual Studio Code](https://visualstudio.com).
*   Banco de dados configurado (SQL Server ou banco compatível configurado no `appsettings.json`).

### Passo a Passo

1. **Clonar o repositório:**
   ```bash
   git clone https://github.com
   cd Site_Polimedica
   ```

2. **Configurar as credenciais:**
   Abra o arquivo `appsettings.json` na raiz do projeto e ajuste a sua `DefaultConnection` (ConnectionString do Banco de Dados) e, se necessário, as credenciais da API do Cloudinary.

3. **Restaurar as dependências:**
   ```bash
   dotnet restore
   ```

4. **Atualizar o Banco de Dados (Migrations):**
   ```bash
   dotnet ef database update
   ```

5. **Executar a aplicação:**
   ```bash
   dotnet run
   ```
   Acesse no seu navegador através de: `https://localhost:5001` ou `http://localhost:5000` (verifique as portas geradas no terminal).

---

## 📸 Demonstração Visual do Sistema

Abaixo estão capturas de tela do sistema que demonstram o fluxo de navegação da Polimedica, desde a autenticação até as telas de gerenciamento administrativo.

### 🌐 Área Pública & Navegação Principal

#### 1. Home Page / Vitrine Principal
*A página principal apresenta uma interface limpa, banners rotativos e destaques para os principais produtos e promoções.*
![Página Principal](Imagens%20do%20site/PgPrincipal.jpg)

#### 2. Visualização Expandida
*Seção estendida da página inicial mostrando a distribuição em categorias e o catálogo responsivo.*
![Página Principal Expandida](Imagens%20do%20site/PgPrincipalGrande.jpg)

---

### 🔐 Autenticação & Restrições

#### 3. Tela de Login
*Sistema de login integrado para clientes e administradores com feedbacks visuais de validação.*
![Tela de Login](Imagens%20do%20site/FormLogin.jpg)

#### 4. Menu do Usuário Autenticado
*Painel de navegação que se adapta assim que o usuário realiza o login, exibindo opções de acordo com o seu perfil.*
![Menu Logado](Imagens%20do%20site/MenuLogado.jpg)

---

### 🎛️ Painel de Controle Administrativo

#### 5. Dashboard Geral
*Painel centralizador onde o administrador possui acesso rápido e resumido ao controle do e-commerce.*
![Dashboard](Imagens%20do%20site/Dashboard.jpg)

#### 6. Gerenciamento de Categorias
*Módulo de listagem e filtragem de categorias de produtos cadastradas no sistema.*
![Página de Categorias](Imagens%20do%20site/PgCategorias.jpg)

---

### 📝 Formulários de Cadastro (CRUD)

#### 7. Cadastro de Categorias
*Formulário simples e direto para adicionar novas categorias ao banco de dados.*
![Formulário de Cadastro de Categorias](Imagens%20do%20site/FormCadCategorias.jpg)

#### 8. Cadastro de Marcas
*Interface de inclusão para manter o catálogo de marcas parceiras atualizado.*
![Formulário de Cadastro de Marcas](Imagens%20do%20site/FormCadMarcas.jpg)

#### 9. Cadastro de Produtos
*Formulário completo englobando nome, preço, upload de imagem via Cloudinary, categoria e marca associada.*
![Formulário de Cadastro de Produtos](Imagens%20do%20site/FormCadProdutos.jpg)

---

### 🎨 Componentes Visuais & Notificações

#### 10. Banners Promocionais
*Área dedicada ao design e organização dos banners rotativos da Home.*
![Banners](Imagens%20do%20site/Banners.jpg)

#### 11. Feedbacks e Toasts
*Exemplo do padrão de alertas e pop-ups do sistema para interações bem-sucedidas ou erros (Toasts).*
![Toasts de Sistema](Imagens%20do%20site/Toasts.jpg)

---

## 👥 Autores

*   **Seu Nome** - *Desenvolvedor do Projeto* - [Seu GitHub](https://github.com)
