import { ApiProperty } from '@nestjs/swagger';
import { UUID } from 'crypto';

export class CreateProjectDto {
    @ApiProperty({ required: true })
    projectName: string;

    @ApiProperty({ required: true })
    projectDescription: string;
    
    @ApiProperty({ required: true })
    projectStatus: string;

    @ApiProperty({ required: true })
    createBy: string;
}
