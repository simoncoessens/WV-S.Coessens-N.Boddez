# WV:S.Coessens,N.Boddez
Wetenschappelijke vorming 2021-2022

# Onderzoeksvraag:
H3. Hoe efficiënt is "efficiënt? Snelheid van reconstructie op basis van compressed sensing[bewerken]
Compressed sensing, of compressive sampling, is een razend populaire nieuwe richting in signaalverwerking - getuige ook het onderwerp hierboven. Het gaat om dezelfde techniek in beide projecten, maar in dit geval toegepast op afbeeldingen. Compressed sensing laat toe om een afbeelding te reconstrueren op basis van onvoldoende gegevens. Een klassieke 10-megapixel (10MP) camera doet dat niet: de camera zal eerst tien miljoen pixels "bemonsteren", en vervolgens wordt een gecomprimeerde voorstelling gemaakt, zoals een JPEG-bestand. Een compressed-sensing camera zal veel minder metingen doen, en tracht rechtstreeks de gecomprimeerde versie van de afbeelding te genereren.

De computationele uitdaging hier ligt in het opstellen van de kleine voorstelling op basis van de metingen. Dit gebeurt aan de hand van het oplossen een optimalisatieprobleem. Doorgaans wordt vermeld dat het echte optimalisatieprobleem dat zich aandient veel te duur is, het is zelfs NP-compleet. Vervolgens wordt uitgelegd dat een eenvoudiger optimalisatieprobleem kan opgelosten worden dat "efficiënt" is. Dat is vooral zo in vergelijking met het duurdere probleem. Maar hoe efficiënt is dat in praktijk? In dit project werken we niet met de wiskundige achtergrond van compressed sensing, maar trachten we aan de hand van voorbeelden te bepalen wat je van deze techniek kan verwachten met bestaande software. Voor de gecomprimeerde voorstelling van een afbeelding gebruiken we wavelets.

Literatuur:

Candes and Wakin (2008). An introduction to compressive sampling, IEEE Signal Processing Magazine 25(2), pp. 21-30. (https://authors.library.caltech.edu/10092/1/CANieeespm08.pdf)
Wavelets with applications in signal and image processing. Cursustekst.

-> Via Toledo inschrijven vr de cursus "Wavelets with Applications in Signal and Image Processing (B-KUL-H03F7A)", rechtsboven bij beheer



Videoreeks over Fourier transformatie in afbeeldingen: 
- https://www.youtube.com/watch?v=bhxDXab0ffg
- https://www.youtube.com/watch?v=PsEsMIPYJBg
- https://www.youtube.com/watch?v=g8h-d1IJfGk
- https://www.youtube.com/watch?v=SRGApjQRzks
- https://www.youtube.com/watch?v=jQmlxMEi6j0


Presentatie 8 november: https://www.overleaf.com/4192473368pxfwwbwrktsk

Probleemstelling 6 december: https://www.overleaf.com/8958935127yfwbvgkpbbbm


TO DO:
- andere lineair programmeren toolkit gebruiken en testen
- linprog runt in matlab of erbuiten?
- een praktische toepassingen uitwerken
- onderzoek spaarsheid 
- hoe op departementale pc's testen?


LINPROGRAMMING TOOLKITS:
- linprog matlab
- GNU Lineari programming https://en.wikipedia.org/wiki/GNU_Linear_Programming_Kit
- CPLEX optimizer https://www.ibm.com/analytics/cplex-optimizer
-   - **https://www.tu-chemnitz.de/mathematik/discrete/manuals/cplex/doc/getstart/html/ilocplex13.html**
- Gorubi https://www.gurobi.com/

TO DO gesprek 14/04:
- limieten testen, maximale n vinden
- Julia linear prog toolkit
- sciensano paper bekijken
- noisy-model
