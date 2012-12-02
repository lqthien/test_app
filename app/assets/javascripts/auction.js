function addAuctionRule() {
  ruleIndex = $(".auction-rule").length - 1
  $(".auction-rule:first").clone().insertBefore("#rule-add");
  rule = $(".auction-rule:last");
  $(rule).find(".bid_from").attr("name", "auction[auction_rules_attributes][" + ruleIndex + "][bid_from]");
  $(rule).find(".bid_to").attr("name", "auction[auction_rules_attributes][" + ruleIndex + "][bid_to]");
  $(rule).find(".bid_step").attr("name", "auction[auction_rules_attributes][" + ruleIndex + "][bid_step]");
  $(rule).find(".bid_percent").attr("name", "auction[auction_rules_attributes][" + ruleIndex + "][percent]");
}

function addAuctionItem() {
  itemIndex = $(".auction-item").length - 1
  $(".auction-item:first").clone().insertBefore("#item-add");
  item = $(".auction-item:last");
  $(item).find(".item_code").attr("name", "auction[auction_items_attributes][" + itemIndex + "][code]");
  $(item).find(".item_name").attr("name", "auction[auction_items_attributes][" + itemIndex + "][name]");
  $(item).find(".item_link").attr("name", "auction[auction_items_attributes][" + itemIndex + "][link]");
  $(item).find(".item_start").attr("name", "auction[auction_items_attributes][" + itemIndex + "][start_bid]");
  $(item).find(".item_start").val(0);
}

function deleteRule(rule) {
  $(rule).parent().remove();
  $(".auction-rule").not(".auction-rule:first").each(function(index, value) {
    index += 1;
    $(value).find(".bid_from").attr("name", "auction[auction_rules_attributes][" + index + "][bid_from]");
    $(value).find(".bid_to").attr("name", "auction[auction_rules_attributes][" + index + "][bid_to]");
    $(value).find(".bid_step").attr("name", "auction[auction_rules_attributes][" + index + "][bid_step]");
    $(value).find(".bid_percent").attr("name", "auction[auction_rules_attributes][" + index + "][percent]");
  });
}

function deleteItem(item) {
  $(item).parent().remove();
  $(".auction-item").not(".auction-item:first").each(function(index, value) {
    index += 1;
    $(value).find(".item_code").attr("name", "auction[auction_items_attributes][" + index + "][code]");
    $(value).find(".item_name").attr("name", "auction[auction_items_attributes][" + index + "][name]");
    $(value).find(".item_link").attr("name", "auction[auction_items_attributes][" + index + "][link]");
    $(value).find(".item_start").attr("name", "auction[auction_items_attributes][" + index + "][start_bid]");
  });
}

function checkValidRules() {
  var currentAmount = 0;
  var validRules = true;
  $(".auction-rule").not(".auction-rule:first").each(function(index, value) {
    from = parseInt($(value).find(".bid_from").val());
    to = parseInt($(value).find(".bid_to").val());
    step = parseInt($(value).find(".bid_step").val());
    $(value).css("background", "red");
    if(isNaN(from) || isNaN(to) || isNaN(step)) {
      alert("Invalid number");
      validRules = false;
      return false;
    }
    if(step <= 0) {
      alert("Increment must be greater than 0");
      validRules = false;
      return false;
    }
    percent = $(value).find(".bid_percent").attr("checked") == "checked";
    if(currentAmount == 0) {
      if(from != 0) {
        alert("Rule start with 0");
        validRules = false;
        return false;
      }
    } else {
      if(from != currentAmount + 1) {
        alert("From must be greater than previous to by 1");
        validRules = false;
        return false;
      }
    }
    if(to <= from) {
      if(index < $(".auction-rule").length - 2) {
        alert("To must be greater than or equal to from");
        validRules = false;
        return false;
      }
    }
    currentAmount = to;
    $(value).css("background", "");
  });
  return validRules;
}

function checkValidItems() {
  var validItems = true;
  $(".auction-item").not(".auction-item:first").each(function(index, value) {
    code = $(value).find(".item_code").val();
    name = $(value).find(".item_name").val();
    link = $(value).find(".item_link").val();
    start = parseInt($(value).find(".item_start").val());
    $(value).css("background", "red");
    if(code == "" || name == "" || link == "") {
      alert("Item has blank fields");
      validItems = false;
      return false;
    }
    if(isNaN(start) || start < 0) {
      alert("Invalid start bid");
      validItems = false;
      return false;
    }
    $(value).css("background", "");
  });
  return validItems;
}

function generateItemCodes() {
  if(window.confirm("Existing codes will be overwritten!")) {
    $(".auction-item").not(".auction-item:first").each(function(index, value) {
      $(value).find(".item_code").val("I" + formatItemCode(index + 1));
    });
  }
}

function formatItemCode(i) {
  if(i < 10) {
    return "0" + i;
  } else {
    return i;
  }
}

function sameItemStart() {
  start = window.prompt("Enter start bid for all items", "0");
  $(".auction-item").not(".auction-item:first").each(function(index, value) {
    $(value).find(".item_start").val(start);
  });
}

function placeBid(element, id) {
  $.ajax({
    url: "/auction/bid",
    type: "POST",
    data: {
      item_id: id,
      amount: $(element).prev().val()
    }
  });
}

function deleteAuction(id) {
  pass = window.prompt("Enter the password of the auction");
  $.ajax({
    url: "/auction/delete",
    type: "POST",
    data: {
      id: id,
      pass: pass
    }
  });
}