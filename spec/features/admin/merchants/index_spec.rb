require 'rails_helper'
require 'rspec'

describe "the admin/merchants index page" do
  before (:each) do
    @targay = Merchant.create!(name: "Targay", status: 1)
    @walbart = Merchant.create!(name: "Walbart", status: 1)
    @sauer = Merchant.create!(name: "Sauer and Sons", status: 0)
    @piggy = Merchant.create(name: "Wiggly-Piggly", status: 1)
    @dave = Merchant.create(name: "Davers", status: 1)

    @date1 = "2019-02-08 09:54:09 UTC".to_datetime
    @date2 = "2020-04-08 09:54:09 UTC".to_datetime
    @date3 = "2021-03-08 09:54:09 UTC".to_datetime
    @date4 = "2020-07-08 09:54:09 UTC".to_datetime
    @date5 = "2020-09-08 09:54:09 UTC".to_datetime

    @joseph = Customer.create(first_name: "Joseph", last_name: "D")

    @spoon1 = @walbart.items.create(name: "Spoon", description: "spoon", unit_price: 5)
    @fork1 = @walbart.items.create(name: "Fork", description: "fork", unit_price: 5)
    @knife1 = @walbart.items.create(name: "Knife", description: "knife", unit_price: 5)
    @spork1 = @walbart.items.create(name: "Spork", description: "spork", unit_price: 10)

    @invoice_i = @joseph.invoices.create(status: 1, created_at: @date1)

    @ii1 = InvoiceItem.create(item_id: @spoon1.id, invoice_id: @invoice_i.id, quantity: 5, status: 2, unit_price: 100) #500
    @ii2 = InvoiceItem.create(item_id: @fork1.id, invoice_id: @invoice_i.id, quantity: 5, status: 2, unit_price: 100) #500
    @ii3 = InvoiceItem.create(item_id: @knife1.id, invoice_id: @invoice_i.id, quantity: 5, status: 2, unit_price: 100) #500
    @ii4 = InvoiceItem.create(item_id: @spork1.id, invoice_id: @invoice_i.id, quantity: 5, status: 2, unit_price: 100) #500
#2000
    @tr_1 = @invoice_i.transactions.create(credit_card_number: 98765544, credit_card_expiration_date: 675645, result: "success")

    @spoon2 = @targay.items.create(name: "Spoon", description: "spoon", unit_price: 5)
    @fork2 = @targay.items.create(name: "Fork", description: "fork", unit_price: 5)
    @knife2 = @targay.items.create(name: "Knife", description: "knife", unit_price: 5)
    @spork2 = @targay.items.create(name: "Spork", description: "spork", unit_price: 10)

    @invoice_ii = @joseph.invoices.create(status: 1, created_at: @date2 )

    @ii5 = InvoiceItem.create(item_id: @spoon2.id, invoice_id: @invoice_ii.id, quantity: 5, status: 2, unit_price: 100) #500
    @ii6 = InvoiceItem.create(item_id: @fork2.id, invoice_id: @invoice_ii.id, quantity: 5, status: 2, unit_price: 200) #1000
    @ii7 = InvoiceItem.create(item_id: @knife2.id, invoice_id: @invoice_ii.id, quantity: 5, status: 2, unit_price: 100) #500
    @ii8 = InvoiceItem.create(item_id: @spork2.id, invoice_id: @invoice_ii.id, quantity: 5, status: 2, unit_price: 200) #1000
#3000
    @tr_2 = @invoice_ii.transactions.create(credit_card_number: 98765544, credit_card_expiration_date: 675645, result: "success")

    @spoon3 = @sauer.items.create(name: "Spoon", description: "spoon", unit_price: 5)
    @fork3 = @sauer.items.create(name: "Fork", description: "fork", unit_price: 5)
    @knife3 = @sauer.items.create(name: "Knife", description: "knife", unit_price: 5)
    @spork3 = @sauer.items.create(name: "Spork", description: "spork", unit_price: 10)

    @invoice_iii = @joseph.invoices.create(status: 1, created_at: @date3)

    @ii9 = InvoiceItem.create(item_id: @spoon3.id, invoice_id: @invoice_iii.id, quantity: 5, status: 2, unit_price: 50) #250
    @ii10 = InvoiceItem.create(item_id: @fork3.id, invoice_id: @invoice_iii.id, quantity: 5, status: 2, unit_price: 100) #500
    @ii11= InvoiceItem.create(item_id: @knife3.id, invoice_id: @invoice_iii.id, quantity: 5, status: 2, unit_price: 600) #3000
    @ii12= InvoiceItem.create(item_id: @spork3.id, invoice_id: @invoice_iii.id, quantity: 5, status: 2, unit_price: 100) #500
#4250
    @tr_3 = @invoice_iii.transactions.create(credit_card_number: 98765544, credit_card_expiration_date: 675645, result: "success")

    @spoon4 = @piggy.items.create(name: "Spoon", description: "spoon", unit_price: 5)
    @fork4 = @piggy.items.create(name: "Fork", description: "fork", unit_price: 5)
    @knife4 = @piggy.items.create(name: "Knife", description: "knife", unit_price: 5)
    @spork4 = @piggy.items.create(name: "Spork", description: "spork", unit_price: 10)

    @invoice_iv = @joseph.invoices.create(status: 1, created_at: @date4)

    @ii13 = InvoiceItem.create(item_id: @spoon4.id, invoice_id: @invoice_iv.id, quantity: 5, status: 2, unit_price: 200) #1000
    @ii14 = InvoiceItem.create(item_id: @fork4.id, invoice_id: @invoice_iv.id, quantity: 5, status: 2, unit_price: 200) #1000
    @ii15 = InvoiceItem.create(item_id: @knife4.id, invoice_id: @invoice_iv.id, quantity: 5, status: 2, unit_price: 200) #1000
    @ii16 = InvoiceItem.create(item_id: @spork4.id, invoice_id: @invoice_iv.id, quantity: 5, status: 2, unit_price: 200) #1000
#4000
    @tr_4 = @invoice_iv.transactions.create(credit_card_number: 98765544, credit_card_expiration_date: 675645, result: "success")

    @spoon5 = @dave.items.create(name: "Spoon", description: "spoon", unit_price: 5)
    @fork5 = @dave.items.create(name: "Fork", description: "fork", unit_price: 5)
    @knife5 = @dave.items.create(name: "Knife", description: "knife", unit_price: 5)
    @spork5 = @dave.items.create(name: "Spork", description: "spork", unit_price: 10)

    @invoice_v = @joseph.invoices.create(status: 1, created_at: @date5)

    @ii17 = InvoiceItem.create(item_id: @spoon5.id, invoice_id: @invoice_v.id, quantity: 5, status: 2, unit_price: 300) #1500
    @ii18 = InvoiceItem.create(item_id: @fork5.id, invoice_id: @invoice_v.id, quantity: 5, status: 2, unit_price: 300) #1500
    @ii19 = InvoiceItem.create(item_id: @knife5.id, invoice_id: @invoice_v.id, quantity: 5, status: 2, unit_price: 100) #500
    @ii20 = InvoiceItem.create(item_id: @spork5.id, invoice_id: @invoice_v.id, quantity: 5, status: 2, unit_price: 300) #1500
    #5000

    @tr_5 = @invoice_v.transactions.create(credit_card_number: 98765544, credit_card_expiration_date: 675645, result: "success")
  end

  describe "when I visit the admin/merchants index" do
    it "displays a list of all merchants" do
      visit "/admin/merchants"

      expect(page).to have_content("Targay")
      expect(page).to have_content("Walbart")
      expect(page).to have_content("Sauer and Sons")

    end

    it "has each name as a link to that show page" do
      visit "/admin/merchants"

      within("#merchant-#{@targay.id}") do
        click_on "Targay"
      end

      expect(current_path).to eq("/admin/merchants/#{@targay.id}")
      expect(page).to have_content("Targay")
    end

    it "displays a button to disable/enable merchant" do
      visit "/admin/merchants"

      expect(page).to have_button("Enable")
      expect(page).to have_button("Disable")
    end

    it "displays enabled merchants" do
      visit "/admin/merchants"

      within("#enabled_merchants") do
        expect(page).to have_content("Targay")
        expect(page).to have_content("Walbart")
        expect(page).to_not have_content("Sauer and Sons")
      end
    end

    it "displays disabled merchants" do
      visit "/admin/merchants"

      within("#disabled_merchants") do
        expect(page).to have_content("Sauer and Sons")
        expect(page).to_not have_content("Targay")
        expect(page).to_not have_content("Walbart")
      end
    end
  end

  describe "when I click the disable/enable button" do
    it "I am redirected back to the admin merchants index page" do
      visit "/admin/merchants"
      within("#merchant-#{@targay.id}") do
        click_on "Disable"
      end
      expect(current_path).to eq("/admin/merchants")
    end

    it "displays the merchants status has changed" do
      visit "/admin/merchants"

      within("#enabled_merchants") do
        expect(page).to have_content("Targay")
      end

      within("#disabled_merchants") do
        expect(page).to_not have_content("Targay")
      end

      within("#merchant-#{@targay.id}") do
        click_on "Disable"
      end

      within("#enabled_merchants") do
        expect(page).to_not have_content("Targay")
      end

      within("#disabled_merchants") do
        expect(page).to have_content("Targay")
      end
    end
  end

  describe "I see a link to create a new merchant" do
    it "takes me to a new page to fill out a form" do
      visit "/admin/merchants"

      click_on "Create New Merchant"

      expect(current_path).to eq("/admin/merchants/new")
    end

    it "allows me to create a new merchant" do
      visit "/admin/merchants"

      expect(page).to_not have_content("New merch")

      click_on "Create New Merchant"

      fill_in(:name, with: "New merch")

      click_on "Submit"

      expect(current_path).to eq("/admin/merchants")
      expect(page).to have_content("New merch")
      within("#disabled_merchants") do
        expect(page).to have_content("New merch")
      end
    end
  end

  describe "top selling date" do
    it "displays best date next to top 5 merchants" do

      visit "/admin/merchants"

      expect(@targay.best_date_formatted).to eq("Wednesday, April 08 2020")
      expect(page).to have_content("Top selling date was:")
      expect(page).to have_content("Wednesday, April 08 2020")
    end
  end
end

describe "The top 5" do
  describe "I see top 5 merchants" do
    before :each do
      @merchant1 = Merchant.create!(name: "Pabu")
      @merchant2 = Merchant.create!(name: "Loki")
      @merchant3 = Merchant.create!(name: "Thor")
      @merchant4 = Merchant.create!(name: "Ian")
      @merchant5 = Merchant.create!(name: "Joe")
      @merchant6 = Merchant.create!(name: "John")

      @item1 = @merchant1.items.create!(name: "Comic", description: "Spider-Man", unit_price: 200, status: 1)
      @item2 = @merchant2.items.create!(name: "Action figure", description: "Deku", unit_price: 800, status: 1)
      @item3 = @merchant2.items.create!(name: "One Piece", description: "Rare", unit_price: 500, status: 1)
      @item4 = @merchant3.items.create!(name: "Hunter card", description: "Useful", unit_price: 300, status: 1)
      @item5 = @merchant4.items.create!(name: "Kunai", description: "Minatos", unit_price: 100, status: 1)
      @item6 = @merchant5.items.create!(name: "ODM gear", description: "Advance technology", unit_price: 300, status: 1)
      @item7 = @merchant5.items.create!(name: "Zenitsu", description: "Awsome sword", unit_price: 500, status: 1)
      @item8 = @merchant6.items.create!(name: "Elucidator", description: "Kiritos sword", unit_price: 10, status: 1)

      @customer1 = Customer.create!(first_name: "Customer", last_name: "One")

      @invoice1 = @customer1.invoices.create!(status: 2)
      @invoice2 = @customer1.invoices.create!(status: 2)
      @invoice3 = @customer1.invoices.create!(status: 2)
      @invoice4 = @customer1.invoices.create!(status: 2)
      @invoice5 = @customer1.invoices.create!(status: 2)
      @invoice6 = @customer1.invoices.create!(status: 2)

      @ii1 = InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item1.id, quantity: 5, unit_price: 200, status: 1) # merch_1 ~ $10.00
      @ii2 = InvoiceItem.create!(invoice_id: @invoice2.id, item_id: @item2.id, quantity: 5, unit_price: 800, status: 1)
      @ii3 = InvoiceItem.create!(invoice_id: @invoice2.id, item_id: @item3.id, quantity: 5, unit_price: 500, status: 1) # merch_2 ~$65.00
      @ii4 = InvoiceItem.create!(invoice_id: @invoice3.id, item_id: @item4.id, quantity: 5, unit_price: 300, status: 1) # merch_3 ~$15.00
      @ii5 = InvoiceItem.create!(invoice_id: @invoice4.id, item_id: @item5.id, quantity: 5, unit_price: 500, status: 1) # merch_4 ~$25.00
      @ii6 = InvoiceItem.create!(invoice_id: @invoice5.id, item_id: @item6.id, quantity: 10, unit_price: 500, status: 1)
      @ii7 = InvoiceItem.create!(invoice_id: @invoice5.id, item_id: @item7.id, quantity: 10, unit_price: 500, status: 1) # merch_5 ~$100.00 NOT PROCESSED SUCCESSFULLY
      @ii8 = InvoiceItem.create!(invoice_id: @invoice6.id, item_id: @item8.id, quantity: 1, unit_price: 100, status: 1) # merch_6 ~$1.00

      @transaction1 = Transaction.create!(credit_card_number: 203942, result: 'success', invoice_id: @invoice1.id)
      @transaction2 = Transaction.create!(credit_card_number: 230948, result: 'success', invoice_id: @invoice2.id)
      @transaction3 = Transaction.create!(credit_card_number: 234092, result: 'success', invoice_id: @invoice3.id)
      @transaction4 = Transaction.create!(credit_card_number: 230429, result: 'success', invoice_id: @invoice4.id)
      @transaction5 = Transaction.create!(credit_card_number: 102938, result: 'failed', invoice_id: @invoice5.id)
      @transaction6 = Transaction.create!(credit_card_number: 879799, result: 'success', invoice_id: @invoice6.id)

      visit "/admin/merchants"
    end

    it 'lists merchants in correct order' do
      within("#top-5-merchants") do
        expect(@merchant2.name).to appear_before(@merchant4.name)
        expect(@merchant4.name).to appear_before(@merchant3.name)
        expect(@merchant3.name).to appear_before(@merchant1.name)
        expect(@merchant1.name).to appear_before(@merchant6.name)
        expect(page).to_not have_content(@merchant5.name)
      end
    end
    it 'has link to each merchant show page' do
      within("#merchant_top_5-#{@merchant1.id}") do
        click_link "#{@merchant1.name}"
        expect(current_path).to eq("/admin/merchants/#{@merchant1.id}")
      end
    end
    it 'shows total revenue next to each merchant' do
      within("#top-5-merchants") do
        expect(page).to have_content("$10.00")
        expect(page).to have_content("$65.00")
        expect(page).to have_content("$15.00")
        expect(page).to have_content("$25.00")
        expect(page).to have_content("$1.00")
      end
    end
  end
end
