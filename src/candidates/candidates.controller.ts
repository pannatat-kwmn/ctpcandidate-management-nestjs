import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { CandidatesService } from './candidates.service';
import { CreateCandidateDto } from './dto/create-candidate.dto';
import { UpdateCandidateDto } from './dto/update-candidate.dto';
import { UUID } from 'crypto';

@Controller('candidates')
export class CandidatesController {
  constructor(private readonly candidatesService: CandidatesService) {}

  // @Post()
  // create(@Body() createCandidateDto: CreateCandidateDto) {
  //   return this.candidatesService.create(createCandidateDto);
  // }

  @Post()
  async create(@Body() createCandidateDto: CreateCandidateDto) {
    const birthDate = new Date(createCandidateDto.birthDate);
    const birthDateOnly = new Date(birthDate.getFullYear(), birthDate.getMonth(), birthDate.getDate());
    const createdCandidate = await this.candidatesService.create({...createCandidateDto,
      birthDate: birthDateOnly,
    });
    return createdCandidate;
  }

  @Get()
  findAll() {
    return this.candidatesService.findAll();
  }

  @Get('createBy')
  findCreateBy(@Param('createBy') createBy: string) {
    return this.candidatesService.findCreateBy(createBy);
  }

  @Get(':id')
  findOne(@Param('id') id: UUID) {
    return this.candidatesService.findOne(id);
  }

  @Patch(':id')
  async update(@Param('id') id: UUID, @Body() updateCandidateDto: UpdateCandidateDto) {
    const birthDate = new Date(updateCandidateDto.birthDate);
    const birthDateOnly = new Date(birthDate.getFullYear(), birthDate.getMonth(), birthDate.getDate());
    const updatedCandidate = await this.candidatesService.update(id,{...updateCandidateDto,
      birthDate: birthDateOnly,
    });
    return updatedCandidate
  }

  @Delete(':id')
  remove(@Param('id') id: UUID) {
    return this.candidatesService.remove(id);
  }
}
