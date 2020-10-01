# LES PLOUBELLES

### You can visit the website here: https://murmuring-beyond-57826.herokuapp.com/

###### Story
My roomate (@therocketgui) and I (@askprod) just moved in to our flat in Paris and had no furniture. Just as we were driving by in southern Paris, we noticed some furniture (some of it was nearly brand-new) in the street, that people were throwing out. In one night we nearly got everything we needed for FREE for out appartment.
We tried to find others days and locations where people were throwing stuff out, but it was all too complicated, as you have to go the the page of the locality you're in, download a 50 page PDF and find the info you need.

> This website started from this idea.

What we are trying to do is gather that information by scraping every PDF from localities around Paris (mainly in the south for now) and return all the data you need, to know when you can throw out stuff so the municipality can pick it up, OR for guys like us to find some awesome furniture and other things, at the right dates and right place.

In the future we would like to emplement everything like recycling bins, waste, glass and so on. And why not have an interactive map? There's plenty of headspace for creativity.

We are using Rails 5 and PostgreSQL. Python for scraping PDFs.

You can run this locally by cloning, creating, migrating and seeding the DB. All you have to do after that is `rails s` to run your server on `localhost:3000`.

