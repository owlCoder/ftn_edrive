import { Character } from "../../models/Character";

export interface ICharacterRepository {
    create(character: Character): Promise<Character>;
    getById(id: number): Promise<Character>;
    getAll(): Promise<Character[]>;
    update(character: Character): Promise<Character>;
    delete(id: number): Promise<boolean>;
    exists(id: number): Promise<boolean>;
    // dodatne metode za filtriranje
    getByElement(element: string): Promise<Character[]>;
    getByWeaponType(weaponType: string): Promise<Character[]>;
    getByRarity(rarity: number): Promise<Character[]>;
}