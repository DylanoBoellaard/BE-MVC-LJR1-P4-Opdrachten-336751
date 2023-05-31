<?php

class RijlespakketModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getRijlesPakketen()
    {
        $sql = "SELECT le.Voornaam, le.Mobiel
                        ,lp.PakketNaam, lp.AantalLessen, lp.Prijs
                        ,lpp.StartDatumRijlessen, lpp.DatumRijbewijsBehaald
                 FROM Leerling AS le
                 
                 INNER JOIN LeerlingPerLesPakket AS lpp
                 ON lpp.LeerlingId = le.Id

                 INNER JOIN LesPakket AS lp
                 ON lpp.LesPakketId = lp.Id
                 
                 ORDER BY lpp.StartDatumRijlessen ASC";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}
