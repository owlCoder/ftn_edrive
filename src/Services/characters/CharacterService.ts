import { CharacterDto } from "../../Domain/DTOs/characters/CharacterDto";
import { ElementType } from "../../Domain/enums/ElementType";
import { WeaponType } from "../../Domain/enums/WeaponType";
import { Character } from "../../Domain/models/Character";
import { ICharacterRepository } from "../../Domain/repositories/characters/ICharacterRepository";
import { IAuditService } from "../../Domain/services/audits/IAuditService";
import { ICharacterService } from "../../Domain/services/characters/ICharacterService";

export class CharacterService implements ICharacterService {
  public constructor(
    private characterRepository: ICharacterRepository,
    private auditService: IAuditService
  ) {}

  async createCharacter(data: Omit<CharacterDto, 'id' | 'createdAt' | 'updatedAt'>): Promise<CharacterDto> {
    const character = new Character(
      0,
      data.name,
      data.element as ElementType,
      data.weaponType as WeaponType,
      data.rarity,
      data.region,
      data.description,
      data.image
    );
    const created = await this.characterRepository.create(character);
    if (created.id === 0) return new CharacterDto();

    await this.auditService.create({
      userId: null, // može se proslediti admin ID ako je poznat
      action: 'CHARACTER_CREATE',
      details: `Character ${created.name} created`,
      ipAddress: ''
    });

    return new CharacterDto(
      created.id, created.name, created.element, created.weaponType,
      created.rarity, created.region, created.description, created.image,
      created.createdAt, created.updatedAt
    );
  }

  async getCharacterById(id: number): Promise<CharacterDto> {
    const character = await this.characterRepository.getById(id);
    if (character.id === 0) return new CharacterDto();
    return new CharacterDto(
      character.id, character.name, character.element, character.weaponType,
      character.rarity, character.region, character.description, character.image,
      character.createdAt, character.updatedAt
    );
  }

  async getAllCharacters(): Promise<CharacterDto[]> {
    const characters = await this.characterRepository.getAll();
    return characters.map(c => new CharacterDto(
      c.id, c.name, c.element, c.weaponType,
      c.rarity, c.region, c.description, c.image,
      c.createdAt, c.updatedAt
    ));
  }

  async updateCharacter(id: number, data: Partial<CharacterDto>): Promise<CharacterDto> {
    const existing = await this.characterRepository.getById(id);
    if (existing.id === 0) return new CharacterDto();

    // Update fields
    if (data.name !== undefined) existing.name = data.name;
    if (data.element !== undefined) existing.element = data.element as ElementType;
    if (data.weaponType !== undefined) existing.weaponType = data.weaponType as WeaponType;
    if (data.rarity !== undefined) existing.rarity = data.rarity;
    if (data.region !== undefined) existing.region = data.region;
    if (data.description !== undefined) existing.description = data.description;
    if (data.image !== undefined) existing.image = data.image;

    const updated = await this.characterRepository.update(existing);
    if (updated.id === 0) return new CharacterDto();

    await this.auditService.create({
      userId: null,
      action: 'CHARACTER_UPDATE',
      details: `Character ${updated.name} updated`,
      ipAddress: ''
    });

    return new CharacterDto(
      updated.id, updated.name, updated.element, updated.weaponType,
      updated.rarity, updated.region, updated.description, updated.image,
      updated.createdAt, updated.updatedAt
    );
  }

  async deleteCharacter(id: number): Promise<boolean> {
    const deleted = await this.characterRepository.delete(id);
    if (deleted) {
      await this.auditService.create({
        userId: null,
        action: 'CHARACTER_DELETE',
        details: `Character with id ${id} deleted`,
        ipAddress: ''
      });
    }
    return deleted;
  }

  async filterCharacters(element?: string, weaponType?: string, rarity?: number): Promise<CharacterDto[]> {
    let characters: Character[] = [];

    if (element) {
      characters = await this.characterRepository.getByElement(element);
    } else if (weaponType) {
      characters = await this.characterRepository.getByWeaponType(weaponType);
    } else if (rarity) {
      characters = await this.characterRepository.getByRarity(rarity);
    } else {
      characters = await this.characterRepository.getAll();
    }

    // Moguće je naknadno filtrirati po više kriterijuma, ali radi jednostavnosti ostavljamo ovako
    return characters.map(c => new CharacterDto(
      c.id, c.name, c.element, c.weaponType,
      c.rarity, c.region, c.description, c.image,
      c.createdAt, c.updatedAt
    ));
  }
}