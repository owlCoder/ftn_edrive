import { UserCharacterDto } from "../../Domain/DTOs/characters/UserCharacterDto";
import { UserCharacter } from "../../Domain/models/UserCharacter";
import { IUserCharacterRepository } from "../../Domain/repositories/characters/IUserCharacterRepository";
import { IAuditService } from "../../Domain/services/audits/IAuditService";
import { IUserCharacterService } from "../../Domain/services/users/IUserCharacterService";


export class UserCharacterService implements IUserCharacterService {
  public constructor(
    private userCharacterRepository: IUserCharacterRepository,
    private auditService: IAuditService
  ) {}

  async addCharacterToCollection(
    userId: number,
    characterId: number,
    data: Omit<UserCharacterDto, 'id' | 'userId' | 'characterId' | 'createdAt' | 'updatedAt'>
  ): Promise<UserCharacterDto> {
    // Provera da li već postoji u kolekciji
    const exists = await this.userCharacterRepository.existsForUserAndCharacter(userId, characterId);
    if (exists) return new UserCharacterDto();

    const userChar = new UserCharacter(
      0,
      userId,
      characterId,
      data.level,
      data.constellation,
      data.weaponName,
      data.refinement
    );
    const created = await this.userCharacterRepository.create(userChar);
    if (created.id === 0) return new UserCharacterDto();

    await this.auditService.create({
      userId,
      action: 'COLLECTION_ADD',
      details: `Added character ${characterId} to collection`,
      ipAddress: ''
    });

    return new UserCharacterDto(
      created.id, created.userId, created.characterId, created.level,
      created.constellation, created.weaponName, created.refinement,
      created.createdAt, created.updatedAt
    );
  }

  async getUserCollection(userId: number): Promise<UserCharacterDto[]> {
    const collection = await this.userCharacterRepository.getAllByUserId(userId);
    return collection.map(uc => new UserCharacterDto(
      uc.id, uc.userId, uc.characterId, uc.level,
      uc.constellation, uc.weaponName, uc.refinement,
      uc.createdAt, uc.updatedAt
    ));
  }

  async getUserCharacterById(id: number): Promise<UserCharacterDto> {
    const uc = await this.userCharacterRepository.getById(id);
    if (uc.id === 0) return new UserCharacterDto();
    return new UserCharacterDto(
      uc.id, uc.userId, uc.characterId, uc.level,
      uc.constellation, uc.weaponName, uc.refinement,
      uc.createdAt, uc.updatedAt
    );
  }

  async updateUserCharacter(id: number, data: Partial<UserCharacterDto>): Promise<UserCharacterDto> {
    const existing = await this.userCharacterRepository.getById(id);
    if (existing.id === 0) return new UserCharacterDto();

    if (data.level !== undefined) existing.level = data.level;
    if (data.constellation !== undefined) existing.constellation = data.constellation;
    if (data.weaponName !== undefined) existing.weaponName = data.weaponName;
    if (data.refinement !== undefined) existing.refinement = data.refinement;

    const updated = await this.userCharacterRepository.update(existing);
    if (updated.id === 0) return new UserCharacterDto();

    await this.auditService.create({
      userId: updated.userId,
      action: 'COLLECTION_UPDATE',
      details: `Updated character ${updated.characterId} in collection`,
      ipAddress: ''
    });

    return new UserCharacterDto(
      updated.id, updated.userId, updated.characterId, updated.level,
      updated.constellation, updated.weaponName, updated.refinement,
      updated.createdAt, updated.updatedAt
    );
  }

  async removeFromCollection(id: number): Promise<boolean> {
    const deleted = await this.userCharacterRepository.delete(id);
    if (deleted) {
      // Dobavljanje userId za audit (možemo unapred)
      // Možda bismo trebali proslediti userId u metodu, ali za sada ostavljamo ovako
      await this.auditService.create({
        userId: null,
        action: 'COLLECTION_REMOVE',
        details: `Removed user character ${id}`,
        ipAddress: ''
      });
    }
    return deleted;
  }
}