<?php

namespace App\Controller;

use App\Entity\FavoriteFilm;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;

class FavoritesController extends AbstractController
{
    /**
     * @Route("/favorites", name="app_favorites")
     */

    public function favoriteUserFilm(UserInterface $user): Response
    {
        $favoriteUserFilm = $this->getDoctrine()
            ->getRepository(FavoriteFilm::class)
            ->findBy(["user" => $user]);

            $films = [];
            foreach($favoriteUserFilm as $favFilm){
            $films[] = $favFilm->getFilm();
            }
        
        return $this->render('favorites/index.html.twig', [
            'controller_name' => 'FavoritesController',
            'films' => $films,
        ]);
    }


    
    
}
