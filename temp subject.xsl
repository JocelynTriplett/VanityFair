<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
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
                
</xsl:stylesheet>