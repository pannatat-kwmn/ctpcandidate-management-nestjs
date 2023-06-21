import { ApiProperty } from '@nestjs/swagger';
import { UUID } from 'crypto';

export class CreateProjectDto {

    @ApiProperty({ required: true })
    ProjectID: UUID;
  
    @ApiProperty({ required: true })
    ProjectName: string;

    @ApiProperty({ required: true })
    ProjectContent: string;
}
