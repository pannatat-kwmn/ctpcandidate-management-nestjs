import { ApiProperty } from '@nestjs/swagger';
import { UUID } from 'crypto';

export class CreateCandidateDto {
    
    @ApiProperty({ required: true })
    candidateId: UUID;
  
    @ApiProperty({ required: true })
    email: string;
  
    @ApiProperty({ required: true })
    firstName: string;

    @ApiProperty({ required: true })
    lastName: string;

    @ApiProperty({ required: true })
    birthDate: Date;
    
    @ApiProperty({ required: true })
    minSalary: number;

    @ApiProperty({ required: true })
    maxSalary: number;
  
    @ApiProperty({ required: true })
    phoneNumber: string;

    @ApiProperty({ required: true })
    candidateAddress: string;

    @ApiProperty({ required: true })
    candidateImage: string;

    @ApiProperty({ required: true })
    candidateJob: string;

    @ApiProperty({ required: true })
    jobCategory: string;

    @ApiProperty({ required: true })
    createBy: string;

    @ApiProperty({ required: true })
    createAt: Date;
}
