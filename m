Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1772F46
	for <regressions@lists.linux.dev>; Tue, 30 Aug 2022 12:19:07 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: martin-eric.racine)
	by meesny.iki.fi (Postfix) with ESMTPSA id 9F2452004E
	for <regressions@lists.linux.dev>; Tue, 30 Aug 2022 15:19:04 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1661861944; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1IU/Vmv+KZu7a/do/ie4ryReg1wzXp+x8m05MY3sN4=;
	b=T5c8amJbGhpf41aUBfRM5HBFG1FyJTLhr6Wv9mEJBwYuCOiIOorZer5oP5hDA126IyxSzK
	yffoD1fIO27107XLX9QVZa8KcNx9XVRnsSyRM3ftrjquGoZuYGfbfdzOdO89ioi2dkQQCT
	lZ2/GMAd7sou4zNR7/SFcB6jDdM1VHY=
Received: by mail-vk1-f172.google.com with SMTP id s66so3245207vkb.4
        for <regressions@lists.linux.dev>; Tue, 30 Aug 2022 05:19:04 -0700 (PDT)
X-Gm-Message-State: ACgBeo3sofrD/vcBOsFFdjuDF79QqgWH2CFN69Ry8dLA32RuakOgMG2q
	7iraorq6lNec2cpgby3dYv0hEoCzhn+FyxRFz2I=
X-Google-Smtp-Source: AA6agR5rR1fVDlOBNX7yh43t51QfOGYtnAZYHCcN7/0XB9TOzAvuqMxXzIhZQAVtx7cQ2q4Z/gGHZLV9vDclvymdWSc=
X-Received: by 2002:a1f:9105:0:b0:388:353b:1b2d with SMTP id
 t5-20020a1f9105000000b00388353b1b2dmr4786178vkd.0.1661861943311; Tue, 30 Aug
 2022 05:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yv7aRJ/SvVhSdnSB@decadent.org.uk> <Yv9OGVc+WpoDAB0X@worktop.programming.kicks-ass.net>
 <Yv9tj9vbQ9nNlXoY@worktop.programming.kicks-ass.net> <9395338630e3313c1bf0393ae507925d1f9af870.camel@decadent.org.uk>
 <Yv9+8vR4QH6j6J/5@worktop.programming.kicks-ass.net> <CAPZXPQeYh_BrZzinsvCjHvd=szAsOXUmkVYS1tJC5vwamx+Wow@mail.gmail.com>
 <Yw37wnE19bAIhhP2@hirez.programming.kicks-ass.net>
In-Reply-To: <Yw37wnE19bAIhhP2@hirez.programming.kicks-ass.net>
Reply-To: martin-eric.racine@iki.fi
From: =?UTF-8?Q?Martin=2D=C3=89ric_Racine?= <martin-eric.racine@iki.fi>
Date: Tue, 30 Aug 2022 15:18:51 +0300
X-Gmail-Original-Message-ID: <CAPZXPQfrCQi5y0yS0kXNYajb_YyRGBPj1hhJEYEWWUsJxa-EHw@mail.gmail.com>
Message-ID: <CAPZXPQfrCQi5y0yS0kXNYajb_YyRGBPj1hhJEYEWWUsJxa-EHw@mail.gmail.com>
Subject: Re: [PATCH] x86/speculation: Avoid LFENCE in FILL_RETURN_BUFFER on
 CPUs that lack it
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, x86@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 1017425@bugs.debian.org, 
	stable@vger.kernel.org, regressions@lists.linux.dev, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1661861944;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1IU/Vmv+KZu7a/do/ie4ryReg1wzXp+x8m05MY3sN4=;
	b=szISCSm+ZyvjZfMveQ7tlIIc7sJnoVI9NOFu2fPo9lfwULv6qgFq5L+t8QcjqY/w0SXv93
	s9FcMqumaD/qTaTayyPtN7pFhfk7s9AOq5F8FhDeo/2yI3si4GIOu4QP5oz7WkFN6LxU7N
	Nu5RBjF0ZFEpR4jP0ZDE6rqmRC6/1Oo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=martin-eric.racine smtp.mailfrom=martin-eric.racine@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1661861944; a=rsa-sha256; cv=none;
	b=ITTTng9ykl4+SWZHqEU45LlUbNO3+0rfnaAYRhd4ApUjGAVDA8B5FwRmETCyewjAraYj/G
	NgG0wFoiNl98Szq80Tu3uEefHYYryoh8WNz/sFTj43t8aU9NPDgCC6xD6iBIy0gTUSYiAl
	P+wtcNCWURO0SXZE5Gn0epXHYcnyvEM=

On Tue, Aug 30, 2022 at 3:00 PM Peter Zijlstra <peterz@infradead.org> wrote=
:
> On Tue, Aug 30, 2022 at 02:42:04PM +0300, Martin-=C3=89ric Racine wrote:
> > On Fri, Aug 19, 2022 at 3:15 PM Peter Zijlstra <peterz@infradead.org> w=
rote:
> > >
> > > On Fri, Aug 19, 2022 at 01:38:27PM +0200, Ben Hutchings wrote:
> > >
> > > > So that puts the whole __FILL_RETURN_BUFFER inside an alternative, =
and
> > > > we can't have nested alternatives.  That's unfortunate.
> > >
> > > Well, both alternatives end with the LFENCE instruction, so I could p=
ull
> > > it out and do two consequtive ALTs, but unrolling the loop for i386 i=
s
> > > a better solution in that the sequence, while larger, removes the nee=
d
> > > for the LFENCE.
> >
> > Have we reached a definitive conclusion on to how to fix this?
>
> https://git.kernel.org/tip/332924973725e8cdcc783c175f68cf7e162cb9e5

Thanks.

Ben: When can we expect an updated kernel to security-updates at Debian?

Martin-=C3=89ric
