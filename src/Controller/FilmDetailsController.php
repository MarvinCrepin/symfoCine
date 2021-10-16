<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Form\CommentsType;
use App\Repository\FilmRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Routing\Annotation\Route; 

/**
     * @Route("/film", name="film_")
     * @package App\Controller
 */


class FilmDetailsController extends AbstractController
{
    /**
     * @Route("/details/{slug}", name="details")
     */

        public function details($slug, FilmRepository $filmRepo, Request $request)
        {
            $film = $filmRepo->findOneBy(['slug' => $slug]);
    
            if(!$film){
                throw new NotFoundHttpException('Pas de film trouvé');
            }
    // Partie commentaire 

    
            
        return $this->render('film_details/index.html.twig', compact('film'));
    }
}
