import { Injectable } from '@nestjs/common';
import { CreateCandidateDto } from './dto/create-candidate.dto';
import { UpdateCandidateDto } from './dto/update-candidate.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { UUID } from 'crypto';

@Injectable()
export class CandidatesService {
  constructor(private prisma: PrismaService) { }

  
  create(createCandidateDto: CreateCandidateDto) {
    return this.prisma.candidates.create({ data: createCandidateDto })
  }

  findAll() {
    return this.prisma.candidates.findMany();
  }

  findCreateBy(createBy: string) {
    return this.prisma.candidates.findMany( { where: {createBy: createBy} });
  }

  findOne(candidateId: UUID) {
    return this.prisma.candidates.findUnique({ where: { candidateId } });
  }

  update(candidateId: UUID, updateCandidateDto: UpdateCandidateDto) {
    return this.prisma.candidates.update({
      where: { candidateId },
      data: updateCandidateDto,
    });
  }

  remove(candidateId: UUID) {
    return this.prisma.candidates.delete({ where: { candidateId } });
  }
}
