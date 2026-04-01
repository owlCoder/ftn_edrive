import { User } from "../../../Domain/models/User";
import { RowDataPacket, ResultSetHeader } from "mysql2";
import db from "../../connection/DbConnectionPool";
import { IUserRepository } from "../../../Domain/repositories/users/IUserRepository";

export class UserRepository implements IUserRepository {
  async create(user: User): Promise<User> {
    try {
      const query = `
        INSERT INTO users (username, full_name, email, password_hash, role, profile_picture)
        VALUES (?, ?, ?, ?, ?, ?)
      `;
      const [result] = await db.execute<ResultSetHeader>(query, [
        user.username,
        user.fullName,
        user.email,
        user.passwordHash,
        user.role,
        user.profilePicture,
      ]);
      if (result.insertId) {
        user.id = result.insertId;
        return user;
      }
      return new User();
    } catch (error) {
      console.error('Error creating user:', error);
      return new User();
    }
  }

  async getById(id: number): Promise<User> {
    try {
      const query = `SELECT * FROM users WHERE id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [id]);
      if (rows.length > 0) {
        const row = rows[0];
        return new User(
          row.id, row.username, row.full_name, row.email,
          row.password_hash, row.role, row.profile_picture,
          row.created_at, row.updated_at
        );
      }
      return new User();
    } catch {
      return new User();
    }
  }

  async getByUsername(username: string): Promise<User> {
    try {
      const query = `SELECT * FROM users WHERE username = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [username]);
      if (rows.length > 0) {
        const row = rows[0];
        return new User(
          row.id, row.username, row.full_name, row.email,
          row.password_hash, row.role, row.profile_picture,
          row.created_at, row.updated_at
        );
      }
      return new User();
    } catch {
      return new User();
    }
  }

  async getByEmail(email: string): Promise<User> {
    try {
      const query = `SELECT * FROM users WHERE email = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [email]);
      if (rows.length > 0) {
        const row = rows[0];
        return new User(
          row.id, row.username, row.full_name, row.email,
          row.password_hash, row.role, row.profile_picture,
          row.created_at, row.updated_at
        );
      }
      return new User();
    } catch {
      return new User();
    }
  }

  async getAll(): Promise<User[]> {
    try {
      const query = `SELECT * FROM users ORDER BY id ASC`;
      const [rows] = await db.execute<RowDataPacket[]>(query);
      return rows.map(row => new User(
        row.id, row.username, row.full_name, row.email,
        row.password_hash, row.role, row.profile_picture,
        row.created_at, row.updated_at
      ));
    } catch {
      return [];
    }
  }

  async update(user: User): Promise<User> {
    try {
      const query = `
        UPDATE users
        SET username = ?, full_name = ?, email = ?, password_hash = ?, role = ?, profile_picture = ?
        WHERE id = ?
      `;
      const [result] = await db.execute<ResultSetHeader>(query, [
        user.username, user.fullName, user.email,
        user.passwordHash, user.role, user.profilePicture,
        user.id
      ]);
      if (result.affectedRows > 0) return user;
      return new User();
    } catch {
      return new User();
    }
  }

  async delete(id: number): Promise<boolean> {
    try {
      const query = `DELETE FROM users WHERE id = ?`;
      const [result] = await db.execute<ResultSetHeader>(query, [id]);
      return result.affectedRows > 0;
    } catch {
      return false;
    }
  }

  async exists(id: number): Promise<boolean> {
    try {
      const query = `SELECT COUNT(*) as count FROM users WHERE id = ?`;
      const [rows] = await db.execute<RowDataPacket[]>(query, [id]);
      return rows[0].count > 0;
    } catch {
      return false;
    }
  }
}