-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 30/06/2025 às 23:37
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_online`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinhos`
--

CREATE TABLE `carrinhos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carrinhos`
--

INSERT INTO `carrinhos` (`id`, `usuario_id`, `criado_em`) VALUES
(1, 7, '2025-06-02 22:59:35'),
(2, 9, '2025-06-06 22:31:35'),
(3, 10, '2025-06-07 00:26:37'),
(4, 11, '2025-06-08 15:06:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho_itens`
--

CREATE TABLE `carrinho_itens` (
  `id` int(11) NOT NULL,
  `carrinho_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT 1,
  `adicionado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carrinho_itens`
--

INSERT INTO `carrinho_itens` (`id`, `carrinho_id`, `produto_id`, `quantidade`, `adicionado_em`) VALUES
(12, 2, 2, 1, '2025-06-06 22:31:35'),
(16, 3, 1, 1, '2025-06-07 13:53:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(1, 'Eletrônicos'),
(2, 'Livros'),
(3, 'Roupas'),
(4, 'Brinquedos'),
(5, 'Esportes'),
(6, 'Beleza'),
(7, 'Casa e Jardim'),
(8, 'Automotivo'),
(9, 'Pet Shop');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `texto` text NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `comentarios`
--

INSERT INTO `comentarios` (`id`, `produto_id`, `usuario_id`, `texto`, `criado_em`) VALUES
(3, 1, 5, 'foda dms', '2025-06-09 22:53:15'),
(4, 1, 5, 'muito bom', '2025-06-10 02:08:19'),
(5, 1, 7, 'mouse e sempre bom', '2025-06-14 20:36:15'),
(6, 11, 11, 'nota 10', '2025-06-15 20:11:40'),
(7, 1, 11, 'sim', '2025-06-16 17:51:18'),
(8, 1, 11, 'joia', '2025-06-16 22:37:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `criado_por` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `criado_por`, `categoria_id`) VALUES
(1, 'Mouse Gamer RGB ', 'Mouse óptico com 6 botões programáveis e luz LED RGB.', 89.90, NULL, 1),
(2, 'Teclado Mecânico ABNT2', 'Teclado com switches azuis, ideal para digitação e jogos.', 199.90, NULL, 1),
(3, 'Monitor 24\" Full HD', 'Tela LED de 24 polegadas com resolução 1920x1080.', 699.90, NULL, 2),
(10, 'Camiseta Tech', 'Camiseta confortável com tecido tecnológico.', 79.90, 5, 1),
(11, 'Fone Bluetooth', 'Fone de ouvido sem fio com cancelamento de ruído.', 199.00, 5, 2),
(12, 'Garrafa Térmica', 'Mantém sua bebida quente por até 12h.', 89.50, 5, 3),
(16, 'gel', 'gel de cabelo', 12.00, 5, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('cliente','admin') DEFAULT 'cliente',
  `cpf` char(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo`, `cpf`, `data_nascimento`, `criado_em`) VALUES
(2, 'Cliente1', 'cliente1@loja.com', '$2y$10$f8Nfee.o6Y4a5MDJnaEzSeqkIe.pHxVpCmrrw2woCqhSWInJwHxh2', 'cliente', '11111111111', '1990-05-10', '2025-06-02 22:12:06'),
(3, 'Cliente2', 'cliente2@loja.com', '$2y$10$934TOfsnIHNky2nxJBu2IeeWC0NSy12OWMlSDK6OYRlC.GqvIAm3.', 'cliente', '22222222222', '1992-08-20', '2025-06-02 22:12:06'),
(4, 'Emerson', 'eminhocamargojr@gmail.com', '$2y$10$xobTAAAdlGu3lKO761WaM.F4ke9OqGoJc2wep8HTY2DVT.7vdZhtq', 'cliente', '00000000012', '2012-12-12', '2025-06-02 22:12:06'),
(5, 'carlos', 'carlos@gmail.com', '1234', 'admin', '00000000011', '2016-06-03', '2025-06-02 22:24:29'),
(6, 'Admin', 'admin@loja.com', '$2y$10$WFYjAooUTup4J15hYOxFeuZrtWdoWTiShaOxV2EgJlrGOEGd6CEN2', 'admin', '00000000000', '1980-01-01', '2025-06-02 22:26:52'),
(7, 'ajax', 'romalav864@eduhed.com', '4321', 'cliente', '00000000013', '1212-12-12', '2025-06-02 22:54:15'),
(8, 'emerson', 'romalaav864@eduhed.com', '9876', 'cliente', '00000000014', '2025-06-04', '2025-06-06 22:26:48'),
(9, 'robson', 'robsonrobson@gmail.com', '4321', 'cliente', '83928392', '1995-05-15', '2025-06-06 22:31:09'),
(10, 'Funk', 'funk@gmail.com', '123', 'cliente', '12312334520', '1988-06-07', '2025-06-07 00:26:19'),
(11, 'emerson', 'eminhojr@gmail.com', '1234', 'cliente', '00000000000', '2025-06-19', '2025-06-08 15:06:02');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinhos`
--
ALTER TABLE `carrinhos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `carrinho_itens`
--
ALTER TABLE `carrinho_itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrinho_id` (`carrinho_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criado_por` (`criado_por`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinhos`
--
ALTER TABLE `carrinhos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `carrinho_itens`
--
ALTER TABLE `carrinho_itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carrinhos`
--
ALTER TABLE `carrinhos`
  ADD CONSTRAINT `carrinhos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `carrinho_itens`
--
ALTER TABLE `carrinho_itens`
  ADD CONSTRAINT `carrinho_itens_ibfk_1` FOREIGN KEY (`carrinho_id`) REFERENCES `carrinhos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carrinho_itens_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`criado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
