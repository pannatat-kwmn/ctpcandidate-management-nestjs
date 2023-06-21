import { ApiProperty } from '@nestjs/swagger';
import { UUID } from 'crypto';

export class CreateUserDto {
    userId: UUID;
  
    @ApiProperty({ required: true })
    userName: string;
  
    @ApiProperty({ required: true })
    userPassword: string;

    @ApiProperty({ required: true })
    userEmail: string;

    @ApiProperty({ required: true })
    profileFirstName: string;
    
    @ApiProperty({ required: true })
    profileLastName: string;

    @ApiProperty({ required: true })
    createBy: string;

    @ApiProperty({ required: true })
    createAt: Date;
    
    userSalt: string;

    permissionId: string;
}
