// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Trading {
    struct Listing {
        address seller;
        address asset;
        uint256 price;
        bool isSold;
    }

    uint256 public listingCount;
    mapping(uint256 => Listing) public listings;

    event NewListing(uint256 indexed listingId, address indexed seller, address asset, uint256 price);
    event TradeCompleted(uint256 indexed listingId, address indexed buyer);

    function createListing(address _asset, uint256 _price) external {
        listingCount += 1;
        listings[listingCount] = Listing(msg.sender, _asset, _price, false);
        emit NewListing(listingCount, msg.sender, _asset, _price);
    }

    function buy(uint256 _listingId) external payable {
        Listing storage listing = listings[_listingId];
        require(!listing.isSold, "Listing already sold");
        require(msg.value >= listing.price, "Insufficient payment");

        listing.isSold = true;
        payable(listing.seller).transfer(listing.price);

        if (msg.value > listing.price) {
            // Refund the excess amount
            payable(msg.sender).transfer(msg.value - listing.price);
        }

        emit TradeCompleted(_listingId, msg.sender);
    }

    function getListing(uint256 _listingId) external view returns (Listing memory) {
        return listings[_listingId];
    }
}
