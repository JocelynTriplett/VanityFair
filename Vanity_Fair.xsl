<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.filemaker.com/fmpxmlresult" xmlns:date="java:java.util.Date"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">
    <xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="default"
        indent="yes"/>
    <xsl:output method="text"/>
    <xsl:output method="xml" indent="yes" name="xml"/>


    <xsl:template match="/">
        <xsl:for-each select="/ss:Workbook/ss:Worksheet[1]/ss:Table[1]/ss:Row/ss:Cell[3]/ss:Data">
            <xsl:variable name="filename" select="concat(normalize-space(./text()),'.mods','.xml')"/>
            <xsl:value-of select="$filename"/>
            <!-- Creating  -->
            <xsl:result-document href="{$filename}" format="xml">
                <mods xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                    xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-3.xsd"
                    xmlns:mods="http://www.loc.gov/mods/v3" xmlns="http://www.loc.gov/mods/v3">
                    <!-- hand off processing of row to another template -->
                    <xsl:apply-templates select="./ancestor::ss:Row"/>
                </mods>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="ss:Row">
        <xsl:call-template name="title"/>
        <xsl:call-template name="name"/>
        <xsl:call-template name="typeOfResource"/>
        <xsl:call-template name="genre"/>
        <xsl:call-template name="originInfo"/>
        <xsl:call-template name="physicalDescription"/>
        <xsl:call-template name="abstract"/>
        <xsl:call-template name="note"/>
        <xsl:call-template name="subject"/>
        <xsl:for-each select="ss:Cell[8]/ss:Data/text()">
            <xsl:choose>
                <xsl:when test="contains(.,'Ambassador from England')">
                    <xsl:call-template name="Ambassador_from_England"/>
                </xsl:when>
                <xsl:when test="contains(.,'Ambassador to England')">
                    <xsl:call-template name="Ambassador_to_England"/>
                </xsl:when>
                <xsl:when test="contains(.,'Americans')">
                    <xsl:call-template name="Americans"/>
                </xsl:when>
                <xsl:when test="contains(.,'Architects and Engineers')">
                    <xsl:call-template name="Architects_and_Engineers"/>
                </xsl:when>
                <xsl:when test="contains(.,'Artists')">
                    <xsl:call-template name="Artists"/>
                </xsl:when>
                <xsl:when test="contains(.,'Aviators')">
                    <xsl:call-template name="Aviators"/>
                </xsl:when>
                <xsl:when test="contains(.,'Bankers and Financiers')">
                    <xsl:call-template name="Bankers_and_Financiers"/>
                </xsl:when>
                <xsl:when test="contains(.,'Businessmen and Empire Builders')">
                    <xsl:call-template name="Businessmen_and_Empire_Builders"/>
                </xsl:when>
                <xsl:when test="contains(.,'Chancellors of Exchequer')">
                    <xsl:call-template name="Chancellors_of_Exchequer"/>
                </xsl:when>
                <xsl:when test="contains(.,'Clergy')">
                    <xsl:call-template name="Clergy"/>
                </xsl:when>
                <xsl:when test="contains(.,'Doctors')">
                    <xsl:call-template name="Doctors_and_Scientists"/>
                </xsl:when>
                <xsl:when test="contains(.,'Explorers')">
                    <xsl:call-template name="Explorers_and_Inventors"/>
                </xsl:when>
                <xsl:when test="contains(.,'Freemasons')">
                    <xsl:call-template name="Freemasons"/>
                </xsl:when>
                <xsl:when test="contains(.,'Ladies')">
                    <xsl:call-template name="Ladies"/>
                </xsl:when>
                <xsl:when test="contains(.,'Legal')">
                    <xsl:call-template name="Legal"/>
                </xsl:when>
                <xsl:when test="contains(.,'Literary')">
                    <xsl:call-template name="Literary"/>
                </xsl:when>
                <xsl:when test="contains(.,'Military')">
                    <xsl:call-template name="Military_and_Navy"/>
                </xsl:when>
                <xsl:when test="contains(.,'Music')">
                    <xsl:call-template name="Music"/>
                </xsl:when>
                <xsl:when test="contains(.,'Newspapermen')">
                    <xsl:call-template name="Newspapermen"/>
                </xsl:when>
                <xsl:when test="contains(.,'Policemen')">
                    <xsl:call-template name="Policemen"/>
                </xsl:when>
                <xsl:when test="contains(.,'Politicians')">
                    <xsl:call-template name="Politicians"/>
                </xsl:when>
                <xsl:when test="contains(.,'Prime Ministers')">
                    <xsl:call-template name="Prime_Ministers"/>
                </xsl:when>
                <xsl:when test="contains(.,'Royalty')">
                    <xsl:call-template name="Royalty"/>
                </xsl:when>
                <xsl:when test="contains(.,'Politician')">
                    <xsl:call-template name="Politicians"/>
                </xsl:when>
                <xsl:when test="contains(.,'Fox Hunters')">
                    <xsl:call-template name="Fox_Hunters"/>
                </xsl:when>
                <xsl:when test="contains(.,'Horse Trainers')">
                    <xsl:call-template name="Horse_Trainers"/>
                </xsl:when>
                <xsl:when test="contains(.,'Stock Exchange Officials')">
                    <xsl:call-template name="Stock_Exchange_Officials"/>
                </xsl:when>
                <xsl:when test="contains(.,'Teachers')">
                    <xsl:call-template name="Teachers_and_Headmasters"/>
                </xsl:when>
                <xsl:when test="contains(.,'Theatre')">
                    <xsl:call-template name="Theatre"/>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
        <xsl:call-template name="relatedItem"/>
        <xsl:call-template name="identifier"/>
        <xsl:call-template name="location"/>
        <xsl:call-template name="recordInfo"/>
    </xsl:template>

    <xsl:template name="title">
        <xsl:for-each select="ss:Cell[5]/ss:Data">
            <xsl:element name="titleInfo" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:element name="title" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="text()"/>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="name">
        <xsl:for-each select="ss:Cell[13]/ss:Data">
            <xsl:element name="name" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:variable name="dates">
                    <xsl:if
                        test="../../ss:Cell[14]/ss:Data[1]/text() and ../../ss:Cell[15]/ss:Data[1]/text()">
                        <xsl:value-of
                            select="concat(', ',../../ss:Cell[14]/ss:Data[1]/text(),' - ',../../ss:Cell[15]/ss:Data[1]/text())"
                        />
                    </xsl:if>
                </xsl:variable>
                <xsl:attribute name="authority">
                    <xsl:value-of>naf</xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="type">
                    <xsl:value-of>personal</xsl:value-of>
                </xsl:attribute>
                <xsl:element name="namePart" inherit-namespaces="no"
                    xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="concat(text(),$dates)"/>
                </xsl:element>
                <xsl:element name="role" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                    <xsl:element name="roleTerm" inherit-namespaces="no"
                        xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">
                            <xsl:value-of>code</xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="authority">
                            <xsl:value-of>marcrelator</xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of>art</xsl:value-of>
                    </xsl:element>
                    <xsl:element name="roleTerm" inherit-namespaces="no"
                        xmlns="http://www.loc.gov/mods/v3">
                        <xsl:attribute name="type">
                            <xsl:value-of>text</xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="authority">
                            <xsl:value-of>marcrelator</xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of>Artist</xsl:value-of>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="typeOfResource">
        <xsl:element name="typeOfResource" inherit-namespaces="no"
            xmlns="http://www.loc.gov/mods/v3">
            <xsl:value-of>still image</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <xsl:template name="genre">
        <xsl:element name="genre" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="authority">
                <xsl:value-of>aat</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of>caricatures</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <xsl:template name="originInfo">
        <xsl:element name="originInfo" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="dateCreated" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="encoding">
                    <xsl:value-of>w3cdtf</xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="keyDate">
                    <xsl:value-of>yes</xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="ss:Cell[4]/ss:Data/text()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="physicalDescription">
        <xsl:element name="physicalDescription" inherit-namespaces="no"
            xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="form" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">
                    <xsl:value-of>technique</xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="authority">
                    <xsl:value-of>aat</xsl:value-of>
                </xsl:attribute>
                <xsl:value-of>chromolithographs</xsl:value-of>
            </xsl:element>
            <xsl:element name="internetMediaType" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of>image/tiff</xsl:value-of>
            </xsl:element>
            <xsl:element name="digitalOrigin" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of>reformatted digital</xsl:value-of>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="abstract">
        <xsl:element name="abstract" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="displayLabel">
                <xsl:value-of>Caption</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="ss:Cell[6]/ss:Data/text()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="note">
        <xsl:element name="note" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="displayLabel">
                <xsl:value-of>Category</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="ss:Cell[8]/ss:Data/text()"/>
        </xsl:element>
        <xsl:element name="note" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="displayLabel">
                <xsl:value-of>Group</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="ss:Cell[10]/ss:Data/text()"/>
        </xsl:element>
        <xsl:element name="note" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="displayLabel">
                <xsl:value-of>Signature</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="ss:Cell[12]/ss:Data/text()"/>
        </xsl:element>
    </xsl:template>


    <xsl:template name="subject">
        <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="authority">
                <xsl:value-of>lcsh</xsl:value-of>
            </xsl:attribute>
            <xsl:element name="topic">
                <xsl:value-of>Chromolithography</xsl:value-of>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- Ambassador from England -->
        
    <xsl:template name="Ambassador_from_England">
            <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Ambassadors</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Ambassador to England -->
    
    <xsl:template name="Ambassador_to_England">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Ambassadors</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Americans -->
    
    <xsl:template name="Americans">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Americans</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
     <!-- Architects_and_Engineers --> 
    
    <xsl:template name="Architects_and_Engineers">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Architects</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Engineers</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Artists -->
    
    <xsl:template name="Artists">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Artists</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- No subject headings for Automobile_Devotees -->
    
    <!-- Aviators -->
    
    <xsl:template name="Aviators">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Air pilots</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Bankers_and_Financiers -->
    
    <xsl:template name="Bankers_and_Financiers">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Bankers</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Capitalists and financiers</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Businessmen_and_Empire_Builders -->
    
    <xsl:template name="Businessmen_and_Empire_Builders">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Businessmen</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Capitalists and financiers</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
        
    <!-- Chancellors_of_Exchequer -->
    
    <xsl:template name="Chancellors_of_Exchequer">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Finance ministers</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Clergy -->
    
    <xsl:template name="Clergy">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Clergy</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- no lcsh subject headings for Criminals -->
    
    <!-- Doctors_and_Scientists -->
    
    <xsl:template name="Doctors_and_Scientists">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Physicians</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Scientists</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Explorers_and_Inventors -->
    
    <xsl:template name="Explorers_and_Inventors">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Explorers</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Inventors</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Freemasons -->
    
    <xsl:template name="Freemasons">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Freemasonry</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Ladies -->
    
    <xsl:template name="Ladies">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Women</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Legal -->
    
    <xsl:template name="Legal">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Lawyers</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Literary -->
    
    <xsl:template name="Literary">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Authors</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Military_and_Navy -->
    
    <xsl:template name="Military_and_Navy">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain.</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Army</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain.</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Royal Navy</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- no headings for Miscellaneous -->
    
    <!-- Music -->
    
    <xsl:template name="Music">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Musicians</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Newspapermen -->
    
    <xsl:template name="Newspapermen">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Publishers and publishing</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- no subject heading for Orientals -->
    
    <!-- Policemen -->
    
    <xsl:template name="Policemen">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Police</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Politicians -->
    
    <xsl:template name="Politicians">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Politicians</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Prime_Ministers -->
    
    <xsl:template name="Prime_Ministers">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Prime ministers</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- no subject headings for Railway_Officials -->
  
    <!-- no subject headings for Red_Robe_Judges -->
    
    <!-- Royalty -->
    
    <xsl:template name="Royalty">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Kings and rulers</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- no subject headings for Scotsmen -->
    
    <!-- no subject headings for Shipping_Officials -->
   
    <!-- no subject headings for Cricket -->
    
    <!-- Fox_Hunters -->
    
    <xsl:template name="Fox_Hunters">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Fox hunting</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Horse_Trainers -->
    
    <xsl:template name="Horse_Trainers">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Horse racing</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- no subject headings for Sport_Riders -->
     
    <!-- no subject headings for Turf_Devotees -->
    
    <!-- no subject headings for Yachting_Devotees -->
    
    <xsl:template name="Other">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>England</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Social life and customs</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>History</xsl:value-of>
                        </xsl:element>
        <xsl:element name="temporal" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>19th century</xsl:value-of>
                        </xsl:element>
            </xsl:element>
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>England</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Social life and customs</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>History</xsl:value-of>
                        </xsl:element>
        <xsl:element name="temporal" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>20th century</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- no subject headings for Sports_Billiards -->
    
    <!-- no subject headings for Sports_Carriages -->
    
    <!-- no subject headings for Sports_Chess -->
    
    <!-- no subject headings for Sports_Dog_Judge -->
    
    <!-- no subject headings for Sports_Duelling -->
    
    <!-- no subject headings for Sports_Fencing -->
    
    <!-- no subject headings for Sports_Fishing -->
    
    <!-- no subject headings for Sports_Ice_Skating -->
    
    <!-- no subject headings for Sports_Roller_Skating -->
    
    <!-- no subject headings for Sports_Rugby -->
    
    <!-- no subject headings for Sports_Soccer -->
    
    <!-- no subject headings for Sports_Swimming -->
    
    
    <!-- Stock_Exchange_Officials -->
    
    <xsl:template name="Stock_Exchange_Officials">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Stock exchanges</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Teachers_and_Headmasters -->
    
    <xsl:template name="Teachers_and_Headmasters">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Teachers</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- Theatre -->
    
    <xsl:template name="Theatre">
    <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="authority">
                    <xsl:value-of>lcsh</xsl:value-of>
                </xsl:attribute>
                        <xsl:element name="topic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Theater</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="geographic" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Great Britain</xsl:value-of>
                        </xsl:element>
                        <xsl:element name="genre" inherit-namespaces="no"
                            xmlns="http://www.loc.gov/mods/v3">
                            <xsl:value-of>Caricatures and cartoons</xsl:value-of>
                        </xsl:element>
            </xsl:element>
        </xsl:template>
    
    <!-- no subject headings for Trade_Union_Officials -->
    
    <!-- no subject headings for Wagerers -->

    <xsl:template name="relatedItem">
        <xsl:element name="relatedItem" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">
                <xsl:value-of>series</xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="displayLabel">
                <xsl:value-of>Part of</xsl:value-of>
            </xsl:attribute>
            <xsl:element name="titleInfo">
                <xsl:element name="nonSort">
                    <xsl:value-of>The</xsl:value-of>
                </xsl:element>
                <xsl:element name="title">
                    <xsl:value-of>Cecil Lang Collection of Vanity Fair Illustrations</xsl:value-of>
                </xsl:element>
            </xsl:element>


            <xsl:element name="originInfo">
                <xsl:element name="dateCreated">
                    <xsl:attribute name="keyDate">
                        <xsl:value-of>yes</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="encoding">
                        <xsl:value-of>w3cdtf</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="point">start</xsl:attribute>
                    <xsl:value-of>1868</xsl:value-of>
                </xsl:element>
                <xsl:element name="dateCreated">
                    <xsl:attribute name="encoding">
                        <xsl:value-of>w3cdtf</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="point">end</xsl:attribute>
                    <xsl:value-of>1914</xsl:value-of>
                </xsl:element>

            </xsl:element>
        </xsl:element>

        <xsl:element name="relatedItem" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">
                <xsl:value-of>series</xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="displayLabel">
                <xsl:value-of>Appears in</xsl:value-of>
            </xsl:attribute>
            <xsl:element name="titleInfo">
                <xsl:element name="title">
                    <xsl:value-of>Vanity Fair</xsl:value-of>
                </xsl:element>
            </xsl:element>
            <xsl:element name="originInfo">
                <xsl:element name="place">
                    <xsl:element name="placeTerm">
                        <xsl:attribute name="type">
                            <xsl:value-of>text</xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of>London</xsl:value-of>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="dateCreated">
                    <xsl:attribute name="keyDate">
                        <xsl:value-of>yes</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="encoding">
                        <xsl:value-of>w3cdtf</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="point">start</xsl:attribute>
                    <xsl:value-of>1868</xsl:value-of>
                </xsl:element>
                <xsl:element name="dateCreated">
                    <xsl:attribute name="encoding">
                        <xsl:value-of>w3cdtf</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="point">end</xsl:attribute>
                    <xsl:value-of>1914</xsl:value-of>
                </xsl:element>
            </xsl:element>
            <xsl:element name="part">
                <xsl:element name="detail">
                    <xsl:attribute name="type">
                        <xsl:value-of>issue</xsl:value-of>
                    </xsl:attribute>
                    <xsl:element name="number">
                        <xsl:value-of select="ss:Cell[9]/ss:Data/text()"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="identifier">
        <xsl:element name="identifier" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">
                <xsl:value-of>local</xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="displayLabel">
                <xsl:value-of>Legacy ID</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="ss:Cell[2]/ss:Data[1]/text()"/>
        </xsl:element>
        <xsl:element name="identifier" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">
                <xsl:value-of>local</xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="displayLabel">
                <xsl:value-of>pid</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="ss:Cell[1]/ss:Data[1]/text()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="location">
        <xsl:element name="location" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="physicalLocation">
                <xsl:value-of>Small Special Collections Library</xsl:value-of>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="recordInfo">
        <xsl:element name="recordInfo" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="recordContentSource">
                <xsl:attribute name="authority">
                    <xsl:value-of>marcorg</xsl:value-of>
                </xsl:attribute>
                <xsl:value-of>viu</xsl:value-of>
            </xsl:element>
            <xsl:element name="recordOrigin">
                <xsl:value-of>Created programmatically by Digital Content Management &amp;
                    Dissemination, University of Virginia Library.</xsl:value-of>
            </xsl:element>
            <xsl:element name="languageOfCataloging">
                <xsl:element name="languageTerm">
                    <xsl:attribute name="type">
                        <xsl:value-of>code</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="authority">
                        <xsl:value-of>iso639-2b</xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of>eng</xsl:value-of>
                </xsl:element>
            </xsl:element>
            <xsl:element name="recordCreationDate">
                <xsl:attribute name="encoding">
                    <xsl:value-of>w3cdtf</xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="current-dateTime()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>



</xsl:stylesheet>
