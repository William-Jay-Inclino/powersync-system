import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Employee } from 'src/employee/entities/employee.entity';

@ObjectType()
export class Department {

  @Field(() => String)
  id: string;

  @Field(() => String)
  code: string;

  @Field(() => String)
  name: string;

  @Field(() => Int)
  status: number;
  
  @Field(() => [Employee])
  employees?: Employee[];
}
