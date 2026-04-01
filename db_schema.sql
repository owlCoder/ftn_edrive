-- Kreiranje baze podataka
CREATE DATABASE IF NOT EXISTS celestia_codex;
USE celestia_codex;

-- ------------------------------------------------------------
-- Tabela: users
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('player', 'admin') NOT NULL DEFAULT 'player',
    profile_picture TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_username (username),
    INDEX idx_email (email)
);

-- ------------------------------------------------------------
-- Tabela: characters (globalni katalog heroja)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS characters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) UNIQUE NOT NULL,
    element ENUM('Pyro', 'Hydro', 'Cryo', 'Electro', 'Anemo', 'Geo', 'Dendro') NOT NULL,
    weapon_type ENUM('Sword', 'Claymore', 'Polearm', 'Bow', 'Catalyst') NOT NULL,
    rarity TINYINT NOT NULL CHECK (rarity IN (4,5)),
    region VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    image TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_element (element),
    INDEX idx_weapon (weapon_type),
    INDEX idx_rarity (rarity)
);

-- ------------------------------------------------------------
-- Tabela: user_characters (lična kolekcija korisnika)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS user_characters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    character_id INT NOT NULL,
    level INT NOT NULL CHECK (level BETWEEN 1 AND 90),
    constellation INT NOT NULL CHECK (constellation BETWEEN 0 AND 6),
    weapon_name VARCHAR(80) NOT NULL,
    refinement INT NOT NULL CHECK (refinement BETWEEN 1 AND 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_user_character (user_id, character_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE RESTRICT,
    INDEX idx_user (user_id)
);

-- ------------------------------------------------------------
-- Tabela: squads (odredi)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS squads (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    name VARCHAR(80) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user (user_id)
);

-- ------------------------------------------------------------
-- Tabela: squad_members (članovi odreda)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS squad_members (
    id INT PRIMARY KEY AUTO_INCREMENT,
    squad_id INT NOT NULL,
    user_character_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_squad_character (squad_id, user_character_id),
    FOREIGN KEY (squad_id) REFERENCES squads(id) ON DELETE CASCADE,
    FOREIGN KEY (user_character_id) REFERENCES user_characters(id) ON DELETE CASCADE,
    INDEX idx_squad (squad_id)
);

-- ------------------------------------------------------------
-- Tabela: audits (evidencija aktivnosti)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS audits (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NULL,
    action VARCHAR(255) NOT NULL,
    details TEXT,
    ip_address VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_user (user_id),
    INDEX idx_created (created_at)
);