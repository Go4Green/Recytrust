pragma solidity ^0.5.0;

contract completedPickups {

    struct Pickup {
        uint timestamp;
        uint c_id;
        uint f_id;
        uint coll_id;
        uint tw;
        uint bags;
        uint coll_rating;
        uint f_rating;
    }

    mapping (string => Pickup) Pickups;

    event initiated
    (string code, uint timestamp, uint c_id, uint f_id, uint coll_id, uint tw, uint bags);

    event updateFMRating(string code, uint f_rating, string f_review);
    event updateCollRating(string code, uint coll_rating, string c_review);

    function initiate(string memory code, uint c_id, uint f_id, uint coll_id, uint tw, uint bags) public
    {

        uint time = now;
        emit initiated(code, time, c_id, f_id, coll_id, tw, bags);
        Pickup storage pickup = Pickups[code];
        pickup.timestamp = time;
        pickup.c_id = c_id;
        pickup.f_id = f_id;
        pickup.coll_id = coll_id;
        pickup.tw = tw;
        pickup.bags = bags;

    }

    function updateFacilityRating(string memory code, uint f_rating, string memory f_review) public {

        Pickup storage pickup = Pickups[code];
        if (pickup.c_id == 0) return;

        emit updateFMRating(code, f_rating, f_review);

        pickup.f_rating = f_rating;

    }

    function updateCollectorRating(string memory code, uint coll_rating, string memory c_review) public {

        Pickup storage pickup = Pickups[code];

        if (pickup.c_id == 0) return;

        emit updateCollRating(code, coll_rating, c_review);

        pickup.coll_rating = coll_rating;

    }


}