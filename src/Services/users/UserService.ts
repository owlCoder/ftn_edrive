import { UserDto } from "../../Domain/DTOs/users/UserDto";
import { IUserRepository } from "../../Domain/repositories/users/IUserRepository";
import { IAuditService } from "../../Domain/services/audits/IAuditService";
import { IUserService } from "../../Domain/services/users/IUserService";

export class UserService implements IUserService {
  public constructor(
    private userRepository: IUserRepository,
    private auditService: IAuditService
  ) {}

  async getAllUsers(): Promise<UserDto[]> {
    const users = await this.userRepository.getAll();
    return users.map(user => new UserDto(
      user.id, user.username, user.fullName, user.email,
      user.role, user.profilePicture, user.createdAt, user.updatedAt
    ));
  }

  async getUserById(id: number): Promise<UserDto> {
    const user = await this.userRepository.getById(id);
    if (user.id === 0) return new UserDto();
    return new UserDto(
      user.id, user.username, user.fullName, user.email,
      user.role, user.profilePicture, user.createdAt, user.updatedAt
    );
  }

  async updateUserRole(id: number, newRole: 'player' | 'admin'): Promise<UserDto> {
    const user = await this.userRepository.getById(id);
    if (user.id === 0) return new UserDto();

    user.role = newRole;
    const updated = await this.userRepository.update(user);
    if (updated.id === 0) return new UserDto();

    // Beležimo promenu uloge u audit
    await this.auditService.create({
      userId: id,
      action: 'ROLE_CHANGE',
      details: `Role changed to ${newRole}`,
      ipAddress: ''
    });

    return new UserDto(
      updated.id, updated.username, updated.fullName, updated.email,
      updated.role, updated.profilePicture, updated.createdAt, updated.updatedAt
    );
  }

  async deleteUser(id: number): Promise<boolean> {
    const deleted = await this.userRepository.delete(id);
    if (deleted) {
      await this.auditService.create({
        userId: id,
        action: 'USER_DELETED',
        details: `User deleted`,
        ipAddress: ''
      });
    }
    return deleted;
  }
}