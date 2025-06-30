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
-- Banco de dados: `chamados_tecnicos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(8, 'emerson'),
(3, 'Hardware'),
(1, 'Rede'),
(2, 'Software');

-- --------------------------------------------------------

--
-- Estrutura para tabela `chamados`
--

CREATE TABLE `chamados` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text NOT NULL,
  `prioridade` enum('baixa','media','alta') NOT NULL,
  `statuss` enum('aberto','em_andamento','resolvido') DEFAULT 'aberto',
  `arquivo` varchar(255) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `data_fechamento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chamados`
--

INSERT INTO `chamados` (`id`, `titulo`, `descricao`, `prioridade`, `statuss`, `arquivo`, `id_cliente`, `id_tecnico`, `id_categoria`, `data_fechamento`) VALUES
(2, 'Erro ao iniciar sistema', 'O sistema trava na tela de login.', 'media', 'resolvido', NULL, 2, 9, 2, '2025-06-26 22:21:00'),
(3, 'Impressora sem resposta', 'A impressora parou de funcionar após troca de toner.', 'media', NULL, NULL, 1, 4, 3, NULL),
(4, 'chico bento teste', 'a', 'alta', 'resolvido', NULL, 10, 9, 1, '2025-06-26 22:20:55'),
(5, 'sos', 'sos', 'alta', 'resolvido', NULL, 10, 9, 1, '2025-06-26 22:25:25'),
(6, 'socorro', 'a', 'alta', 'em_andamento', NULL, 10, 13, 8, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('cliente','tecnico','admin') NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo`, `criado_em`) VALUES
(1, 'Alice Cliente', 'alice@cliente.com', '$2y$10$ExemploHashSenha1', 'cliente', '2025-06-25 00:50:18'),
(2, 'Bruno Cliente', 'bruno@cliente.com', '$2y$10$ExemploHashSenha2', 'cliente', '2025-06-25 00:50:18'),
(3, 'Carla Tecnica', 'carla@tecnico.com', '$2y$10$ExemploHashSenha3', 'tecnico', '2025-06-25 00:50:18'),
(4, 'Daniel Tecnico', 'daniel@tecnico.com', '$2y$10$ExemploHashSenha4', 'tecnico', '2025-06-25 00:50:18'),
(9, 'admin', 'eminhocamargojr@gmail.com', '$2y$10$5.QOfRyaGmvuWOv.TQzj0u.1Xsk53eguZQnKa9TDYwnkaIdmZOksu', 'tecnico', '2025-06-25 01:09:54'),
(10, 'jonas', 'carlos@gmail.com', '$2y$10$J8xYAIQ18EJ38LrU8WbDBecaL2WxBhPi.PyvC23B85VWikNMeszKS', 'cliente', '2025-06-26 00:55:22'),
(11, 'Administrador', 'admin@exemplo.com', '<senha_hash>', 'admin', '2025-06-28 15:05:15'),
(12, 'admin', 'admin@', '$2y$10$GKsgoqddxkwLxBAwQ9vB0O2y5AV/0PD6c4fKHRvDYKe7cGeHh.OEK', 'admin', '2025-06-28 15:06:38'),
(13, 'jonasadm', 'a', '$2y$10$04sLqIBOyTCllrTKqdlHq.MTn3Ybz7Zu/VVs43w/T1T.NjiMKjgmy', 'tecnico', '2025-06-28 15:37:21');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `chamados`
--
ALTER TABLE `chamados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_categoria` (`id_categoria`);

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
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `chamados`
--
ALTER TABLE `chamados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `chamados`
--
ALTER TABLE `chamados`
  ADD CONSTRAINT `chamados_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chamados_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `chamados_ibfk_3` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
