<?php

namespace App\Entity;

use App\Repository\FilmRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=FilmRepository::class)
 */
class Film
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=200)
     */
    private $title;

    /**
     * @ORM\Column(type="string", length=500, nullable=true)
     */
    private $img_field;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $description;

    /**
     * @ORM\OneToMany(targetEntity=Comment::class, mappedBy="film")
     */
    private $comments;

    /**
     * @ORM\OneToMany(targetEntity=Advice::class, mappedBy="film")
     */
    private $advices;

    /**
     * @ORM\OneToMany(targetEntity=FavoriteFilm::class, mappedBy="film")
     */
    private $favoriteFilms;

    public function __construct()
    {
        $this->comments = new ArrayCollection();
        $this->advices = new ArrayCollection();
        $this->favoriteFilms = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getImgField(): ?string
    {
        return $this->img_field;
    }

    public function setImgField(?string $img_field): self
    {
        $this->img_field = $img_field;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    /**
     * @return Collection|Comment[]
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): self
    {
        if (!$this->comments->contains($comment)) {
            $this->comments[] = $comment;
            $comment->setFilm($this);
        }

        return $this;
    }

    public function removeComment(Comment $comment): self
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getFilm() === $this) {
                $comment->setFilm(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Advice[]
     */
    public function getAdvices(): Collection
    {
        return $this->advices;
    }

    public function addAdvice(Advice $advice): self
    {
        if (!$this->advices->contains($advice)) {
            $this->advices[] = $advice;
            $advice->setFilm($this);
        }

        return $this;
    }

    public function removeAdvice(Advice $advice): self
    {
        if ($this->advices->removeElement($advice)) {
            // set the owning side to null (unless already changed)
            if ($advice->getFilm() === $this) {
                $advice->setFilm(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|FavoriteFilm[]
     */
    public function getFavoriteFilms(): Collection
    {
        return $this->favoriteFilms;
    }

    public function addFavoriteFilm(FavoriteFilm $favoriteFilm): self
    {
        if (!$this->favoriteFilms->contains($favoriteFilm)) {
            $this->favoriteFilms[] = $favoriteFilm;
            $favoriteFilm->setFilm($this);
        }

        return $this;
    }

    public function removeFavoriteFilm(FavoriteFilm $favoriteFilm): self
    {
        if ($this->favoriteFilms->removeElement($favoriteFilm)) {
            // set the owning side to null (unless already changed)
            if ($favoriteFilm->getFilm() === $this) {
                $favoriteFilm->setFilm(null);
            }
        }

        return $this;
    }
}
