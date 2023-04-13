<?php

class Instructeur extends BaseController
{
    private $instructeurModel;

    public function __construct()
    {
        $this->instructeurModel = $this->model('InstructeurModel');
    }

    public function index() 
    {
        $result = $this->instructeurModel->getInstructeurs();

        $rows = "";
        foreach ($result as $instructeur) {
            $rows .= "<tr>
                        <td>$instructeur->Voornaam</td>
                        <td>$instructeur->Tussenvoegsel</td>
                        <td>$instructeur->Achternaam</td>
                        <td>$instructeur->Mobiel</td>
                    </tr>";
        }

        $data = [
            'title' => 'Instructeurs in dienst',
            'tableRows' => $rows
        ];

        $this->view('instructeur/index', $data);
    }
}