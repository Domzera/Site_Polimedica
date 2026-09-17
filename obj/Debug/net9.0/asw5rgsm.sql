IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
CREATE TABLE [AspNetRoles] (
    [Id] nvarchar(450) NOT NULL,
    [Name] nvarchar(256) NULL,
    [NormalizedName] nvarchar(256) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
);

CREATE TABLE [AvaliacaoDb] (
    [Id] uniqueidentifier NOT NULL,
    [ProdutoId] int NULL,
    [UsuarioId] nvarchar(max) NULL,
    [Nota] nvarchar(1) NOT NULL,
    [Comentario] nvarchar(max) NULL,
    [DataAvaliacao] date NOT NULL,
    CONSTRAINT [PK_AvaliacaoDb] PRIMARY KEY ([Id])
);

CREATE TABLE [BannerDb] (
    [Id] int NOT NULL IDENTITY,
    [Banner1] nvarchar(max) NULL,
    [Banner2] nvarchar(max) NULL,
    [Banner3] nvarchar(max) NULL,
    CONSTRAINT [PK_BannerDb] PRIMARY KEY ([Id])
);

CREATE TABLE [CarrinhoDeComprasDb] (
    [Id] int NOT NULL IDENTITY,
    [UsuarioId] nvarchar(max) NULL,
    [ProdutoId] int NOT NULL,
    [Quantidade] int NOT NULL,
    [DataDaInclusao] date NOT NULL,
    CONSTRAINT [PK_CarrinhoDeComprasDb] PRIMARY KEY ([Id])
);

CREATE TABLE [CategoriaDb] (
    [Id] int NOT NULL IDENTITY,
    [NomeCategoria] nvarchar(max) NULL,
    [DescricaoCategoria] nvarchar(max) NULL,
    CONSTRAINT [PK_CategoriaDb] PRIMARY KEY ([Id])
);

CREATE TABLE [CategoriaProdutoDb] (
    [CategoriaId] int NOT NULL,
    [ProdutoId] int NOT NULL
);

CREATE TABLE [CuponDescontoDb] (
    [Id] nvarchar(450) NOT NULL,
    [Codigo] nvarchar(max) NULL,
    [Descricao] nvarchar(max) NULL,
    [DescontoPercentual] bigint NOT NULL,
    [DataDaExpiracao] date NOT NULL,
    [Quantidade] int NOT NULL,
    CONSTRAINT [PK_CuponDescontoDb] PRIMARY KEY ([Id])
);

CREATE TABLE [EnderecoDb] (
    [Id] int NOT NULL IDENTITY,
    [NomeLogradouro] nvarchar(max) NULL,
    [Numero] int NOT NULL,
    [Bairro] nvarchar(max) NULL,
    [Cidade] nvarchar(max) NULL,
    [EstadoSigla] int NOT NULL,
    [CEP] bigint NOT NULL,
    [Pais] nvarchar(max) NULL,
    CONSTRAINT [PK_EnderecoDb] PRIMARY KEY ([Id])
);

CREATE TABLE [MarcaDb] (
    [Id] int NOT NULL IDENTITY,
    [NomeMarca] nvarchar(max) NOT NULL,
    [DescricaoMarca] nvarchar(max) NULL,
    [LogoImagem] nvarchar(max) NULL,
    CONSTRAINT [PK_MarcaDb] PRIMARY KEY ([Id])
);

CREATE TABLE [MarcaProdutoDb] (
    [MarcaId] int NOT NULL,
    [ProdutoId] int NOT NULL
);

CREATE TABLE [ProdutoDb] (
    [Id] int NOT NULL IDENTITY,
    [NomeProduto] nvarchar(max) NOT NULL,
    [DescricaoProduto] nvarchar(max) NOT NULL,
    [Preco] decimal(18,2) NOT NULL,
    [QuantidadeEmEstoque] int NOT NULL,
    [Imagem1] nvarchar(max) NULL,
    [Imagem2] nvarchar(max) NULL,
    [Imagem3] nvarchar(max) NULL,
    [Imagem4] nvarchar(max) NULL,
    [Imagem5] nvarchar(max) NULL,
    [DataAdicionado] date NOT NULL,
    [Ativo] bit NOT NULL,
    CONSTRAINT [PK_ProdutoDb] PRIMARY KEY ([Id])
);

CREATE TABLE [PromocaoDb] (
    [Id] int NOT NULL IDENTITY,
    [ProdutoID] int NOT NULL,
    [Preco] decimal(18,2) NOT NULL,
    [Datainicio] date NOT NULL,
    [DataFinal] date NOT NULL,
    CONSTRAINT [PK_PromocaoDb] PRIMARY KEY ([Id])
);

CREATE TABLE [TerEmCasaDb] (
    [id] int NOT NULL IDENTITY,
    [ProdutoId] int NOT NULL,
    CONSTRAINT [PK_TerEmCasaDb] PRIMARY KEY ([id])
);

CREATE TABLE [AspNetRoleClaims] (
    [Id] int NOT NULL IDENTITY,
    [RoleId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUsers] (
    [Id] nvarchar(450) NOT NULL,
    [PrimeiroNome] nvarchar(max) NULL,
    [SobreNome] nvarchar(max) NULL,
    [EnderecoId] int NULL,
    [DataDeCadastro] date NOT NULL,
    [UserName] nvarchar(256) NULL,
    [NormalizedUserName] nvarchar(256) NULL,
    [Email] nvarchar(256) NULL,
    [NormalizedEmail] nvarchar(256) NULL,
    [EmailConfirmed] bit NOT NULL,
    [PasswordHash] nvarchar(max) NULL,
    [SecurityStamp] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [PhoneNumber] nvarchar(max) NULL,
    [PhoneNumberConfirmed] bit NOT NULL,
    [TwoFactorEnabled] bit NOT NULL,
    [LockoutEnd] datetimeoffset NULL,
    [LockoutEnabled] bit NOT NULL,
    [AccessFailedCount] int NOT NULL,
    CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetUsers_EnderecoDb_EnderecoId] FOREIGN KEY ([EnderecoId]) REFERENCES [EnderecoDb] ([Id])
);

CREATE TABLE [AspNetUserClaims] (
    [Id] int NOT NULL IDENTITY,
    [UserId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserLogins] (
    [LoginProvider] nvarchar(450) NOT NULL,
    [ProviderKey] nvarchar(450) NOT NULL,
    [ProviderDisplayName] nvarchar(max) NULL,
    [UserId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
    CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserRoles] (
    [UserId] nvarchar(450) NOT NULL,
    [RoleId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AspNetUserTokens] (
    [UserId] nvarchar(450) NOT NULL,
    [LoginProvider] nvarchar(450) NOT NULL,
    [Name] nvarchar(450) NOT NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [PedidoDb] (
    [Id] int NOT NULL IDENTITY,
    [UsuarioId] nvarchar(450) NULL,
    [DataDoPedido] date NULL,
    [StatusDoPedido] nvarchar(max) NULL,
    [ValorTotal] bigint NOT NULL,
    [FormaDePagamento] nvarchar(max) NULL,
    [EnderecoId] int NOT NULL,
    CONSTRAINT [PK_PedidoDb] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PedidoDb_AspNetUsers_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [AspNetUsers] ([Id]),
    CONSTRAINT [FK_PedidoDb_EnderecoDb_EnderecoId] FOREIGN KEY ([EnderecoId]) REFERENCES [EnderecoDb] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [ItensDoPedidoDb] (
    [Id] int NOT NULL IDENTITY,
    [PedidoId] int NOT NULL,
    [ProdutoId] int NOT NULL,
    [Quantidade] int NOT NULL,
    [PrecoUnitario] bigint NOT NULL,
    CONSTRAINT [PK_ItensDoPedidoDb] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ItensDoPedidoDb_PedidoDb_PedidoId] FOREIGN KEY ([PedidoId]) REFERENCES [PedidoDb] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_ItensDoPedidoDb_ProdutoDb_ProdutoId] FOREIGN KEY ([ProdutoId]) REFERENCES [ProdutoDb] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [PagamentosDb] (
    [Id] int NOT NULL IDENTITY,
    [PedidoId] int NOT NULL,
    [DataDoPagamento] date NOT NULL,
    [Valor] bigint NOT NULL,
    [MetodoDePagamento] nvarchar(max) NULL,
    [StatusDoPagamento] nvarchar(max) NULL,
    CONSTRAINT [PK_PagamentosDb] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PagamentosDb_PedidoDb_PedidoId] FOREIGN KEY ([PedidoId]) REFERENCES [PedidoDb] ([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);

CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;

CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);

CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);

CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);

CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);

CREATE INDEX [IX_AspNetUsers_EnderecoId] ON [AspNetUsers] ([EnderecoId]);

CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;

CREATE INDEX [IX_ItensDoPedidoDb_PedidoId] ON [ItensDoPedidoDb] ([PedidoId]);

CREATE INDEX [IX_ItensDoPedidoDb_ProdutoId] ON [ItensDoPedidoDb] ([ProdutoId]);

CREATE INDEX [IX_PagamentosDb_PedidoId] ON [PagamentosDb] ([PedidoId]);

CREATE INDEX [IX_PedidoDb_EnderecoId] ON [PedidoDb] ([EnderecoId]);

CREATE INDEX [IX_PedidoDb_UsuarioId] ON [PedidoDb] ([UsuarioId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250805115854_initialMigration', N'9.0.0');

COMMIT;
GO

