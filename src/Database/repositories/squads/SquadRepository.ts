import { Squad } from "../../../Domain/models/Squad";
import { RowDataPacket, ResultSetHeader } from "mysql2";
import db from "../../connection/DbConnectionPool";
import { ISquadRepository } from "../../../Domain/repositories/squads/ISquadRepository";

export class SquadRepository implements ISquadRepository {
  async create(squad: Squad): Promise<Squad> {
    try {
      const query = `INSERT INTO squads (user_id, name) VALUES (?, ?)`;
      const [result] = await db.execute<ResultSetHeader>(query, [squad.userId, squad.name]);
      if (result.insertId) {
        squad.id = result.insertId;
        return squad;
      }
      return new Squad();
    } catch (error) {
      console.error('Error creating squad:', error);
      return new Squad();
    }
  }

  async getById(id: number): Promise<Squad> {
    try {
      const query = `SELECT * FROM squads WHERE id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [id]);
      if (rows.length > 0) {
        const row = rows[0];
        return new Squad(row.id, row.user_id, row.name, row.created_at, row.updated_at);
      }
      return new Squad();
    } catch {
      return new Squad();
    }
  }

  async getAllByUserId(userId: number): Promise<Squad[]> {
    try {
      const query = `SELECT * FROM squads WHERE user_id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [userId]);
      return rows.map(row => new Squad(row.id, row.user_id, row.name, row.created_at, row.updated_at));
    } catch {
      return [];
    }
  }

  async update(squad: Squad): Promise<Squad> {
    try {
      const query = `UPDATE squads SET name = ? WHERE id = ?`;
      const [result] = await db.execute<ResultSetHeader>(query, [squad.name, squad.id]);
      if (result.affectedRows > 0) return squad;
      return new Squad();
    } catch {
      return new Squad();
    }
  }

  async delete(id: number): Promise<boolean> {
    try {
      const query = `DELETE FROM squads WHERE id = ?`;
      const [result] = await db.execute<ResultSetHeader>(query, [id]);
      return result.affectedRows > 0;
    } catch {
      return false;
    }
  }

  async exists(id: number): Promise<boolean> {
    try {
      const query = `SELECT COUNT(*) as count FROM squads WHERE id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [id]);
      return rows[0].count > 0;
    } catch {
      return false;
    }
  }
}