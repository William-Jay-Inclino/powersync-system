import { IsOptional } from 'class-validator';
import { CreateDepartmentInput } from './create-department.input';
import { InputType, Field, PartialType } from '@nestjs/graphql';

@InputType()
export class UpdateDepartmentInput extends PartialType(CreateDepartmentInput) {

  @Field(() => String, { nullable: true })
  @IsOptional()
  code?: string;

  @Field(() => String, { nullable: true })
  @IsOptional()
  name?: string;
}
