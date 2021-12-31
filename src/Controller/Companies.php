<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Company;
use App\Entity\Person;
use Doctrine\Persistence\ManagerRegistry;

class Companies extends AbstractController
{
    /**
     * @Route("/companies")
     */
    public function main(ManagerRegistry $doctrine): Response
    {
        $companies = $doctrine->getRepository(Company::class)->findAll();

        return $this->render('companies.html.twig', [
            'companies' => $companies
        ]);
    }

    /**
     * @Route("/companies/{id}", name="company_show")
     */
    public function company(ManagerRegistry $doctrine, int $id): Response
    {
        $company = $doctrine->getRepository(Company::class)->find($id);
        $persons = $doctrine->getRepository(Person::class)->findBy(array('company' => $id));

        return $this->render('company_show.html.twig', [
            'company' => $company,
            'persons' => $persons
        ]);
    }
}