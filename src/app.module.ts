import { Module } from '@nestjs/common';
import { CandidatesModule } from './candidates/candidates.module';
import { PrismaModule } from './prisma/prisma.module';
import { ProjectsModule } from './projects/projects.module';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';

@Module({
  imports: [CandidatesModule, PrismaModule, ProjectsModule, AuthModule, UsersModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
