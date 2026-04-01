import { UserDto } from "../../DTOs/users/UserDto";

export interface IUserService {
  getAllUsers(): Promise<UserDto[]>;
  getUserById(id: number): Promise<UserDto>;
  updateUserRole(id: number, newRole: 'player' | 'admin'): Promise<UserDto>;
  deleteUser(id: number): Promise<boolean>;
}