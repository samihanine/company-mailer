<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220101010423 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE mail ADD user_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE mail ADD CONSTRAINT FK_5126AC48A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_5126AC48A76ED395 ON mail (user_id)');
        $this->addSql('ALTER TABLE user ADD firstname VARCHAR(255) NOT NULL, ADD lastname VARCHAR(255) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE mail DROP FOREIGN KEY FK_5126AC48A76ED395');
        $this->addSql('DROP INDEX IDX_5126AC48A76ED395 ON mail');
        $this->addSql('ALTER TABLE mail DROP user_id');
        $this->addSql('ALTER TABLE user DROP firstname, DROP lastname');
    }
}
