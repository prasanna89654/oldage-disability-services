/*
  Warnings:

  - Added the required column `stateId` to the `District` table without a default value. This is not possible if the table is not empty.
  - Added the required column `districtId` to the `Local` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stateId` to the `Local` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "District" ADD COLUMN     "stateId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Local" ADD COLUMN     "districtId" INTEGER NOT NULL,
ADD COLUMN     "stateId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "nepaliName" TEXT NOT NULL,
    "englishName" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);
