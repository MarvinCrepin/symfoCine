<?php

namespace App\Controller\Admin;

use App\Entity\Film;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use Doctrine\ORM\EntityManagerInterface;

class FilmCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Film::class;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
    /* public function deleteEntity(EntityManagerInterface $entityManager, $entityInstance): void
    {
        var_dump($entityInstance);
        $entityManager->remove($entityInstance);
        $entityManager->flush();
        
    }
    */
}
