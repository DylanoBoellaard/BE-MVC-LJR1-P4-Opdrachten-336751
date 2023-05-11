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
                        <td>$instructeur->DatumInDienst</td>
                        <td>$instructeur->AantalSterren</td>
                        <td><a href='../instructeur/gebruikteVoertuigen/" . $instructeur->Id . "'><img src='../../public/img/Car-logo-transparent.png' alt='car'></a></td>
                    </tr>";
        }

        $data = [
            'title' => 'Instructeurs in dienst',
            'tableRows' => $rows
        ];

        $this->view('instructeur/index', $data);
    }

    public function gebruikteVoertuigen($Id)
    {
        $instructeur = $this->instructeurModel->getInstructeurById($Id);

        $result = $this->instructeurModel->getToegewezenVoertuigen($Id);

        if (empty($result)) {
            $tableRows = "<tr><td colspan='6'>Geen Toegewezen Voertuigen</td></tr>";
            header('Refresh:3; url=/instructeur/index.php');
        } else {
            //var_dump($result);

            $tableRows = "";
            foreach ($result as $voertuig) {
                $tableRows .= "<tr>
                        <td>$voertuig->TypeVoertuig</td>
                        <td>$voertuig->Type</td>
                        <td>$voertuig->Kenteken</td>
                        <td>$voertuig->Bouwjaar</td>
                        <td>$voertuig->Brandstof</td>
                        <td>$voertuig->Rijbewijscategorie</td>
                    </tr>";
            }
        }

            $data = [
                'title' => 'Door instructeur gebruikte voertuigen',
                'tableRows' => $tableRows,
                'instructeur' => $instructeur
            ];

            $this->view('instructeur/gebruikteVoertuigen', $data);
        
    }

    public function beschikbareVoertuigen()
    {
        //$instructeur = $this->instructeurModel->getInstructeurById($Id);
        //$result = $this->instructeurModel->getBeschikbareVoertuigen();

        $data = [
            'title' => 'Alle beschikbare voertuigen',
            //'tableRows' => $tableRows,
            //'instructeur' => $instructeur
        ];

        $this->view('instructeur/beschikbareVoertuigen', $data);
    }
}
