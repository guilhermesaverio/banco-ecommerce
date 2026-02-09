-- Schema do banco de dados E-commerce
-- Contém tabelas: Clientes, Endereco, Telefone, Email, Pedido, ItemPedido, Categoria_Produto, Produto

CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) CONSTRAINT PK_Clientes PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    CONSTRAINT UQ_Clientes_CPF UNIQUE (cpf),
    CONSTRAINT CK_Clientes_CPF CHECK (cpf NOT LIKE '%[^0-9]%')
);

CREATE TABLE Endereco (
    id_endereco INT IDENTITY(1,1) CONSTRAINT PK_Endereco PRIMARY KEY,
    logradouro VARCHAR(500) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(80) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT FK_Endereco_Clientes
        FOREIGN KEY (id_cliente)
        REFERENCES Clientes (id_cliente)
);

CREATE TABLE Telefone (
    id_telefone INT IDENTITY(1,1) CONSTRAINT Pk_Telefone PRIMARY KEY,
    ddd INT NOT NULL,
    numero INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT Fk_Telefone_Clientes
        FOREIGN KEY (id_cliente)
        REFERENCES Clientes (id_cliente)
);

CREATE TABLE Email (
    id_email INT IDENTITY(1,1) CONSTRAINT Pk_email PRIMARY KEY,
    email VARCHAR(45) NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT Fk_Email_Clientes
        FOREIGN KEY (id_cliente)
        REFERENCES Clientes (id_cliente)
);

CREATE TABLE Pedido (
    id_pedido INT IDENTITY(1,1) CONSTRAINT PK_Pedido PRIMARY KEY,
    nota_fiscal VARCHAR(45) NOT NULL,
    serie_nota VARCHAR(45) NOT NULL,
        CONSTRAINT UQ_Pedido_Nota UNIQUE (nota_fiscal, serie_nota),
    valor_total DECIMAL(10,2) NOT NULL,
    quantidade_itens INT NOT NULL,
    desconto_total DECIMAL(10,2),
    status VARCHAR(20) NOT NULL,
        CONSTRAINT CK_Pedido_Status
        CHECK (status IN ('ABERTO', 'PAGO', 'CANCELADO')),
    id_cliente INT NOT NULL,
    CONSTRAINT FK_Pedido_Clientes
        FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente)
);

CREATE TABLE Categoria_Produto (
    id_categoria INT IDENTITY(1,1) CONSTRAINT PK_Categoria_Produto PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    CONSTRAINT UQ_Categoria_Nome UNIQUE (nome)
);


CREATE TABLE Produto(
    id_produto INT IDENTITY(1,1) CONSTRAINT Pk_produto PRIMARY KEY,
    descricao VARCHAR(45) NOT NULL,
    preco_unitario decimal(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    id_categoria INT NOT NULL,
    CONSTRAINT Fk_Produto_Categoria_Produto
        FOREIGN KEY (id_categoria)
        REFERENCES Categoria_Produto(id_categoria)
);

CREATE TABLE ItemPedido (
    id_item_pedido INT IDENTITY(1,1) CONSTRAINT Pk_item_pedido PRIMARY KEY,
    valor_unitario DECIMAL(10,2) NOT NULL,
    quantidade_item INT NOT NULL,
    valor_desconto DECIMAL(10,2),
    id_pedido INT NOT NULL,
    CONSTRAINT Fk_ItemPedido_Pedido
        FOREIGN KEY (id_pedido)
        REFERENCES Pedido (id_pedido),
    id_produto INT NOT NULL,
    CONSTRAINT Fk_ItemPedido_Produto
        FOREIGN KEY (id_produto)
        REFERENCES Produto(id_produto)
);







