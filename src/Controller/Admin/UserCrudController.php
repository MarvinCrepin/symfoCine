<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Manager\UserManager;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use Symfony\Component\HttpFoundation\Response;

use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use PhpParser\Node\Expr\PostDec;
use Symfony\Component\HttpFoundation\Request;


/**
 * @Route("/admin")
 */
class UserCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return User::class;
    }


    
}