<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class Home extends AbstractController
{
    /**
     * @Route("/")
     */
    public function main(): Response
    {
        $user_name= "sami";

        return $this->render('home.html.twig', [
            'user_name' => $user_name,
        ]);
    }
}