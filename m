Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D814416132E
	for <regressions@lists.linux.dev>; Fri, 10 May 2024 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337845; cv=none; b=h1+nDOpu3hiUjdNZ+s+WLVoNOzDNL/2p+cV984AMyZRf63BfHQTdSc/qFNJGIv55VJ7xqgvQBNra686TmTUbAUjx0PPzSTsgOhFaoHKwEoIfxvOj0DmOa14yeb9uSrBmJSAA76AEG3WIsd9fD8A3vpjeynU36mco92UO9GMb4fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337845; c=relaxed/simple;
	bh=i3iJDF0NWxCzPjjHIcKEVQFJMAJAK0g33+1KtcRzxbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIErYziLZJPLuwoHAWnUjaeYr8Nx2IFLVhZB35qWG3cYaKxwjFk1PgJIEn4DTt+Io2fN9tiHSg0uVYv2FqA7UOKw0VutfBRLUpKEz/3DaiYhikJ82YPp2JhOxRp6laGLFFCgzk49zlmklBd0eqNEb0tSDKUNRf3WUeFkJtfcAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R05bVHLI; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R05bVHLI"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso1585545276.0
        for <regressions@lists.linux.dev>; Fri, 10 May 2024 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715337842; x=1715942642; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ogNqw3uEWxZLRhr+XjfNFFQFaORnUkcs+lj7HFycVM=;
        b=R05bVHLIlIKDk1PYF886B3w8kUYLipThEEVeqUURAnGhBo/XZL+eBfV3Jbv3iRLqkP
         EZRTWy9ql7YccNfTcdAGbBb1LCyIfLZbajd2Nx13PJdM6NabpFlpkdo0/YTxp+GjMdxw
         MH7AXMaG42LhV7poe6OA9r8o1d0gSEbkTarBoljWbRJvsdviS63qHXN8otb2UX5STQkZ
         y3+vS629u3XQo4DiG3yjPaAsC6iv8K5vuI98VOJlV8jQZP6E9E/ogJJgWgARB4YM069G
         xnm/yaCMI5sOIOtVOubw5bNi8pFYYY9qLLqiiSk4gdiEyhyOE3F+v+3KchldRGD2k5Vu
         2bGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715337842; x=1715942642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ogNqw3uEWxZLRhr+XjfNFFQFaORnUkcs+lj7HFycVM=;
        b=VOdN17EVBj9VT3xXf+Yhj7DTpAddMf+/nSYD56pEImbhDczahZcGwFOVsHKw7NPnzy
         3i5vzd7q1ZIXTS+DSoNGrs6eaZkvOzFswUPdHo9TFhDvjOu2SJ2J3/fGckqoLu0/s9JU
         eP8E/+f/hQDB0K/StX00RJRVOKc5jFiBAVuxucmkViqjv409vcxvELJVa+dyHDwYUWiK
         q8nUrKKfLSscI0i8eKLYIzBtxEbejnTIqVIiAHCqF5ZcPJOSlVmcLBGy8BFWvh29Fr70
         kRVLCY86pHEK5oRLQsYKMAm8cUIoVXMbHU83VvekZI2DAJs4ayNn8E3boFoBY781iv3b
         SxVA==
X-Gm-Message-State: AOJu0YyoqvjEfURDKKXZf8Y1lmrH/pXeq5y6YF+YV/SpMBEqxuoQmIw2
	ULsmj9Uv0A1g1cP2IHztQaX9KOxqsl8qamH+VeNNMyORdQrO8Pw/ocFjnc8S/fBbErFG7t+tRxb
	ML+3WXNAL93Ff0YmWDBzKGqlpneup+ITyPwz7wiXgaP1BNJ08
X-Google-Smtp-Source: AGHT+IEj3mCKu7tL9GBcUKYmQuqjEI54qVi7amjAMzPkme0Zr24WvWUgplD6ZcAyk7jpG/q60xs32s3eP8FdtY4Mifw=
X-Received: by 2002:a25:d009:0:b0:dc6:d1a9:d858 with SMTP id
 3f1490d57ef6-dee4e4a641cmr1871935276.8.1715337841207; Fri, 10 May 2024
 03:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2eb72832e852c80e5c11cd69e7d2f14cefd8b1cb.1712903998.git.viresh.kumar@linaro.org>
 <e6fc06eb-fe52-4cb3-b412-a602369ee875@leemhuis.info> <CAPDyKFoHoKK-RZsGwnZhbW9_ZRQtL1MFZBuVVLMx-MxL2cQQbw@mail.gmail.com>
 <7c6df194-fce1-401a-98c5-c903d78627c4@leemhuis.info>
In-Reply-To: <7c6df194-fce1-401a-98c5-c903d78627c4@leemhuis.info>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 May 2024 12:43:25 +0200
Message-ID: <CAPDyKFqKRy6zJdBpK3bNTvkvAjty691-Vi_HV3E5CeqgRAWGmA@mail.gmail.com>
Subject: Re: [PATCH V2] OPP: Fix required_opp_tables for multiple genpds using
 same table
To: Linux regressions mailing list <regressions@lists.linux.dev>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Vladimir Lypak <vladimir.lypak@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 May 2024 at 10:54, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 10.05.24 10:37, Ulf Hansson wrote:
> > On Thu, 9 May 2024 at 14:35, Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> >> On 12.04.24 08:41, Viresh Kumar wrote:
> >>> The required_opp_tables parsing is not perfect, as the OPP core does the
> >>> parsing solely based on the DT node pointers.
> >>>
> >>> The core sets the required_opp_tables entry to the first OPP table in
> >>> the "opp_tables" list, that matches with the node pointer.
> >>>
> >>> If the target DT OPP table is used by multiple devices and they all
> >>> create separate instances of 'struct opp_table' from it, then it is
> >>> possible that the required_opp_tables entry may be set to the incorrect
> >>> sibling device.
> >>>
> >>> Unfortunately, there is no clear way to initialize the right values
> >>> during the initial parsing and we need to do this at a later point of
> >>> time.
> >>>
> >>> Cross check the OPP table again while the genpds are attached and fix
> >>> them if required.
> >>>
> >>> Also add a new API for the genpd core to fetch the device pointer for
> >>> the genpd.
> >>>
> >>> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> >>> Reported-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> >>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218682
> >>
> >> Did this fall through the cracks? Just wondering, as from here it looks
> >> like for about four weeks now nothing happened to fix the regression
> >> linked above. But I might have missed something. Or is everybody waiting
> >> for a test from the reporter?
> >
> > I have chatted a bit with Viresh about this problem offlist, while
> > both me and him are/have been on vacations. Sorry for the delay and
> > confusion.
> >
> > The latest update from my side is that I am working on a solution,
> > that aim to remove the entire dev|devm_pm_opp_detach_genpd() API.
>
> That sounds like something that would have to wait for a merge window;
> so given the timing I assume this would mean that the earliest point in
> time to merge this would be for 6.11-rc1, which is ~2 months away --
> plus another 9 or 10 weeks until the fix would reach users.

Right.

>
> > Instead, the plan is to move consumer drivers to use
> > dev_pm_domain_attach_list() to attach multiple PM domains per device.
> > When it comes to hooking up the required-opps-tables/devs, I think
> > genpd should be able to manage this during the device attach process.
> > In this way, consumer drivers shouldn't need to care about this at
> > all.
> >
> > That said, I am hoping that $subject patch should not be needed.
> > Although, I need a bit more time before I am ready to post a patchset
> > for the above.
> >
> > What do you think?
>
> Given that the report is already more than a month old now and what I
> assumed above (which might be wrong), this makes me wonder: is there a
> downside if we apply this patch now, and simply revert this later when
> your proper solution is merged? I would assume that is what Linus want
> in this case to honor the "no regressions" rule.

Sure, I am certainly okay with this approach too!

>
> Might be something different if this is something like a really odd
> corner case we assume nobody (or nearly nobody) will run into in
> practice. But as somebody noticed this, I assume that is not the case.

I wasn't sure of the level of urgency in this case, as I don't think
we have that many DTSes upstream that could hit this case.

But nevermind, it should be easy to revert/replace the change when we
have something better to take over. Viresh, feel pick this up - or let
me know if you prefer me to pick it.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


>
> Ciao, Thorsten
>
> >>> Co-developed-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> >>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >>> ---
> >>> V2:
> >>> - Fix an `if` condition.
> >>> - s/Bugzilla/Closes/ and change ordering.
> >>>
> >>>  drivers/opp/core.c        | 31 ++++++++++++++++++++++++++++++-
> >>>  drivers/pmdomain/core.c   | 10 ++++++++++
> >>>  include/linux/pm_domain.h |  6 ++++++
> >>>  3 files changed, 46 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> >>> index e233734b7220..cb4611fe1b5b 100644
> >>> --- a/drivers/opp/core.c
> >>> +++ b/drivers/opp/core.c
> >>> @@ -2394,7 +2394,8 @@ static void _opp_detach_genpd(struct opp_table *opp_table)
> >>>  static int _opp_attach_genpd(struct opp_table *opp_table, struct device *dev,
> >>>                       const char * const *names, struct device ***virt_devs)
> >>>  {
> >>> -     struct device *virt_dev;
> >>> +     struct device *virt_dev, *gdev;
> >>> +     struct opp_table *genpd_table;
> >>>       int index = 0, ret = -EINVAL;
> >>>       const char * const *name = names;
> >>>
> >>> @@ -2427,6 +2428,34 @@ static int _opp_attach_genpd(struct opp_table *opp_table, struct device *dev,
> >>>                       goto err;
> >>>               }
> >>>
> >>> +             /*
> >>> +              * The required_opp_tables parsing is not perfect, as the OPP
> >>> +              * core does the parsing solely based on the DT node pointers.
> >>> +              * The core sets the required_opp_tables entry to the first OPP
> >>> +              * table in the "opp_tables" list, that matches with the node
> >>> +              * pointer.
> >>> +              *
> >>> +              * If the target DT OPP table is used by multiple devices and
> >>> +              * they all create separate instances of 'struct opp_table' from
> >>> +              * it, then it is possible that the required_opp_tables entry
> >>> +              * may be set to the incorrect sibling device.
> >>> +              *
> >>> +              * Cross check it again and fix if required.
> >>> +              */
> >>> +             gdev = dev_to_genpd_dev(virt_dev);
> >>> +             if (IS_ERR(gdev))
> >>> +                     return PTR_ERR(gdev);
> >>> +
> >>> +             genpd_table = _find_opp_table(gdev);
> >>> +             if (!IS_ERR(genpd_table)) {
> >>> +                     if (genpd_table != opp_table->required_opp_tables[index]) {
> >>> +                             dev_pm_opp_put_opp_table(opp_table->required_opp_tables[index]);
> >>> +                             opp_table->required_opp_tables[index] = genpd_table;
> >>> +                     } else {
> >>> +                             dev_pm_opp_put_opp_table(genpd_table);
> >>> +                     }
> >>> +             }
> >>> +
> >>>               /*
> >>>                * Add the virtual genpd device as a user of the OPP table, so
> >>>                * we can call dev_pm_opp_set_opp() on it directly.
> >>> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> >>> index 4215ffd9b11c..c40eda92a85a 100644
> >>> --- a/drivers/pmdomain/core.c
> >>> +++ b/drivers/pmdomain/core.c
> >>> @@ -184,6 +184,16 @@ static struct generic_pm_domain *dev_to_genpd(struct device *dev)
> >>>       return pd_to_genpd(dev->pm_domain);
> >>>  }
> >>>
> >>> +struct device *dev_to_genpd_dev(struct device *dev)
> >>> +{
> >>> +     struct generic_pm_domain *genpd = dev_to_genpd(dev);
> >>> +
> >>> +     if (IS_ERR(genpd))
> >>> +             return ERR_CAST(genpd);
> >>> +
> >>> +     return &genpd->dev;
> >>> +}
> >>> +
> >>>  static int genpd_stop_dev(const struct generic_pm_domain *genpd,
> >>>                         struct device *dev)
> >>>  {
> >>> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> >>> index 772d3280d35f..f24546a3d3db 100644
> >>> --- a/include/linux/pm_domain.h
> >>> +++ b/include/linux/pm_domain.h
> >>> @@ -260,6 +260,7 @@ int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
> >>>  int pm_genpd_init(struct generic_pm_domain *genpd,
> >>>                 struct dev_power_governor *gov, bool is_off);
> >>>  int pm_genpd_remove(struct generic_pm_domain *genpd);
> >>> +struct device *dev_to_genpd_dev(struct device *dev);
> >>>  int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state);
> >>>  int dev_pm_genpd_add_notifier(struct device *dev, struct notifier_block *nb);
> >>>  int dev_pm_genpd_remove_notifier(struct device *dev);
> >>> @@ -307,6 +308,11 @@ static inline int pm_genpd_remove(struct generic_pm_domain *genpd)
> >>>       return -EOPNOTSUPP;
> >>>  }
> >>>
> >>> +static inline struct device *dev_to_genpd_dev(struct device *dev)
> >>> +{
> >>> +     return ERR_PTR(-EOPNOTSUPP);
> >>> +}
> >>> +
> >>>  static inline int dev_pm_genpd_set_performance_state(struct device *dev,
> >>>                                                    unsigned int state)
> >>>  {
> >
> >
