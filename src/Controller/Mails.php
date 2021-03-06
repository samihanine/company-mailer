<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Company;
use App\Entity\Person;
use App\Entity\Mail;
use Doctrine\Persistence\ManagerRegistry;
use App\Form\MailType;

use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class Mails extends AbstractController
{

    /**
     * @Route("/mail/to/{id}", name="mail_create")
     * @IsGranted("ROLE_USER")
     */
    public function create(Request $request, ManagerRegistry $doctrine, int $id, MailerInterface $mailer): Response
    {
        $person = $doctrine->getRepository(Person::class)->find($id);
        $company = $doctrine->getRepository(Company::class)->find($person->getCompany());

        $mail = new Mail();
        $mail->setRecipient($person->getMail());

        $form = $this->createForm(MailType::class, $mail);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            $email = (new Email())
                ->from('ptut.iut69@gmail.com')
                ->to($person->getMail())
                ->subject($mail->getSubject())
                ->html('<p>'.$mail->getBody().'</p>');

            $mailer->send($email);

            // we save the email in the database
            $user = $this->getUser();
            $mail->setDate(new \DateTime());
            $mail->setUser($user);
            $em = $doctrine->getManager();
            $em->persist($mail);
            $em->flush();

            return $this->render('mail/mail_success.html.twig', []);
        }

        return $this->render('mail/mail_create.html.twig', [
            'person' => $person,
            'company' => $company,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/mail/history")
     * @IsGranted("ROLE_USER")
     */
    public function history(ManagerRegistry $doctrine): Response
    {
        $mails = $doctrine->getRepository(Mail::class)->findAll();

        return $this->render('mail/mail_history.html.twig', [
            'mails' => $mails
        ]);
    }
}