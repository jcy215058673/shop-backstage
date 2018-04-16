package com.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Product implements Serializable{
    private static final long serialVersionUID = -9015939873321965033L;
    private BigDecimal id;

    private Date createDate;

    private Date modifyDate;

    private Long allocatedStock;

    private String attributeValue0;

    private String attributeValue1;

    private String attributeValue10;

    private String attributeValue11;

    private String attributeValue12;

    private String attributeValue13;

    private String attributeValue14;

    private String attributeValue15;

    private String attributeValue16;

    private String attributeValue17;

    private String attributeValue18;

    private String attributeValue19;

    private String attributeValue2;

    private String attributeValue3;

    private String attributeValue4;

    private String attributeValue5;

    private String attributeValue6;

    private String attributeValue7;

    private String attributeValue8;

    private String attributeValue9;

    private BigDecimal cost;

    private String fullName;

    private BigDecimal hits;

    private String image;

    private Short isGift;

    private Short isList;

    private Short isMarketable;

    private Short isTop;

    private String keyword;

    private BigDecimal marketPrice;

    private String memo;

    private BigDecimal monthHits;

    private Date monthHitsDate;

    private BigDecimal monthSales;

    private Date monthSalesDate;

    private String name;

    private BigDecimal point;

    private BigDecimal price;

    private BigDecimal sales;

    private Double score;

    private BigDecimal scoreCount;

    private String seoDescription;

    private String seoKeywords;

    private String seoTitle;

    private String sn;

    private Long stock;

    private String stockMemo;

    private BigDecimal totalScore;

    private String unit;

    private BigDecimal weekHits;

    private Date weekHitsDate;

    private BigDecimal weekSales;

    private Date weekSalesDate;

    private Long weight;

    private BigDecimal brand;

    private BigDecimal goods;

    private BigDecimal productCategory;

    private String introduction;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public Long getAllocatedStock() {
        return allocatedStock;
    }

    public void setAllocatedStock(Long allocatedStock) {
        this.allocatedStock = allocatedStock;
    }

    public String getAttributeValue0() {
        return attributeValue0;
    }

    public void setAttributeValue0(String attributeValue0) {
        this.attributeValue0 = attributeValue0 == null ? null : attributeValue0.trim();
    }

    public String getAttributeValue1() {
        return attributeValue1;
    }

    public void setAttributeValue1(String attributeValue1) {
        this.attributeValue1 = attributeValue1 == null ? null : attributeValue1.trim();
    }

    public String getAttributeValue10() {
        return attributeValue10;
    }

    public void setAttributeValue10(String attributeValue10) {
        this.attributeValue10 = attributeValue10 == null ? null : attributeValue10.trim();
    }

    public String getAttributeValue11() {
        return attributeValue11;
    }

    public void setAttributeValue11(String attributeValue11) {
        this.attributeValue11 = attributeValue11 == null ? null : attributeValue11.trim();
    }

    public String getAttributeValue12() {
        return attributeValue12;
    }

    public void setAttributeValue12(String attributeValue12) {
        this.attributeValue12 = attributeValue12 == null ? null : attributeValue12.trim();
    }

    public String getAttributeValue13() {
        return attributeValue13;
    }

    public void setAttributeValue13(String attributeValue13) {
        this.attributeValue13 = attributeValue13 == null ? null : attributeValue13.trim();
    }

    public String getAttributeValue14() {
        return attributeValue14;
    }

    public void setAttributeValue14(String attributeValue14) {
        this.attributeValue14 = attributeValue14 == null ? null : attributeValue14.trim();
    }

    public String getAttributeValue15() {
        return attributeValue15;
    }

    public void setAttributeValue15(String attributeValue15) {
        this.attributeValue15 = attributeValue15 == null ? null : attributeValue15.trim();
    }

    public String getAttributeValue16() {
        return attributeValue16;
    }

    public void setAttributeValue16(String attributeValue16) {
        this.attributeValue16 = attributeValue16 == null ? null : attributeValue16.trim();
    }

    public String getAttributeValue17() {
        return attributeValue17;
    }

    public void setAttributeValue17(String attributeValue17) {
        this.attributeValue17 = attributeValue17 == null ? null : attributeValue17.trim();
    }

    public String getAttributeValue18() {
        return attributeValue18;
    }

    public void setAttributeValue18(String attributeValue18) {
        this.attributeValue18 = attributeValue18 == null ? null : attributeValue18.trim();
    }

    public String getAttributeValue19() {
        return attributeValue19;
    }

    public void setAttributeValue19(String attributeValue19) {
        this.attributeValue19 = attributeValue19 == null ? null : attributeValue19.trim();
    }

    public String getAttributeValue2() {
        return attributeValue2;
    }

    public void setAttributeValue2(String attributeValue2) {
        this.attributeValue2 = attributeValue2 == null ? null : attributeValue2.trim();
    }

    public String getAttributeValue3() {
        return attributeValue3;
    }

    public void setAttributeValue3(String attributeValue3) {
        this.attributeValue3 = attributeValue3 == null ? null : attributeValue3.trim();
    }

    public String getAttributeValue4() {
        return attributeValue4;
    }

    public void setAttributeValue4(String attributeValue4) {
        this.attributeValue4 = attributeValue4 == null ? null : attributeValue4.trim();
    }

    public String getAttributeValue5() {
        return attributeValue5;
    }

    public void setAttributeValue5(String attributeValue5) {
        this.attributeValue5 = attributeValue5 == null ? null : attributeValue5.trim();
    }

    public String getAttributeValue6() {
        return attributeValue6;
    }

    public void setAttributeValue6(String attributeValue6) {
        this.attributeValue6 = attributeValue6 == null ? null : attributeValue6.trim();
    }

    public String getAttributeValue7() {
        return attributeValue7;
    }

    public void setAttributeValue7(String attributeValue7) {
        this.attributeValue7 = attributeValue7 == null ? null : attributeValue7.trim();
    }

    public String getAttributeValue8() {
        return attributeValue8;
    }

    public void setAttributeValue8(String attributeValue8) {
        this.attributeValue8 = attributeValue8 == null ? null : attributeValue8.trim();
    }

    public String getAttributeValue9() {
        return attributeValue9;
    }

    public void setAttributeValue9(String attributeValue9) {
        this.attributeValue9 = attributeValue9 == null ? null : attributeValue9.trim();
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName == null ? null : fullName.trim();
    }

    public BigDecimal getHits() {
        return hits;
    }

    public void setHits(BigDecimal hits) {
        this.hits = hits;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Short getIsGift() {
        return isGift;
    }

    public void setIsGift(Short isGift) {
        this.isGift = isGift;
    }

    public Short getIsList() {
        return isList;
    }

    public void setIsList(Short isList) {
        this.isList = isList;
    }

    public Short getIsMarketable() {
        return isMarketable;
    }

    public void setIsMarketable(Short isMarketable) {
        this.isMarketable = isMarketable;
    }

    public Short getIsTop() {
        return isTop;
    }

    public void setIsTop(Short isTop) {
        this.isTop = isTop;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public BigDecimal getMonthHits() {
        return monthHits;
    }

    public void setMonthHits(BigDecimal monthHits) {
        this.monthHits = monthHits;
    }

    public Date getMonthHitsDate() {
        return monthHitsDate;
    }

    public void setMonthHitsDate(Date monthHitsDate) {
        this.monthHitsDate = monthHitsDate;
    }

    public BigDecimal getMonthSales() {
        return monthSales;
    }

    public void setMonthSales(BigDecimal monthSales) {
        this.monthSales = monthSales;
    }

    public Date getMonthSalesDate() {
        return monthSalesDate;
    }

    public void setMonthSalesDate(Date monthSalesDate) {
        this.monthSalesDate = monthSalesDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public BigDecimal getPoint() {
        return point;
    }

    public void setPoint(BigDecimal point) {
        this.point = point;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getSales() {
        return sales;
    }

    public void setSales(BigDecimal sales) {
        this.sales = sales;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public BigDecimal getScoreCount() {
        return scoreCount;
    }

    public void setScoreCount(BigDecimal scoreCount) {
        this.scoreCount = scoreCount;
    }

    public String getSeoDescription() {
        return seoDescription;
    }

    public void setSeoDescription(String seoDescription) {
        this.seoDescription = seoDescription == null ? null : seoDescription.trim();
    }

    public String getSeoKeywords() {
        return seoKeywords;
    }

    public void setSeoKeywords(String seoKeywords) {
        this.seoKeywords = seoKeywords == null ? null : seoKeywords.trim();
    }

    public String getSeoTitle() {
        return seoTitle;
    }

    public void setSeoTitle(String seoTitle) {
        this.seoTitle = seoTitle == null ? null : seoTitle.trim();
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public Long getStock() {
        return stock;
    }

    public void setStock(Long stock) {
        this.stock = stock;
    }

    public String getStockMemo() {
        return stockMemo;
    }

    public void setStockMemo(String stockMemo) {
        this.stockMemo = stockMemo == null ? null : stockMemo.trim();
    }

    public BigDecimal getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(BigDecimal totalScore) {
        this.totalScore = totalScore;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public BigDecimal getWeekHits() {
        return weekHits;
    }

    public void setWeekHits(BigDecimal weekHits) {
        this.weekHits = weekHits;
    }

    public Date getWeekHitsDate() {
        return weekHitsDate;
    }

    public void setWeekHitsDate(Date weekHitsDate) {
        this.weekHitsDate = weekHitsDate;
    }

    public BigDecimal getWeekSales() {
        return weekSales;
    }

    public void setWeekSales(BigDecimal weekSales) {
        this.weekSales = weekSales;
    }

    public Date getWeekSalesDate() {
        return weekSalesDate;
    }

    public void setWeekSalesDate(Date weekSalesDate) {
        this.weekSalesDate = weekSalesDate;
    }

    public Long getWeight() {
        return weight;
    }

    public void setWeight(Long weight) {
        this.weight = weight;
    }

    public BigDecimal getBrand() {
        return brand;
    }

    public void setBrand(BigDecimal brand) {
        this.brand = brand;
    }

    public BigDecimal getGoods() {
        return goods;
    }

    public void setGoods(BigDecimal goods) {
        this.goods = goods;
    }

    public BigDecimal getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(BigDecimal productCategory) {
        this.productCategory = productCategory;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Product)) return false;

        Product product = (Product) o;

        if (!getId().equals(product.getId())) return false;
        if (getCreateDate() != null ? !getCreateDate().equals(product.getCreateDate()) : product.getCreateDate() != null)
            return false;
        if (getModifyDate() != null ? !getModifyDate().equals(product.getModifyDate()) : product.getModifyDate() != null)
            return false;
        if (getAllocatedStock() != null ? !getAllocatedStock().equals(product.getAllocatedStock()) : product.getAllocatedStock() != null)
            return false;
        if (getAttributeValue0() != null ? !getAttributeValue0().equals(product.getAttributeValue0()) : product.getAttributeValue0() != null)
            return false;
        if (getAttributeValue1() != null ? !getAttributeValue1().equals(product.getAttributeValue1()) : product.getAttributeValue1() != null)
            return false;
        if (getAttributeValue10() != null ? !getAttributeValue10().equals(product.getAttributeValue10()) : product.getAttributeValue10() != null)
            return false;
        if (getAttributeValue11() != null ? !getAttributeValue11().equals(product.getAttributeValue11()) : product.getAttributeValue11() != null)
            return false;
        if (getAttributeValue12() != null ? !getAttributeValue12().equals(product.getAttributeValue12()) : product.getAttributeValue12() != null)
            return false;
        if (getAttributeValue13() != null ? !getAttributeValue13().equals(product.getAttributeValue13()) : product.getAttributeValue13() != null)
            return false;
        if (getAttributeValue14() != null ? !getAttributeValue14().equals(product.getAttributeValue14()) : product.getAttributeValue14() != null)
            return false;
        if (getAttributeValue15() != null ? !getAttributeValue15().equals(product.getAttributeValue15()) : product.getAttributeValue15() != null)
            return false;
        if (getAttributeValue16() != null ? !getAttributeValue16().equals(product.getAttributeValue16()) : product.getAttributeValue16() != null)
            return false;
        if (getAttributeValue17() != null ? !getAttributeValue17().equals(product.getAttributeValue17()) : product.getAttributeValue17() != null)
            return false;
        if (getAttributeValue18() != null ? !getAttributeValue18().equals(product.getAttributeValue18()) : product.getAttributeValue18() != null)
            return false;
        if (getAttributeValue19() != null ? !getAttributeValue19().equals(product.getAttributeValue19()) : product.getAttributeValue19() != null)
            return false;
        if (getAttributeValue2() != null ? !getAttributeValue2().equals(product.getAttributeValue2()) : product.getAttributeValue2() != null)
            return false;
        if (getAttributeValue3() != null ? !getAttributeValue3().equals(product.getAttributeValue3()) : product.getAttributeValue3() != null)
            return false;
        if (getAttributeValue4() != null ? !getAttributeValue4().equals(product.getAttributeValue4()) : product.getAttributeValue4() != null)
            return false;
        if (getAttributeValue5() != null ? !getAttributeValue5().equals(product.getAttributeValue5()) : product.getAttributeValue5() != null)
            return false;
        if (getAttributeValue6() != null ? !getAttributeValue6().equals(product.getAttributeValue6()) : product.getAttributeValue6() != null)
            return false;
        if (getAttributeValue7() != null ? !getAttributeValue7().equals(product.getAttributeValue7()) : product.getAttributeValue7() != null)
            return false;
        if (getAttributeValue8() != null ? !getAttributeValue8().equals(product.getAttributeValue8()) : product.getAttributeValue8() != null)
            return false;
        if (getAttributeValue9() != null ? !getAttributeValue9().equals(product.getAttributeValue9()) : product.getAttributeValue9() != null)
            return false;
        if (getCost() != null ? !getCost().equals(product.getCost()) : product.getCost() != null) return false;
        if (getFullName() != null ? !getFullName().equals(product.getFullName()) : product.getFullName() != null)
            return false;
        if (getHits() != null ? !getHits().equals(product.getHits()) : product.getHits() != null) return false;
        if (getImage() != null ? !getImage().equals(product.getImage()) : product.getImage() != null) return false;
        if (getIsGift() != null ? !getIsGift().equals(product.getIsGift()) : product.getIsGift() != null) return false;
        if (getIsList() != null ? !getIsList().equals(product.getIsList()) : product.getIsList() != null) return false;
        if (getIsMarketable() != null ? !getIsMarketable().equals(product.getIsMarketable()) : product.getIsMarketable() != null)
            return false;
        if (getIsTop() != null ? !getIsTop().equals(product.getIsTop()) : product.getIsTop() != null) return false;
        if (getKeyword() != null ? !getKeyword().equals(product.getKeyword()) : product.getKeyword() != null)
            return false;
        if (getMarketPrice() != null ? !getMarketPrice().equals(product.getMarketPrice()) : product.getMarketPrice() != null)
            return false;
        if (getMemo() != null ? !getMemo().equals(product.getMemo()) : product.getMemo() != null) return false;
        if (getMonthHits() != null ? !getMonthHits().equals(product.getMonthHits()) : product.getMonthHits() != null)
            return false;
        if (getMonthHitsDate() != null ? !getMonthHitsDate().equals(product.getMonthHitsDate()) : product.getMonthHitsDate() != null)
            return false;
        if (getMonthSales() != null ? !getMonthSales().equals(product.getMonthSales()) : product.getMonthSales() != null)
            return false;
        if (getMonthSalesDate() != null ? !getMonthSalesDate().equals(product.getMonthSalesDate()) : product.getMonthSalesDate() != null)
            return false;
        if (getName() != null ? !getName().equals(product.getName()) : product.getName() != null) return false;
        if (getPoint() != null ? !getPoint().equals(product.getPoint()) : product.getPoint() != null) return false;
        if (getPrice() != null ? !getPrice().equals(product.getPrice()) : product.getPrice() != null) return false;
        if (getSales() != null ? !getSales().equals(product.getSales()) : product.getSales() != null) return false;
        if (getScore() != null ? !getScore().equals(product.getScore()) : product.getScore() != null) return false;
        if (getScoreCount() != null ? !getScoreCount().equals(product.getScoreCount()) : product.getScoreCount() != null)
            return false;
        if (getSeoDescription() != null ? !getSeoDescription().equals(product.getSeoDescription()) : product.getSeoDescription() != null)
            return false;
        if (getSeoKeywords() != null ? !getSeoKeywords().equals(product.getSeoKeywords()) : product.getSeoKeywords() != null)
            return false;
        if (getSeoTitle() != null ? !getSeoTitle().equals(product.getSeoTitle()) : product.getSeoTitle() != null)
            return false;
        if (getSn() != null ? !getSn().equals(product.getSn()) : product.getSn() != null) return false;
        if (getStock() != null ? !getStock().equals(product.getStock()) : product.getStock() != null) return false;
        if (getStockMemo() != null ? !getStockMemo().equals(product.getStockMemo()) : product.getStockMemo() != null)
            return false;
        if (getTotalScore() != null ? !getTotalScore().equals(product.getTotalScore()) : product.getTotalScore() != null)
            return false;
        if (getUnit() != null ? !getUnit().equals(product.getUnit()) : product.getUnit() != null) return false;
        if (getWeekHits() != null ? !getWeekHits().equals(product.getWeekHits()) : product.getWeekHits() != null)
            return false;
        if (getWeekHitsDate() != null ? !getWeekHitsDate().equals(product.getWeekHitsDate()) : product.getWeekHitsDate() != null)
            return false;
        if (getWeekSales() != null ? !getWeekSales().equals(product.getWeekSales()) : product.getWeekSales() != null)
            return false;
        if (getWeekSalesDate() != null ? !getWeekSalesDate().equals(product.getWeekSalesDate()) : product.getWeekSalesDate() != null)
            return false;
        if (getWeight() != null ? !getWeight().equals(product.getWeight()) : product.getWeight() != null) return false;
        if (getBrand() != null ? !getBrand().equals(product.getBrand()) : product.getBrand() != null) return false;
        if (getGoods() != null ? !getGoods().equals(product.getGoods()) : product.getGoods() != null) return false;
        if (getProductCategory() != null ? !getProductCategory().equals(product.getProductCategory()) : product.getProductCategory() != null)
            return false;
        return getIntroduction() != null ? getIntroduction().equals(product.getIntroduction()) : product.getIntroduction() == null;

    }

    @Override
    public int hashCode() {
        int result = getId().hashCode();
        result = 31 * result + (getCreateDate() != null ? getCreateDate().hashCode() : 0);
        result = 31 * result + (getModifyDate() != null ? getModifyDate().hashCode() : 0);
        result = 31 * result + (getAllocatedStock() != null ? getAllocatedStock().hashCode() : 0);
        result = 31 * result + (getAttributeValue0() != null ? getAttributeValue0().hashCode() : 0);
        result = 31 * result + (getAttributeValue1() != null ? getAttributeValue1().hashCode() : 0);
        result = 31 * result + (getAttributeValue10() != null ? getAttributeValue10().hashCode() : 0);
        result = 31 * result + (getAttributeValue11() != null ? getAttributeValue11().hashCode() : 0);
        result = 31 * result + (getAttributeValue12() != null ? getAttributeValue12().hashCode() : 0);
        result = 31 * result + (getAttributeValue13() != null ? getAttributeValue13().hashCode() : 0);
        result = 31 * result + (getAttributeValue14() != null ? getAttributeValue14().hashCode() : 0);
        result = 31 * result + (getAttributeValue15() != null ? getAttributeValue15().hashCode() : 0);
        result = 31 * result + (getAttributeValue16() != null ? getAttributeValue16().hashCode() : 0);
        result = 31 * result + (getAttributeValue17() != null ? getAttributeValue17().hashCode() : 0);
        result = 31 * result + (getAttributeValue18() != null ? getAttributeValue18().hashCode() : 0);
        result = 31 * result + (getAttributeValue19() != null ? getAttributeValue19().hashCode() : 0);
        result = 31 * result + (getAttributeValue2() != null ? getAttributeValue2().hashCode() : 0);
        result = 31 * result + (getAttributeValue3() != null ? getAttributeValue3().hashCode() : 0);
        result = 31 * result + (getAttributeValue4() != null ? getAttributeValue4().hashCode() : 0);
        result = 31 * result + (getAttributeValue5() != null ? getAttributeValue5().hashCode() : 0);
        result = 31 * result + (getAttributeValue6() != null ? getAttributeValue6().hashCode() : 0);
        result = 31 * result + (getAttributeValue7() != null ? getAttributeValue7().hashCode() : 0);
        result = 31 * result + (getAttributeValue8() != null ? getAttributeValue8().hashCode() : 0);
        result = 31 * result + (getAttributeValue9() != null ? getAttributeValue9().hashCode() : 0);
        result = 31 * result + (getCost() != null ? getCost().hashCode() : 0);
        result = 31 * result + (getFullName() != null ? getFullName().hashCode() : 0);
        result = 31 * result + (getHits() != null ? getHits().hashCode() : 0);
        result = 31 * result + (getImage() != null ? getImage().hashCode() : 0);
        result = 31 * result + (getIsGift() != null ? getIsGift().hashCode() : 0);
        result = 31 * result + (getIsList() != null ? getIsList().hashCode() : 0);
        result = 31 * result + (getIsMarketable() != null ? getIsMarketable().hashCode() : 0);
        result = 31 * result + (getIsTop() != null ? getIsTop().hashCode() : 0);
        result = 31 * result + (getKeyword() != null ? getKeyword().hashCode() : 0);
        result = 31 * result + (getMarketPrice() != null ? getMarketPrice().hashCode() : 0);
        result = 31 * result + (getMemo() != null ? getMemo().hashCode() : 0);
        result = 31 * result + (getMonthHits() != null ? getMonthHits().hashCode() : 0);
        result = 31 * result + (getMonthHitsDate() != null ? getMonthHitsDate().hashCode() : 0);
        result = 31 * result + (getMonthSales() != null ? getMonthSales().hashCode() : 0);
        result = 31 * result + (getMonthSalesDate() != null ? getMonthSalesDate().hashCode() : 0);
        result = 31 * result + (getName() != null ? getName().hashCode() : 0);
        result = 31 * result + (getPoint() != null ? getPoint().hashCode() : 0);
        result = 31 * result + (getPrice() != null ? getPrice().hashCode() : 0);
        result = 31 * result + (getSales() != null ? getSales().hashCode() : 0);
        result = 31 * result + (getScore() != null ? getScore().hashCode() : 0);
        result = 31 * result + (getScoreCount() != null ? getScoreCount().hashCode() : 0);
        result = 31 * result + (getSeoDescription() != null ? getSeoDescription().hashCode() : 0);
        result = 31 * result + (getSeoKeywords() != null ? getSeoKeywords().hashCode() : 0);
        result = 31 * result + (getSeoTitle() != null ? getSeoTitle().hashCode() : 0);
        result = 31 * result + (getSn() != null ? getSn().hashCode() : 0);
        result = 31 * result + (getStock() != null ? getStock().hashCode() : 0);
        result = 31 * result + (getStockMemo() != null ? getStockMemo().hashCode() : 0);
        result = 31 * result + (getTotalScore() != null ? getTotalScore().hashCode() : 0);
        result = 31 * result + (getUnit() != null ? getUnit().hashCode() : 0);
        result = 31 * result + (getWeekHits() != null ? getWeekHits().hashCode() : 0);
        result = 31 * result + (getWeekHitsDate() != null ? getWeekHitsDate().hashCode() : 0);
        result = 31 * result + (getWeekSales() != null ? getWeekSales().hashCode() : 0);
        result = 31 * result + (getWeekSalesDate() != null ? getWeekSalesDate().hashCode() : 0);
        result = 31 * result + (getWeight() != null ? getWeight().hashCode() : 0);
        result = 31 * result + (getBrand() != null ? getBrand().hashCode() : 0);
        result = 31 * result + (getGoods() != null ? getGoods().hashCode() : 0);
        result = 31 * result + (getProductCategory() != null ? getProductCategory().hashCode() : 0);
        result = 31 * result + (getIntroduction() != null ? getIntroduction().hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", createDate=" + createDate +
                ", modifyDate=" + modifyDate +
                ", allocatedStock=" + allocatedStock +
                ", attributeValue0='" + attributeValue0 + '\'' +
                ", attributeValue1='" + attributeValue1 + '\'' +
                ", attributeValue10='" + attributeValue10 + '\'' +
                ", attributeValue11='" + attributeValue11 + '\'' +
                ", attributeValue12='" + attributeValue12 + '\'' +
                ", attributeValue13='" + attributeValue13 + '\'' +
                ", attributeValue14='" + attributeValue14 + '\'' +
                ", attributeValue15='" + attributeValue15 + '\'' +
                ", attributeValue16='" + attributeValue16 + '\'' +
                ", attributeValue17='" + attributeValue17 + '\'' +
                ", attributeValue18='" + attributeValue18 + '\'' +
                ", attributeValue19='" + attributeValue19 + '\'' +
                ", attributeValue2='" + attributeValue2 + '\'' +
                ", attributeValue3='" + attributeValue3 + '\'' +
                ", attributeValue4='" + attributeValue4 + '\'' +
                ", attributeValue5='" + attributeValue5 + '\'' +
                ", attributeValue6='" + attributeValue6 + '\'' +
                ", attributeValue7='" + attributeValue7 + '\'' +
                ", attributeValue8='" + attributeValue8 + '\'' +
                ", attributeValue9='" + attributeValue9 + '\'' +
                ", cost=" + cost +
                ", fullName='" + fullName + '\'' +
                ", hits=" + hits +
                ", image='" + image + '\'' +
                ", isGift=" + isGift +
                ", isList=" + isList +
                ", isMarketable=" + isMarketable +
                ", isTop=" + isTop +
                ", keyword='" + keyword + '\'' +
                ", marketPrice=" + marketPrice +
                ", memo='" + memo + '\'' +
                ", monthHits=" + monthHits +
                ", monthHitsDate=" + monthHitsDate +
                ", monthSales=" + monthSales +
                ", monthSalesDate=" + monthSalesDate +
                ", name='" + name + '\'' +
                ", point=" + point +
                ", price=" + price +
                ", sales=" + sales +
                ", score=" + score +
                ", scoreCount=" + scoreCount +
                ", seoDescription='" + seoDescription + '\'' +
                ", seoKeywords='" + seoKeywords + '\'' +
                ", seoTitle='" + seoTitle + '\'' +
                ", sn='" + sn + '\'' +
                ", stock=" + stock +
                ", stockMemo='" + stockMemo + '\'' +
                ", totalScore=" + totalScore +
                ", unit='" + unit + '\'' +
                ", weekHits=" + weekHits +
                ", weekHitsDate=" + weekHitsDate +
                ", weekSales=" + weekSales +
                ", weekSalesDate=" + weekSalesDate +
                ", weight=" + weight +
                ", brand=" + brand +
                ", goods=" + goods +
                ", productCategory=" + productCategory +
                ", introduction='" + introduction + '\'' +
                '}';
    }
}