import { Character } from "../../../Domain/models/Character";
import { RowDataPacket, ResultSetHeader } from "mysql2";
import db from "../../connection/DbConnectionPool";
import { ICharacterRepository } from "../../../Domain/repositories/characters/ICharacterRepository";

export class CharacterRepository implements ICharacterRepository {
  async create(character: Character): Promise<Character> {
    try {
      const query = `
        INSERT INTO characters (name, element, weapon_type, rarity, region, description, image)
        VALUES (?, ?, ?, ?, ?, ?, ?)
      `;
      const [result] = await db.execute<ResultSetHeader>(query, [
        character.name, character.element, character.weaponType,
        character.rarity, character.region, character.description,
        character.image
      ]);
      if (result.insertId) {
        character.id = result.insertId;
        return character;
      }
      return new Character();
    } catch (error) {
      console.error('Error creating character:', error);
      return new Character();
    }
  }

  async getById(id: number): Promise<Character> {
    try {
      const query = `SELECT * FROM characters WHERE id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [id]);
      if (rows.length > 0) {
        const row = rows[0];
        return new Character(
          row.id, row.name, row.element, row.weapon_type,
          row.rarity, row.region, row.description, row.image,
          row.created_at, row.updated_at
        );
      }
      return new Character();
    } catch {
      return new Character();
    }
  }

  async getAll(): Promise<Character[]> {
    try {
      const query = `SELECT * FROM characters ORDER BY id ASC`;
      const [rows] = await db.execute<RowDataPacket[]>(query);
      return rows.map(row => new Character(
        row.id, row.name, row.element, row.weapon_type,
        row.rarity, row.region, row.description, row.image,
        row.created_at, row.updated_at
      ));
    } catch {
      return [];
    }
  }

  async update(character: Character): Promise<Character> {
    try {
      const query = `
        UPDATE characters
        SET name = ?, element = ?, weapon_type = ?, rarity = ?,
            region = ?, description = ?, image = ?
        WHERE id = ?
      `;
      const [result] = await db.execute<ResultSetHeader>(query, [
        character.name, character.element, character.weaponType,
        character.rarity, character.region, character.description,
        character.image, character.id
      ]);
      if (result.affectedRows > 0) return character;
      return new Character();
    } catch {
      return new Character();
    }
  }

  async delete(id: number): Promise<boolean> {
    try {
      const query = `DELETE FROM characters WHERE id = ?`;
      const [result] = await db.execute<ResultSetHeader>(query, [id]);
      return result.affectedRows > 0;
    } catch {
      return false;
    }
  }

  async exists(id: number): Promise<boolean> {
    try {
      const query = `SELECT COUNT(*) as count FROM characters WHERE id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [id]);
      return rows[0].count > 0;
    } catch {
      return false;
    }
  }

  async getByElement(element: string): Promise<Character[]> {
    try {
      const query = `SELECT * FROM characters WHERE element = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [element]);
      return rows.map(row => new Character(
        row.id, row.name, row.element, row.weapon_type,
        row.rarity, row.region, row.description, row.image,
        row.created_at, row.updated_at
      ));
    } catch {
      return [];
    }
  }

  async getByWeaponType(weaponType: string): Promise<Character[]> {
    try {
      const query = `SELECT * FROM characters WHERE weapon_type = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [weaponType]);
      return rows.map(row => new Character(
        row.id, row.name, row.element, row.weapon_type,
        row.rarity, row.region, row.description, row.image,
        row.created_at, row.updated_at
      ));
    } catch {
      return [];
    }
  }

  async getByRarity(rarity: number): Promise<Character[]> {
    try {
      const query = `SELECT * FROM characters WHERE rarity = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [rarity]);
      return rows.map(row => new Character(
        row.id, row.name, row.element, row.weapon_type,
        row.rarity, row.region, row.description, row.image,
        row.created_at, row.updated_at
      ));
    } catch {
      return [];
    }
  }
}