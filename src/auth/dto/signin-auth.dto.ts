import { ApiProperty } from '@nestjs/swagger';
import { UUID } from 'crypto';

export class SignInAuthDto {

    @ApiProperty({ required: true })
    userName: string;
    
    @ApiProperty({ required: true })
    userPassword: string;
}