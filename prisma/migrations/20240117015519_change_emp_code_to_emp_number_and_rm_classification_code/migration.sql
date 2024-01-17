-- CreateTable
CREATE TABLE "sys_division" (
    "id" TEXT NOT NULL,
    "department_id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "status" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_division_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_department" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "status" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_employee" (
    "id" TEXT NOT NULL,
    "employee_number" TEXT NOT NULL,
    "firstname" TEXT NOT NULL,
    "middlename" TEXT,
    "lastname" TEXT NOT NULL,
    "department_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_classification" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_classification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "employee_id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "status" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_jo_approver_setting" (
    "id" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "approver_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_jo_approver_setting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_rv_approver_setting" (
    "id" TEXT NOT NULL,
    "approver_id" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_rv_approver_setting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_spr_approver_setting" (
    "id" TEXT NOT NULL,
    "approver_id" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_spr_approver_setting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_meqs_approver_setting" (
    "id" TEXT NOT NULL,
    "approver_id" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_meqs_approver_setting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_po_approver_setting" (
    "id" TEXT NOT NULL,
    "approver_id" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_po_approver_setting_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "sys_division_code_key" ON "sys_division"("code");

-- CreateIndex
CREATE UNIQUE INDEX "sys_department_code_key" ON "sys_department"("code");

-- CreateIndex
CREATE UNIQUE INDEX "sys_employee_employee_number_key" ON "sys_employee"("employee_number");

-- CreateIndex
CREATE UNIQUE INDEX "User_employee_id_key" ON "User"("employee_id");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "sys_jo_approver_setting_order_key" ON "sys_jo_approver_setting"("order");

-- CreateIndex
CREATE UNIQUE INDEX "sys_jo_approver_setting_approver_id_key" ON "sys_jo_approver_setting"("approver_id");

-- CreateIndex
CREATE UNIQUE INDEX "sys_rv_approver_setting_approver_id_key" ON "sys_rv_approver_setting"("approver_id");

-- CreateIndex
CREATE UNIQUE INDEX "sys_rv_approver_setting_order_key" ON "sys_rv_approver_setting"("order");

-- CreateIndex
CREATE UNIQUE INDEX "sys_spr_approver_setting_approver_id_key" ON "sys_spr_approver_setting"("approver_id");

-- CreateIndex
CREATE UNIQUE INDEX "sys_spr_approver_setting_order_key" ON "sys_spr_approver_setting"("order");

-- CreateIndex
CREATE UNIQUE INDEX "sys_meqs_approver_setting_approver_id_key" ON "sys_meqs_approver_setting"("approver_id");

-- CreateIndex
CREATE UNIQUE INDEX "sys_meqs_approver_setting_order_key" ON "sys_meqs_approver_setting"("order");

-- CreateIndex
CREATE UNIQUE INDEX "sys_po_approver_setting_approver_id_key" ON "sys_po_approver_setting"("approver_id");

-- CreateIndex
CREATE UNIQUE INDEX "sys_po_approver_setting_order_key" ON "sys_po_approver_setting"("order");

-- AddForeignKey
ALTER TABLE "sys_division" ADD CONSTRAINT "sys_division_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "sys_department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sys_employee" ADD CONSTRAINT "sys_employee_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "sys_department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "sys_employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sys_jo_approver_setting" ADD CONSTRAINT "sys_jo_approver_setting_approver_id_fkey" FOREIGN KEY ("approver_id") REFERENCES "sys_employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sys_rv_approver_setting" ADD CONSTRAINT "sys_rv_approver_setting_approver_id_fkey" FOREIGN KEY ("approver_id") REFERENCES "sys_employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sys_spr_approver_setting" ADD CONSTRAINT "sys_spr_approver_setting_approver_id_fkey" FOREIGN KEY ("approver_id") REFERENCES "sys_employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sys_meqs_approver_setting" ADD CONSTRAINT "sys_meqs_approver_setting_approver_id_fkey" FOREIGN KEY ("approver_id") REFERENCES "sys_employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sys_po_approver_setting" ADD CONSTRAINT "sys_po_approver_setting_approver_id_fkey" FOREIGN KEY ("approver_id") REFERENCES "sys_employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
