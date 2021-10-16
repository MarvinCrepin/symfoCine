<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Film;
use App\Entity\User;
use App\Repository\FilmRepository;
use App\Repository\UserRepository;

class DashboardController extends AbstractDashboardController
{
    /**
     * @var UserRepository
     */
    protected UserRepository $userRepository;

    /**
     * @var UserRepository
     */
    protected FilmRepository $filmRepository;


    public function __construct(
        UserRepository $userRepository,
        FilmRepository $helpRepository,
    )
    {
        $this->userRepository = $userRepository;
        $this->helpRepository = $helpRepository;
    }

    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        return $this->render('admin/dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('SymfoCine');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linktoDashboard('Panneau central', 'fa fa-home');
        yield MenuItem::linkToCrud('Films', 'fas fa-list', Film::class);
        yield MenuItem::linkToCrud('Utilisateurs', 'fas fa-list', User::class);
    }
}
