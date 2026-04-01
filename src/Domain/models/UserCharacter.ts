export class UserCharacter {
    constructor(
        public id: number = 0,
        public userId: number = 0,
        public characterId: number = 0,
        public level: number = 1,
        public constellation: number = 0,
        public weaponName: string = '',
        public refinement: number = 1,
        public createdAt: Date = new Date(),
        public updatedAt: Date = new Date()
    ) {}
}