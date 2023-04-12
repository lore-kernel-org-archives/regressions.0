Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59981568B
	for <regressions@lists.linux.dev>; Wed, 12 Apr 2023 14:07:24 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54ee0b73e08so223773327b3.0
        for <regressions@lists.linux.dev>; Wed, 12 Apr 2023 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681308443; x=1683900443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1sYxkROq82q/boyHt/eVSeQo3tvT+Mg4dBd4dGtx0j4=;
        b=VWDLBvponEwAUhE3RhIUHLIsX+mYfv41X54JsZmXuwMsbUpLDPsprmeMamFtHmdbmz
         Td88LzXDQorKPHuPhELN3MJ7Dpdl+edZYFauXLpDDKdQDtIba8L/nBkHhs4hKaPeUzFn
         F/Nzs9DyLZsyrVHYb4dezYnsqQ04LJ7UXdRo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681308443; x=1683900443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sYxkROq82q/boyHt/eVSeQo3tvT+Mg4dBd4dGtx0j4=;
        b=AHbOgARFbve4NdEP+GanCgYcI4vJCh0AF5BxSVrAG4M3g7YX9WACE2rkFQFWyV/GG6
         8AKtsiwljyc7AskyEQBcWTd6cX7Yn18SCsGP4s3wZWVoMDKXrRyR0H4FUhvRSYqHb3tm
         NRz3EicvEH4DADithTzlqYB14Uhg398nru5LfHpFvDmBWXdpF4LOG9rKXhrhbVAmzSwn
         eP0eCvj5svyukosmkDKVN1UW4xupe0V26yuiLNhhiC9DkqeaHoK48/slYCS/a22XJVB/
         hF4r85sj27SStxRxpTJgE4DeEWvYO8RvrcsoJj8ysvFWSgPNzdCDiJ6f1JCwLZwxBdBY
         iGGA==
X-Gm-Message-State: AAQBX9fxYf1HwJfWcNcSdfPatb8SAJTuxhIAzcZmQzJ+d7JZm/Ob3GX3
	b/DlVZ/F3egNtpNwjGYxESqbSA==
X-Google-Smtp-Source: AKy350ZCKH9jN34tPhRn90jaxK8JgGB+RhiEn1nEenc43BnuIAU6jB13VU7S7JgrgNv8T7CS1mYcNA==
X-Received: by 2002:a0d:f684:0:b0:54f:b875:4976 with SMTP id g126-20020a0df684000000b0054fb8754976mr15436ywf.15.1681308443255;
        Wed, 12 Apr 2023 07:07:23 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id s128-20020a372c86000000b0074688c36facsm4703624qkh.56.2023.04.12.07.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 07:07:22 -0700 (PDT)
Date: Wed, 12 Apr 2023 10:07:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org, 
	aros@gmx.com, linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	tools@linux.kernel.org
Subject: Re: Introducing bugbot
Message-ID: <20230412-appear-tiring-f5a896@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <1f0ebf13-ab0f-d512-6106-3ebf7cb372f1@leemhuis.info>
 <87fs958f2a.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fs958f2a.fsf@kernel.org>

On Wed, Apr 12, 2023 at 03:23:25PM +0300, Kalle Valo wrote:
> > But here I decided to *not* use bugbot, as I know Kalle sometimes is
> > active in bugzilla -- and thus might hate it, if I re-categorize the bug.
> 
> Yeah, for me moving ath11k bugs away from Drivers/network-wireless
> component is not really helpful. And for ath11k I try to look at all
> reported bugs in bugzilla anyway, though just slowly.

Right, I did mean to say that the bot is only limited to Linux/Kernel during
the initial tryout stage. Once I'm more confident that it's not exploding and
mostly doing the right thing, I can enable it for other components.

> While at it, I have some things on my wishlist to make my use of
> bugzilla.kernel.org easier:
> 
> * A new state named UNCONFIRMED and have it as the default state for
>   reported bugs. This would help triaging bugs as some of the reports
>   are not valid. In other words only valid bugs would have NEW state.
>   IIRC the Mozilla project did this back in the day.

This is more hairy than it looks, but I'll try to figure out what happened to
the UNCONFIRMED state in our bugzilla.

> * Use P3 as the default priority for the new bugs. I try to keep ath11k
>   bugs in priority order but new reported bugs having P1 always messes
>   up the list always.

Okay, I set the default to P3, which is nicely in the middle.

-K
