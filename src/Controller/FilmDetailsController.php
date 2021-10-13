<?php

namespace App\Controller;

use App\Repository\FilmRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
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

        public function details($slug, FilmRepository $filmRepo)
        {
            $film = $filmRepo->findOneBy(['slug' => $slug]);
    
            if(!$film){
                throw new NotFoundHttpException('Pas d\'annonce trouvée');
            }
            
        return $this->render('film_details/index.html.twig', compact('film'));
    }
}
