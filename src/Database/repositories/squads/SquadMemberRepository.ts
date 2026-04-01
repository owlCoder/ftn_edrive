import { SquadMember } from "../../../Domain/models/SquadMember";
import { RowDataPacket, ResultSetHeader } from "mysql2";
import db from "../../connection/DbConnectionPool";
import { ISquadMemberRepository } from "../../../Domain/repositories/squads/ISquadMemberRepository";

export class SquadMemberRepository implements ISquadMemberRepository {
  async create(member: SquadMember): Promise<SquadMember> {
    try {
      const query = `INSERT INTO squad_members (squad_id, user_character_id) VALUES (?, ?)`;
      const [result] = await db.execute<ResultSetHeader>(query, [member.squadId, member.userCharacterId]);
      if (result.insertId) {
        member.id = result.insertId;
        return member;
      }
      return new SquadMember();
    } catch (error) {
      console.error('Error adding member to squad:', error);
      return new SquadMember();
    }
  }

  async getById(id: number): Promise<SquadMember> {
    try {
      const query = `SELECT * FROM squad_members WHERE id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [id]);
      if (rows.length > 0) {
        const row = rows[0];
        return new SquadMember(row.id, row.squad_id, row.user_character_id, row.created_at);
      }
      return new SquadMember();
    } catch {
      return new SquadMember();
    }
  }

  async getAllBySquadId(squadId: number): Promise<SquadMember[]> {
    try {
      const query = `SELECT * FROM squad_members WHERE squad_id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [squadId]);
      return rows.map(row => new SquadMember(row.id, row.squad_id, row.user_character_id, row.created_at));
    } catch {
      return [];
    }
  }

  async delete(id: number): Promise<boolean> {
    try {
      const query = `DELETE FROM squad_members WHERE id = ?`;
      const [result] = await db.execute<ResultSetHeader>(query, [id]);
      return result.affectedRows > 0;
    } catch {
      return false;
    }
  }

  async deleteBySquadId(squadId: number): Promise<boolean> {
    try {
      const query = `DELETE FROM squad_members WHERE squad_id = ?`;
      const [result] = await db.execute<ResultSetHeader>(query, [squadId]);
      return result.affectedRows > 0;
    } catch {
      return false;
    }
  }

  async existsInSquad(squadId: number, userCharacterId: number): Promise<boolean> {
    try {
      const query = `SELECT COUNT(*) as count FROM squad_members WHERE squad_id = ? AND user_character_id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [squadId, userCharacterId]);
      return rows[0].count > 0;
    } catch {
      return false;
    }
  }

  async countMembers(squadId: number): Promise<number> {
    try {
      const query = `SELECT COUNT(*) as count FROM squad_members WHERE squad_id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [squadId]);
      return rows[0].count;
    } catch {
      return 0;
    }
  }
}