<?php

namespace App\Controller;
use App\Entity\Film;
use App\Entity\FavoriteFilm;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="app_home")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Film::class);
        $film = $repository->findAll();

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'films' => $film,
        ]);

        
    }

}
