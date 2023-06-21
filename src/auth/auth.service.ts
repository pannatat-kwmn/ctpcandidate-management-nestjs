import { Injectable, UnauthorizedException } from '@nestjs/common';
import { UsersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private jwtService: JwtService
  ) {}

  
  async signIn(userName, userPassword) {
    const user = await this.usersService.findByUserName(userName);
    userPassword = await bcrypt.hash(userPassword, user?.userSalt);
    if (!bcrypt.compare(user?.userPassword, userPassword)) {
      throw new UnauthorizedException();
    }
    const payload = { userName: user.userName, userId: user.userId };
    return {
      access_token: await this.jwtService.signAsync(payload)
    };
  }
}