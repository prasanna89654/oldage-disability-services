-- CreateEnum
CREATE TYPE "local_level_type" AS ENUM ('vdc', 'municipality', 'sub_metropolitan', 'metropolitan');

-- CreateEnum
CREATE TYPE "blood_group" AS ENUM ('A_Positive', 'A_Negative', 'B_Positive', 'B_Negative', 'AB_Positive', 'AB_Negative', 'O_Positive', 'O_Negative');

-- CreateEnum
CREATE TYPE "disability_level" AS ENUM ('full', 'severe', 'medium', 'normal');

-- CreateTable
CREATE TABLE "local_levels" (
    "id" SERIAL NOT NULL,
    "district_id" INTEGER NOT NULL,
    "nepali_name" TEXT NOT NULL,
    "english_name" TEXT NOT NULL,
    "type" "local_level_type" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "local_levels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "states" (
    "id" SERIAL NOT NULL,
    "nepali_name" TEXT NOT NULL,
    "english_name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "states_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "districts" (
    "id" SERIAL NOT NULL,
    "state_id" INTEGER NOT NULL,
    "nepali_name" TEXT NOT NULL,
    "english_name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "districts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "role_id" INTEGER,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "mobile" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "certifiers" (
    "id" SERIAL NOT NULL,
    "local_level_id" INTEGER NOT NULL,
    "nepali_name" TEXT NOT NULL,
    "english_name" TEXT NOT NULL,
    "post_nepali" TEXT NOT NULL,
    "post_english" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "certifiers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "genders" (
    "id" SERIAL NOT NULL,
    "nepali_name" TEXT NOT NULL,
    "english_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "genders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "disability_types" (
    "id" SERIAL NOT NULL,
    "nepali_name" TEXT NOT NULL,
    "english_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "disability_types_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "disables" (
    "id" SERIAL NOT NULL,
    "gender_id" INTEGER NOT NULL,
    "state_id" INTEGER NOT NULL,
    "district_id" INTEGER NOT NULL,
    "local_level_id" INTEGER NOT NULL,
    "disability_type_id" INTEGER NOT NULL,
    "nepali_name" TEXT NOT NULL,
    "english_name" TEXT NOT NULL,
    "dob_ad" TIMESTAMP(3) NOT NULL,
    "dob_bs" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "blood_group" "blood_group" NOT NULL,
    "ward" INTEGER NOT NULL,
    "guardian_name_nepali" TEXT NOT NULL,
    "guardian_name_english" TEXT NOT NULL,
    "is_adult" BOOLEAN NOT NULL,
    "citizenship_no" TEXT,
    "citizenship_district_id" INTEGER,
    "citizenship_issued_date_nepali" TEXT,
    "citizenship_issued_date_english" TIMESTAMP(3),
    "disability_level" "disability_level" NOT NULL,
    "image_url" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "disables_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "senior_citizens" (
    "id" SERIAL NOT NULL,
    "gender_id" INTEGER NOT NULL,
    "state_id" INTEGER NOT NULL,
    "district_id" INTEGER NOT NULL,
    "local_level_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "dob_ad" TIMESTAMP(3) NOT NULL,
    "dob_bs" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "blood_group" "blood_group" NOT NULL,
    "citizenship_no" TEXT NOT NULL,
    "citizenship_district_id" INTEGER NOT NULL,
    "citizenship_issued_date_nepali" TEXT NOT NULL,
    "citizenship_issued_date_english" TIMESTAMP(3) NOT NULL,
    "spouse_name" TEXT,
    "facilities" TEXT,
    "contact_person_name" TEXT,
    "contact_person_address" TEXT,
    "certificate_no" TEXT,
    "home_care_name" TEXT,
    "disease" TEXT,
    "medicine" TEXT,
    "image_url" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "senior_citizens_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "local_levels_nepali_name_key" ON "local_levels"("nepali_name");

-- CreateIndex
CREATE UNIQUE INDEX "local_levels_english_name_key" ON "local_levels"("english_name");

-- CreateIndex
CREATE UNIQUE INDEX "states_nepali_name_key" ON "states"("nepali_name");

-- CreateIndex
CREATE UNIQUE INDEX "states_english_name_key" ON "states"("english_name");

-- CreateIndex
CREATE UNIQUE INDEX "districts_nepali_name_key" ON "districts"("nepali_name");

-- CreateIndex
CREATE UNIQUE INDEX "districts_english_name_key" ON "districts"("english_name");

-- CreateIndex
CREATE UNIQUE INDEX "roles_name_key" ON "roles"("name");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_mobile_key" ON "users"("mobile");

-- CreateIndex
CREATE UNIQUE INDEX "users_password_key" ON "users"("password");

-- CreateIndex
CREATE UNIQUE INDEX "genders_nepali_name_key" ON "genders"("nepali_name");

-- CreateIndex
CREATE UNIQUE INDEX "genders_english_name_key" ON "genders"("english_name");

-- CreateIndex
CREATE UNIQUE INDEX "disability_types_nepali_name_key" ON "disability_types"("nepali_name");

-- CreateIndex
CREATE UNIQUE INDEX "disability_types_english_name_key" ON "disability_types"("english_name");

-- AddForeignKey
ALTER TABLE "local_levels" ADD CONSTRAINT "local_levels_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "districts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "districts" ADD CONSTRAINT "districts_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "certifiers" ADD CONSTRAINT "certifiers_local_level_id_fkey" FOREIGN KEY ("local_level_id") REFERENCES "local_levels"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disables" ADD CONSTRAINT "disables_gender_id_fkey" FOREIGN KEY ("gender_id") REFERENCES "genders"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disables" ADD CONSTRAINT "disables_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disables" ADD CONSTRAINT "disables_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "districts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disables" ADD CONSTRAINT "disables_local_level_id_fkey" FOREIGN KEY ("local_level_id") REFERENCES "local_levels"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disables" ADD CONSTRAINT "disables_disability_type_id_fkey" FOREIGN KEY ("disability_type_id") REFERENCES "disability_types"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "senior_citizens" ADD CONSTRAINT "senior_citizens_gender_id_fkey" FOREIGN KEY ("gender_id") REFERENCES "genders"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "senior_citizens" ADD CONSTRAINT "senior_citizens_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "senior_citizens" ADD CONSTRAINT "senior_citizens_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "districts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "senior_citizens" ADD CONSTRAINT "senior_citizens_local_level_id_fkey" FOREIGN KEY ("local_level_id") REFERENCES "local_levels"("id") ON DELETE CASCADE ON UPDATE CASCADE;
