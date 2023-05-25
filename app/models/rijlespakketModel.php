<?php

class InstructeurModel
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
                 
                 INNER JOIN LesPakket AS lp
                 
                 INNER JOIN LeerlingPerLesPakket AS lpp
                 ON lp.Id = lpp.LesPakketId
                 ON le.Id - lpp.LeerlingId";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}