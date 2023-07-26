Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AC4BA4F
	for <regressions@lists.linux.dev>; Wed, 26 Jul 2023 13:45:53 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3163eb69487so721873f8f.1
        for <regressions@lists.linux.dev>; Wed, 26 Jul 2023 06:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690379151; x=1690983951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVYO67or7p2BnR/ZAgwz+OpJI+nsqlOPezusgonE0gY=;
        b=nbhLR0VhjC+ha48qYNOaWJfmy4sJQHECrtmXBIsmt1micMjvjk6AUAKPAZ8eV7snLg
         YK/7Do+POg2/l8UIFDFx5XgXXj/eQqU8NhUfnuOqeAVTqyGzRGqWMKIIUpDjeqRbJwKP
         PqvxJDUN5gsVC+O0hQa/4vgut9b7z4rMd5uTbIuOFdyBDxo48wmYhO3B1wrEJOxvvGbN
         eWdnLgKQwz/R4KX7X51JqXOr1M1VsQEhPJIoaRmyeHZbbHdVK1gJIO4p7dKMOOC980st
         lLm8Rev+uMoChwdL3ra6waeBzmsgqkwSusSI1aLM0R952uDb6MKSLFgolR2p72J0z3eb
         gs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690379151; x=1690983951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVYO67or7p2BnR/ZAgwz+OpJI+nsqlOPezusgonE0gY=;
        b=D126NbEcGnC9MjjgoGvOXkonvSyJjEJ1xKlSr7fWkhUNRn9CLzyfyEeqoELgirojzp
         NQC29yPNialhe7mNkap5xKrOzREnA8FId5cpUzjnRB9XHl6lYBxWV8DP/wcdwn9QUOYr
         7PD0svBYjCKW8aU6W23HAdzrGLuNWRFvuElgRhfIe1ucEFourmc5LYW/R1CMsL3DEjUY
         V1PBueaXMDpJ7GDtTWCVb7+NJkPnrmHCTYWpgo/R4+4NETBFPa3m0IAAvDV70i/ELt4X
         eYxba3zoPsvNfeXhr//A12ZTyMZk/+JIthmVnKptwVvEdZFcK7iXIQkMwnHWCqXo/2RV
         +O6g==
X-Gm-Message-State: ABy/qLbpoxMfwvLs4aEyhMH6CrmqupNZXV01yt9jxFLUGq3GFsDQICTe
	qh34qXhTq4OCFp6DHLxROaEU2mY1eAwEog==
X-Google-Smtp-Source: APBJJlGwnANWFdP3v0/67LvbfKtv5GMWoj7EAvKXrVhEA/pJXFbX+f9Yztmplb6bC2gHMGCni5uLgA==
X-Received: by 2002:a05:6000:1004:b0:317:59ea:1c6b with SMTP id a4-20020a056000100400b0031759ea1c6bmr3760974wrx.35.1690379150974;
        Wed, 26 Jul 2023 06:45:50 -0700 (PDT)
Received: from skbuf ([188.25.175.105])
        by smtp.gmail.com with ESMTPSA id k14-20020a7bc30e000000b003fc02219081sm2039228wmj.33.2023.07.26.06.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 06:45:50 -0700 (PDT)
Date: Wed, 26 Jul 2023 16:45:48 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Sergei Antonov <saproj@gmail.com>, netdev@vger.kernel.org
Subject: Re: Regression: supported_interfaces filling enforcement
Message-ID: <20230726134548.mwdojjvn6jnwpahy@skbuf>
References: <CABikg9wM0f5cjYY0EV_i3cMT2JcUT1bSe_kkiYk0wFwMrTo8=w@mail.gmail.com>
 <20230710123556.gufuowtkre652fdp@skbuf>
 <ZLATb/obklRDT3KW@shell.armlinux.org.uk>
 <9e584314-cb54-1dd4-1686-572973777580@leemhuis.info>
 <ZL+xSJh4pJArnaLU@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZL+xSJh4pJArnaLU@shell.armlinux.org.uk>

On Tue, Jul 25, 2023 at 12:26:00PM +0100, Russell King (Oracle) wrote:
> On Tue, Jul 25, 2023 at 12:58:31PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > [CCing the regression list, as it should be in the loop for regressions:
> > https://docs.kernel.org/admin-guide/reporting-regressions.html]
> > 
> > On 13.07.23 17:08, Russell King (Oracle) wrote:
> > > On Mon, Jul 10, 2023 at 03:35:56PM +0300, Vladimir Oltean wrote:
> > >> On Tue, Jul 04, 2023 at 05:28:47PM +0300, Sergei Antonov wrote:
> > >>> This commit seems to break the mv88e6060 dsa driver:
> > >>> de5c9bf40c4582729f64f66d9cf4920d50beb897    "net: phylink: require
> > >>> supported_interfaces to be filled"
> > >>>
> > >>> The driver does not fill 'supported_interfaces'. What is the proper
> > >>> way to fix it? I managed to fix it by the following quick code.
> > >>> Comments? Recommendations?
> > >>
> > >> Ok, it seems that commit de5c9bf40c45 ("net: phylink: require
> > >> supported_interfaces to be filled") was based on a miscalculation.
> > > 
> > > Yes, it seems so. I'm not great with dealing with legacy stuff - which
> > > is something I've stated time and time again when drivers fall behind
> > > with phylink development. There's only so much that I can hold in my
> > > head, and I can't runtime test the legacy stuff.
> > > 
> > > I suspect two other DSA drivers are also broken by this:
> > > 
> > > drivers/net/dsa/dsa_loop.c
> > > drivers/net/dsa/realtek/rtl8366rb.c
> > > 
> > > based upon:
> > > 
> > > $ grep -lr dsa_switch_ops drivers/net/dsa | xargs grep -L '\.phylink_get_caps.*=' | xargs grep -L '\.adjust_link'
> > 
> > What happened to this regression? From here it looks like things
> > stalled, but I might have missed something, hence allow me to ask:
> > 
> > Is this still happening? Is anyone still working on fixing this?
> 
> I think the discussion got side-tracked into whether mv88e6060 should
> be merged into mv88e6xxx, and then just petered out with no further
> patch(es) - plus I was on holiday so obviously wasn't paying much
> attention.
> 
> I suppose the sane thing to do would be to fix all drivers in one
> go - maybe something like this:
> 
> -	if (ds->ops->phylink_get_caps)
> +	if (ds->ops->phylink_get_caps) {
>  		ds->ops->phylink_get_caps(ds, dp->index, &dp->pl_config);
> +	} else {
> +		/* For legacy drivers */
> +		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> +			  &dp->pl_config.supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_GMII,
> +			  &dp->pl_config.supported_interfaces);
> +	}
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Yup, dsa_loop is broken too, I've just tested it by enabling
CONFIG_NET_DSA_LOOP=y and booting on a board which has an existing
interface named eth0 (this will be used as fake DSA master):

[    4.936197] dsa-loop fixed-0:1f: skipping link registration for CPU port 5
[    4.944316]  (null): phylink: error: empty supported_interfaces
[    4.950551] error creating PHYLINK: -22
[    4.954467] dsa-loop fixed-0:1f lan1 (uninitialized): error -22 setting up PHY for tree 0, switch 0, port 0
[    4.964869]  (null): phylink: error: empty supported_interfaces
[    4.970932] error creating PHYLINK: -22
[    4.974833] dsa-loop fixed-0:1f lan2 (uninitialized): error -22 setting up PHY for tree 0, switch 0, port 1
[    4.985131]  (null): phylink: error: empty supported_interfaces
[    4.991120] error creating PHYLINK: -22
[    4.995002] dsa-loop fixed-0:1f lan3 (uninitialized): error -22 setting up PHY for tree 0, switch 0, port 2
[    5.005277]  (null): phylink: error: empty supported_interfaces
[    5.011267] error creating PHYLINK: -22
[    5.015148] dsa-loop fixed-0:1f lan4 (uninitialized): error -22 setting up PHY for tree 0, switch 0, port 3
[    5.026292] DSA: tree 0 setup
[    5.029282] dsa-loop fixed-0:1f: DSA mockup driver: 0x1f

I've also tested that your patch (fixed so that it doesn't take the "&"
address of supported_interfaces, which is already an array type)
restores the functionality:

[    4.949944] dsa-loop fixed-0:1f: skipping link registration for CPU port 5
[    4.957757] dsa-loop fixed-0:1f lan1 (uninitialized): PHY [dsa-0.0:00] driver [Generic PHY] (irq=POLL)
[    4.973085] dsa-loop fixed-0:1f lan2 (uninitialized): PHY [dsa-0.0:01] driver [Generic PHY] (irq=POLL)
[    4.986189] dsa-loop fixed-0:1f lan3 (uninitialized): PHY [dsa-0.0:02] driver [Generic PHY] (irq=POLL)
[    4.998763] dsa-loop fixed-0:1f lan4 (uninitialized): PHY [dsa-0.0:03] driver [Generic PHY] (irq=POLL)
[    5.012044] DSA: tree 0 setup
[    5.015040] dsa-loop fixed-0:1f: DSA mockup driver: 0x1f

Russell, can you please go ahead and turn the short-term fix into a
formal patch?

Once I get rid of some of the pending stuff that's keeping me busy,
I've made a note to not let the short-term workarounds (this and
dsa_port_phylink_validate() avoiding phylink_generic_validate() if
mac_capabilities isn't provided) turn into long-term workarounds that
new drivers, too, might start relying on.
