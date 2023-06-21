import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { v4 as uuid } from 'uuid';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaService) { }

  async create(createUserDto: CreateUserDto) {
    createUserDto.userId = uuid();
    createUserDto.userSalt = await bcrypt.genSalt();
    createUserDto.userPassword = await bcrypt.hash(createUserDto.userPassword, createUserDto.userSalt);
    createUserDto.permissionId = "4ef0f2a2-c75d-45fe-be1c-c19dd3952b69";
    console.log(createUserDto);
    return this.prisma.users.create({ data: createUserDto })
  }

  findAll() {
    return this.prisma.users.findMany();
  }

  async findOne(userName: string) {
    return this.prisma.users.findUnique({ where: { userName } });
  }

  async findByUserName(userName: string) {
    return this.prisma.users.findUnique({ where: { userName } });
  }

  async findbyUserEmail(userEmail: string) {
    return this.prisma.users.findUnique({ where: { userEmail } });
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
