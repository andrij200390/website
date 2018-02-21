<?php

namespace frontend\controllers;

class ArticleController extends NewsController
{
    /* Since for article view we must use another representation, let's redefine this value to needed file for rendering */
    public $partialViewFile = '_articleblock';
    public $isArticle = 1;
}
