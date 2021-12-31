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

class Mails extends AbstractController
{

    /**
     * @Route("/mail/{id}", name="mail_create")
     */
    public function create(Request $request, ManagerRegistry $doctrine, int $id, MailerInterface $mailer): Response
    {
        $person = $doctrine->getRepository(Person::class)->find($id);
        $company = $doctrine->getRepository(Company::class)->find($person->getCompany());

        $today = date("m.d.y");
        $mail = new Mail();
        $mail->setRecipient($person->getMail());

        $form = $this->createForm(MailType::class, $mail);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            $email = (new Email())
                ->from('ptut.iut69@gmail.com')
                ->to($person->getMail())
                //->cc('cc@example.com')
                //->bcc('bcc@example.com')
                //->replyTo('fabien@example.com')
                //->priority(Email::PRIORITY_HIGH)
                ->subject($mail->getSubject())
                ->html('<p>'.$mail->getBody().'</p>');

            $mailer->send($email);

            // we save the email in the database
            $mail->setDate(new \DateTime());
            $em = $doctrine->getManager();
            $em->persist($mail);
            $em->flush();

            return $this->render('mail_success.html.twig', ['username' => 'end']);


        }

        return $this->render('mail_create.html.twig', [
            'person' => $person,
            'company' => $company,
            'form' => $form->createView(),
        ]);
    }
}