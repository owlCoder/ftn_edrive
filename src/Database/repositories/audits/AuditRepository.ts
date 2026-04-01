import { Audit } from "../../../Domain/models/Audit";
import { RowDataPacket, ResultSetHeader } from "mysql2";
import db from "../../connection/DbConnectionPool";
import { IAuditRepository } from "../../../Domain/repositories/audits/IAuditRepository";

export class AuditRepository implements IAuditRepository {
  async create(audit: Audit): Promise<Audit> {
    try {
      const query = `INSERT INTO audits (user_id, action, details, ip_address) VALUES (?, ?, ?, ?)`;
      const [result] = await db.execute<ResultSetHeader>(query, [
        audit.userId,
        audit.action,
        audit.details,
        audit.ipAddress
      ]);
      if (result.insertId) {
        audit.id = result.insertId;
        return audit;
      }
      return new Audit();
    } catch (error) {
      console.error('Error creating audit log:', error);
      return new Audit();
    }
  }

  async getById(id: number): Promise<Audit> {
    try {
      const query = `SELECT * FROM audits WHERE id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [id]);
      if (rows.length > 0) {
        const row = rows[0];
        return new Audit(row.id, row.user_id, row.action, row.details, row.ip_address, row.created_at);
      }
      return new Audit();
    } catch {
      return new Audit();
    }
  }

  async getAll(limit: number = 100, offset: number = 0): Promise<Audit[]> {
    try {
      const query = `SELECT * FROM audits ORDER BY created_at DESC LIMIT ? OFFSET ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [limit, offset]);
      return rows.map(row => new Audit(row.id, row.user_id, row.action, row.details, row.ip_address, row.created_at));
    } catch {
      return [];
    }
  }

  async getByUserId(userId: number): Promise<Audit[]> {
    try {
      const query = `SELECT * FROM audits WHERE user_id = ? ORDER BY created_at DESC`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [userId]);
      return rows.map(row => new Audit(row.id, row.user_id, row.action, row.details, row.ip_address, row.created_at));
    } catch {
      return [];
    }
  }
}