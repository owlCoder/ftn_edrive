import { UserCharacter } from "../../../Domain/models/UserCharacter";
import { RowDataPacket, ResultSetHeader } from "mysql2";
import db from "../../connection/DbConnectionPool";
import { IUserCharacterRepository } from "../../../Domain/repositories/characters/IUserCharacterRepository";

export class UserCharacterRepository implements IUserCharacterRepository {
  async create(uc: UserCharacter): Promise<UserCharacter> {
    try {
      const query = `
        INSERT INTO user_characters (user_id, character_id, level, constellation, weapon_name, refinement)
        VALUES (?, ?, ?, ?, ?, ?)
      `;
      const [result] = await db.execute<ResultSetHeader>(query, [
        uc.userId, uc.characterId, uc.level, uc.constellation,
        uc.weaponName, uc.refinement
      ]);
      if (result.insertId) {
        uc.id = result.insertId;
        return uc;
      }
      return new UserCharacter();
    } catch (error) {
      console.error('Error adding character to collection:', error);
      return new UserCharacter();
    }
  }

  async getById(id: number): Promise<UserCharacter> {
    try {
      const query = `SELECT * FROM user_characters WHERE id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [id]);
      if (rows.length > 0) {
        const row = rows[0];
        return new UserCharacter(
          row.id, row.user_id, row.character_id, row.level,
          row.constellation, row.weapon_name, row.refinement,
          row.created_at, row.updated_at
        );
      }
      return new UserCharacter();
    } catch {
      return new UserCharacter();
    }
  }

  async getAllByUserId(userId: number): Promise<UserCharacter[]> {
    try {
      const query = `SELECT * FROM user_characters WHERE user_id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [userId]);
      return rows.map(row => new UserCharacter(
        row.id, row.user_id, row.character_id, row.level,
        row.constellation, row.weapon_name, row.refinement,
        row.created_at, row.updated_at
      ));
    } catch {
      return [];
    }
  }

  async getAllByCharacterId(characterId: number): Promise<UserCharacter[]> {
    try {
      const query = `SELECT * FROM user_characters WHERE character_id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [characterId]);
      return rows.map(row => new UserCharacter(
        row.id, row.user_id, row.character_id, row.level,
        row.constellation, row.weapon_name, row.refinement,
        row.created_at, row.updated_at
      ));
    } catch {
      return [];
    }
  }

  async update(uc: UserCharacter): Promise<UserCharacter> {
    try {
      const query = `
        UPDATE user_characters
        SET level = ?, constellation = ?, weapon_name = ?, refinement = ?
        WHERE id = ?
      `;
      const [result] = await db.execute<ResultSetHeader>(query, [
        uc.level, uc.constellation, uc.weaponName, uc.refinement, uc.id
      ]);
      if (result.affectedRows > 0) return uc;
      return new UserCharacter();
    } catch {
      return new UserCharacter();
    }
  }

  async delete(id: number): Promise<boolean> {
    try {
      const query = `DELETE FROM user_characters WHERE id = ?`;
      const [result] = await db.execute<ResultSetHeader>(query, [id]);
      return result.affectedRows > 0;
    } catch {
      return false;
    }
  }

  async exists(id: number): Promise<boolean> {
    try {
      const query = `SELECT COUNT(*) as count FROM user_characters WHERE id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [id]);
      return rows[0].count > 0;
    } catch {
      return false;
    }
  }

  async existsForUserAndCharacter(userId: number, characterId: number): Promise<boolean> {
    try {
      const query = `SELECT COUNT(*) as count FROM user_characters WHERE user_id = ? AND character_id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [userId, characterId]);
      return rows[0].count > 0;
    } catch {
      return false;
    }
  }
}