<?php

namespace App\Form;

use App\Entity\Users;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class UsersType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('pseudo')
            ->add('email')
            ->add('roles', ChoiceType::class, [
                'choices' => [
                'Administrateur' => Users::ROLE_ADMIN,
                'Editeur' => Users::ROLE_EDITOR,
                'Moderateur' => Users::ROLE_MODERATOR,
                'Membre' => Users::ROLE_MEMBER,
                'Utilisateur' => Users::ROLE_USER,
                ],
                'multiple' => true,
                'expanded' => true,
                'required' => true,
                ])
            ->add('isVerified')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Users::class,
        ]);
    }
}
