import { config } from 'dotenv';
import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {

  try {
    config();
  } catch (error) {
    console.error('Error loading .env file');
    console.error(error);
    process.exit(1);
  }

  const port = process.env.PORT || 3000;
  const app = await NestFactory.create(AppModule);

  app.enableCors();
  app.useGlobalPipes(new ValidationPipe());

  await app.listen(port);
  console.log(`Application is running on: ${await app.getUrl()}`);
}



bootstrap();