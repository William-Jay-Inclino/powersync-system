import { InputType, Field } from '@nestjs/graphql';
import { IsNotEmpty } from 'class-validator';

@InputType()
export class CreateDepartmentInput {

  @Field(() => String)
  @IsNotEmpty()
  code: string;

  @Field(() => String)
  @IsNotEmpty()
  name: string;
}
