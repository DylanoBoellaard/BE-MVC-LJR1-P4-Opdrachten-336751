<?php

class Rijlespakket extends BaseController
{
    private $rijlespakketModel;

    public function __construct()
    {
        $this->rijlespakketModel = $this->model('RijlespakketModel');
    }

    public function index()
    {
        $result = $this->rijlespakketModel->getRijlesPakketen();

        $rows = "";
        foreach ($result as $rijlespakket) {
            $rows .= "<tr>
                        <td>$rijlespakket->Voornaam</td>
                        <td>$rijlespakket->Mobiel</td>
                        <td>$rijlespakket->PakketNaam</td>
                        <td>$rijlespakket->AantalLessen</td>
                        <td>$rijlespakket->Prijs</td>
                        <td>$rijlespakket->StartDatumRijlessen</td>
                        <td>$rijlespakket->DatumRijbewijsBehaald</td>
                    </tr>";
        }

        $data = [
            'title' => 'Overzicht rijlespakketen leerlingen',
            'tableRows' => $rows
        ];

        $this->view('rijlespakket/index', $data);
    }
}
