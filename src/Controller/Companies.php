<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Company;
use App\Entity\Person;
use Doctrine\Persistence\ManagerRegistry;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;


class Companies extends AbstractController
{

    /**
     * @Route("/company", name="company")
     */
    public function main(ManagerRegistry $doctrine): Response
    {
        $companies = $doctrine->getRepository(Company::class)->findAll();

        return $this->render('company/companies.html.twig', [
            'companies' => $companies
        ]);
    }

    /**
     * @Route("/company/info/{id}", name="company_show")
     */
    public function company(ManagerRegistry $doctrine, int $id): Response
    {
        $company = $doctrine->getRepository(Company::class)->find($id);
        $persons = $doctrine->getRepository(Person::class)->findBy(array('company' => $id));

        return $this->render('company/company_show.html.twig', [
            'company' => $company,
            'persons' => $persons
        ]);
    }

    /**
     * @Route("/company/create", name="company_create")
     */
    public function create(ManagerRegistry $doctrine): Response
    {
        $entityManager = $doctrine->getManager();
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $user = $this->getUser();

        if ($this->isGranted('ROLE_ADMIN') == false) {
            return $this->redirectToRoute('home');
        }

        return $this->render('company/company_create.html.twig', [

        ]);
    }
}