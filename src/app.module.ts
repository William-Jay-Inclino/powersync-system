import { Module } from '@nestjs/common';
import { DepartmentModule } from './department/department.module';
import { EmployeeModule } from './employee/employee.module';
import { ConfigModule } from '@nestjs/config';
import { GraphQLModule } from '@nestjs/graphql';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      autoSchemaFile: 'schema.gql',
    }),
    DepartmentModule, 
    EmployeeModule],
})
export class AppModule {}
