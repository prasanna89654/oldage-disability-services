import { PrismaClient, Role } from '@prisma/client';
import * as bcrypt from 'bcrypt';
const prisma = new PrismaClient();

async function main(): Promise<void> {
  await prisma.role.createMany({
    data: [{ name: 'Super Admin' }, { name: 'User' }],
  });

  const { id }: Pick<Role, 'id'> = await prisma.role.findFirst({
    where: { name: 'Super Admin' },
  });

  await prisma.user.create({
    data: {
      name: 'Lightbulb Technology',
      email: 'admin@lbtechnology.co',
      password: await bcrypt.hash(process.env.SUPER_ADMIN_PASSWORD, 10),
      mobile: '9862329598',
      role: {
        connect: {
          id,
        },
      },
    },
  });
}

main()
  .catch((e) => {
    console.log(e);
    process.exit(1);
  })
  .finally(() => {
    prisma.$disconnect;
  });
