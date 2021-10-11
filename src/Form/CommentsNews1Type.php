<?php

namespace App\Form;

use App\Entity\News;
use App\Entity\CommentsNews;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CommentsNews1Type extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('contentCommentNews')
            ->add('rgpd')
            ->add('news', EntityType::class, [
                 'class' => News::class,
                 'choice_label' => 'titleNews',
                 ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => CommentsNews::class,
        ]);
    }
}
