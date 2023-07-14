Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8E620F96
	for <regressions@lists.linux.dev>; Fri, 14 Jul 2023 20:20:05 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-63719ad32e7so12953856d6.1
        for <regressions@lists.linux.dev>; Fri, 14 Jul 2023 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689366004; x=1691958004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=59aHtJubGNcK+yaxm0dmlYUofMvSN9PYT+/y44pZsrI=;
        b=X9PGBrLEe+d/gGimNmRikXxkkpaEOE8gaX3JdODRKTX3KwLhImLGlXm5mgd8CvUQAw
         Wb4fOvQmgx9KW1I8VAtCQfNsRzGu+pZaSuYXwCRZf09I9Qw6CBk0c+Muq3qoCed/TiWo
         wNNGwNw3RRvbp2Wql4lWnDusNu+TOf63nkQZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689366004; x=1691958004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59aHtJubGNcK+yaxm0dmlYUofMvSN9PYT+/y44pZsrI=;
        b=IQ271q9ryjr+e++rv69d4LCr7ZzmnXEBZcMV9Q9ZVxl93Yo28crn1JWl6imkGpKq+u
         Pys1jRofJLCCZluQwir7no6YpBS0wsP7vGWUEE3Q3BiZPtMMvHe1/6xJtvXmJfzD1FG/
         e57N4YWBFRu+Yja8+a9rBniMGSdqMVcVkabjZP863WPJEChn38POffRfcO4wqfEMnpWy
         l7SSF71KuIx43qf0RW7ttJiBZZ9dSNMzhg8YEsmuMKpEC6zkAZEHVPQk1cXC07LanApW
         xfa8gOJbgOMXiT7SM7EOxQtxlXmZkEXndg70HxiLXVwd8U3ugaW7Xnrgv9PaoGaZa1Dr
         XzIg==
X-Gm-Message-State: ABy/qLaFWD6CroT13cpcq1PKsGuCQB+tB4dz9lnkK8woldMRocvvXpW5
	K8Si0zTTpcDOpp1JUPFw1h6TSmRVflooUEWuA3c=
X-Google-Smtp-Source: APBJJlGF4nHs7Q3EUm4uKApl3ont4tN/gRqL8HOBDwirrQxI1hIMB2FeSUDky5fE+2EmkCjTAvaS2g==
X-Received: by 2002:a0c:9c8c:0:b0:626:3a5a:f8f8 with SMTP id i12-20020a0c9c8c000000b006263a5af8f8mr4737316qvf.58.1689366004140;
        Fri, 14 Jul 2023 13:20:04 -0700 (PDT)
Received: from nitro.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id q4-20020a0ce204000000b00626286e41ccsm720885qvl.77.2023.07.14.13.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 13:20:03 -0700 (PDT)
Date: Fri, 14 Jul 2023 16:19:54 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Bugbot for all kernel bugs?
Message-ID: <20230714-zion-margin-natasha-a66ce1@meerkat>
References: <8133fcf4-5ed6-204a-ceb1-ee4136e32fb4@leemhuis.info>
 <20230711-encore-hunchback-2d103b@meerkat>
 <10064cba-f0fe-fbc6-0c3a-97be48360a05@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10064cba-f0fe-fbc6-0c3a-97be48360a05@leemhuis.info>

On Thu, Jul 13, 2023 at 01:45:58PM +0200, Thorsten Leemhuis wrote:
> > So, we can't easily do "enable for all the bugs" because the bot was written
> > with the idea that it would be invoked per-component. Is there a bugzilla
> > component (and a matching mailing list) that you have in mind for the bot?
> 
> Ugh. :-/ Well, as you can see from a quick search like
> https://lore.kernel.org/all/?q=%28nq%3A%22noticed+a+regression+report+in+bugzilla.kernel.org%22+f%3Aleemhuis%29+OR+%28nq%3A%22I+notice+a+regression+report+on+Bugzilla%22+f%3Asanjaya%29
> we have to deal will bug reports for many different components. So it
> would be great if it could be enabled for all products/components, except:
> 
> * all components from the product categories "Alternate Trees",
> "Backports project", "Documentation", "kernel.org", and "Tools"
> 
> * "Bug Tracker", "klibc/kinit", "module-init-tools", and "Spam" from the
> product category "Other"
> 
> There might be a few more that are obsolete hidden in the other products
> categories (like "PS3" in "Platform Specific/Hardware" or "lguest" in
> "Virtualization")
> 
> Did I say "Ugh" already? Ohh, seems I did. :-/
> 
> So how do you suggest to move forward

One of the main drives behind bugbot was to eliminate as many components as
possible and just let people file bugs under "Linux/Kernel". The "bug
wrangler" people would then do initial triage and set the "Subsystem" field to
match an entry from MAINTAINERS. Then, they would set the "bugbot" flag to "+"
and let the bot do the rest, fully bridging bugzilla with the mailing lists.

So, in my perfect little world we'd:

1. identify products/components that we can abandon right away and close them
   for new bug entry
2. identify the "bug wranglers" who can do the initial triage and grant them
   the power to set the "bugbot" flag
3. catch and fix the bugs

We can start with #1 if everyone is happy with this course of action.

-K
