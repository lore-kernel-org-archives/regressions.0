Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D4B2F46
	for <regressions@lists.linux.dev>; Tue, 30 Aug 2022 11:42:27 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: martin-eric.racine)
	by meesny.iki.fi (Postfix) with ESMTPSA id 48488205B1
	for <regressions@lists.linux.dev>; Tue, 30 Aug 2022 14:42:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1661859738; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8x29qDSobRrZnNTFzvK22EpsdeXafMwe0vNxp+CuHk=;
	b=RF0LxyY0t0syMttP7Rk6qFyB/xKRe2IrwMEI6ljlc4N4wp4fv9lkBa2VS26nB8nafuQ9gB
	XPMYx5rgK6msc8PpBM+fwgIncleE2TkoMWCpK7NjgK9BMTDuEJ8pGjqVNHBcOEzgcmWjlM
	VtBcnB7wsWkotF/+SNGGwrkUhCNDnws=
Received: by mail-vs1-f48.google.com with SMTP id k2so11172051vsk.8
        for <regressions@lists.linux.dev>; Tue, 30 Aug 2022 04:42:18 -0700 (PDT)
X-Gm-Message-State: ACgBeo3NRGlGy/x3BVW3YgQhikI/byi32QIbnU2FMmfyPSqJ+XGpbAfZ
	xJjUNOalRxN6Az7Ztv0SZfu/jO60XIyssONo0d4=
X-Google-Smtp-Source: AA6agR4VD5Lnft09dq3b5f+oM/pXgIjX6KxreLQ6ad98VlqSpPYR6W4RHhwRaT5agiPPngDv/ewsiwy2y2WH/pTLhgM=
X-Received: by 2002:a67:e9ce:0:b0:390:e35a:8b57 with SMTP id
 q14-20020a67e9ce000000b00390e35a8b57mr2616999vso.40.1661859736062; Tue, 30
 Aug 2022 04:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yv7aRJ/SvVhSdnSB@decadent.org.uk> <Yv9OGVc+WpoDAB0X@worktop.programming.kicks-ass.net>
 <Yv9tj9vbQ9nNlXoY@worktop.programming.kicks-ass.net> <9395338630e3313c1bf0393ae507925d1f9af870.camel@decadent.org.uk>
 <Yv9+8vR4QH6j6J/5@worktop.programming.kicks-ass.net>
In-Reply-To: <Yv9+8vR4QH6j6J/5@worktop.programming.kicks-ass.net>
Reply-To: martin-eric.racine@iki.fi
From: =?UTF-8?Q?Martin=2D=C3=89ric_Racine?= <martin-eric.racine@iki.fi>
Date: Tue, 30 Aug 2022 14:42:04 +0300
X-Gmail-Original-Message-ID: <CAPZXPQeYh_BrZzinsvCjHvd=szAsOXUmkVYS1tJC5vwamx+Wow@mail.gmail.com>
Message-ID: <CAPZXPQeYh_BrZzinsvCjHvd=szAsOXUmkVYS1tJC5vwamx+Wow@mail.gmail.com>
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
	s=meesny; t=1661859738;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8x29qDSobRrZnNTFzvK22EpsdeXafMwe0vNxp+CuHk=;
	b=h4Slbyj1TCVSUE04eLWVpfivYkFXwQGKO1py1rdT/+V6BsQH9pKueWyAPa5HUmVdxjTIDh
	k3CZo7f4la9U07a5fSub2Bq/txk9p1lMDCn5VAECFvnfF2WBJAaUCPYOFIAq6IA5BEPe7x
	KoP6+j/OmwyNoZc7iQBymH8FIAntMe0=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=martin-eric.racine smtp.mailfrom=martin-eric.racine@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1661859738; a=rsa-sha256; cv=none;
	b=G5TqiDaucegVQJWdESlh+YloygkSunqRLLWOgJtEXXKYYpXR6ZxKWXfQq1mcD2ca1TnY3P
	pcRTK/MpbdCNv4vjJBtMNTahjuz1g/VD2pGwJG81yvjyP0rbR4G/SfpyqZCmODumD2GzzO
	b1Uj2wfdAp+CodvRA8XMdxX5K2cw4ZM=

Greetings,

On Fri, Aug 19, 2022 at 3:15 PM Peter Zijlstra <peterz@infradead.org> wrote=
:
>
> On Fri, Aug 19, 2022 at 01:38:27PM +0200, Ben Hutchings wrote:
>
> > So that puts the whole __FILL_RETURN_BUFFER inside an alternative, and
> > we can't have nested alternatives.  That's unfortunate.
>
> Well, both alternatives end with the LFENCE instruction, so I could pull
> it out and do two consequtive ALTs, but unrolling the loop for i386 is
> a better solution in that the sequence, while larger, removes the need
> for the LFENCE.

Have we reached a definitive conclusion on to how to fix this?

Martin-=C3=89ric
