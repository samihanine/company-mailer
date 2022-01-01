<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class Home extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function main(): Response
    {
        $user = $this->getUser();
        $firstname = $user ? $user->getFirstname() : "";

        return $this->render('home/home.html.twig', [
            'firstname' => $firstname,
        ]);
    }
}