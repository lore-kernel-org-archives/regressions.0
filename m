Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6CC23CD
	for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 11:33:53 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: martin-eric.racine)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 9A1C91B002D7
	for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 14:33:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1660908824; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkx3l2Jsr5sn7pf41ZGYs34bVyvOXQOv8D/DfIbdLs4=;
	b=OMB7TjIGOT8OYyXxXFUHFnH8ma8FwUQsX2fR1x+Jj0WO1bDBeO/FiCUZMmGIajyFnjI0d7
	v9MzWxqa0KVI/6toESREPDCJHYzl9Aehn3ags+xOVAsG3SoU5H1UdJgGEJOLn71OOJRJkp
	1wmyMmUGg3wmgyG4tPz2KurMNrtmkVhFZod7KYphu3tmLc7nnZS2epeMv028ps2+cTdUs3
	kH183H8O75VVaWjB9niCDBUJu44KiZNLqBamZmVVD1bqjXgduV5PETA2LBO4U22eIN/iPs
	zQX+L/yq7jfhARtjIh0ooPNJksrsVw89J3+ks8OceMxcZFPIRRwIYGsDep62rw==
Received: by mail-vs1-f54.google.com with SMTP id q190so4161744vsb.7
        for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 04:33:44 -0700 (PDT)
X-Gm-Message-State: ACgBeo1LqbdIYMxWWORyqCStovpcgmylEfsKAEB2CUko99ccDt3YH9jt
	epeRJY+3eIlHAOYBG8UcHsKV8keqhg8ZAxugUSU=
X-Google-Smtp-Source: AA6agR6W0iWWXzz2sZkerBMRwwozpy0qrrVZxzp7D6cWhuSVrTiOEAnBUCz0CDdjQq7II9fbkjswjtsDDlClM4nra4o=
X-Received: by 2002:a67:c819:0:b0:38f:784f:c377 with SMTP id
 u25-20020a67c819000000b0038f784fc377mr2234906vsk.15.1660908823365; Fri, 19
 Aug 2022 04:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yv7aRJ/SvVhSdnSB@decadent.org.uk> <Yv9OGVc+WpoDAB0X@worktop.programming.kicks-ass.net>
 <Yv9tj9vbQ9nNlXoY@worktop.programming.kicks-ass.net>
In-Reply-To: <Yv9tj9vbQ9nNlXoY@worktop.programming.kicks-ass.net>
Reply-To: martin-eric.racine@iki.fi
From: =?UTF-8?Q?Martin=2D=C3=89ric_Racine?= <martin-eric.racine@iki.fi>
Date: Fri, 19 Aug 2022 14:33:32 +0300
X-Gmail-Original-Message-ID: <CAPZXPQe+MPTGD3MH1HORvCZa08HhdbWy=zh7rLSCwA6edM2Ccg@mail.gmail.com>
Message-ID: <CAPZXPQe+MPTGD3MH1HORvCZa08HhdbWy=zh7rLSCwA6edM2Ccg@mail.gmail.com>
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
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1660908824; a=rsa-sha256;
	cv=none;
	b=E7dbA9FXD/wNHW1quxJc2eS/ojby8uSml1ekayz73MJaFS2h2DWrryhVeMq1dsBGQGqMO/
	NNbaYdbs3/AYMybpnay7tA9wLoEjLw3gjBPfMXGBFzc1+mJPd9/vj742bWTqa5sUdRWDeG
	c3U/BJRzcgPNtW5lcmni6hQbHIFztPyRALPUMKdhsDQj+DkrOnYJN9Rlm4DLDULIlIAoIm
	wtuTcZ6jMQ7PeFG3ojA8MAXi38pKaxJyjdPgwCM4ty+bVBq4kP6i87rst1eBAx9IrtSCwc
	E7ZysLeoTg05P8w5avJAIxz1uXK9tD8MKtD67d8B50FWj8keAJNc1bJQ1F5xCQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=martin-eric.racine smtp.mailfrom=martin-eric.racine@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1660908824;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkx3l2Jsr5sn7pf41ZGYs34bVyvOXQOv8D/DfIbdLs4=;
	b=vswx6IhlHhJ0+6HYba8K02t3m9yt4xgQgQHWS83Gy5iMVPmY1Ltv2mtqEIkxxUuweOnKof
	xGaJatqesMuSfifKos2g3L8sqp0kojcPUBSavVXcU4d5F7LLy9wnUxnx6+58ONih2L0+S7
	07pCCIFFMfvYCi5G6ATjwKt3dm7BEZBxtUh0gyFGzZfsW/SobqMNQWZ+ElUj/g/diFa7pn
	qE/x3CphA64ub7nxaOXkeWoMHdAtcaaM3a3gEnGeZfrMlNFD/0m+C4nKWI07jw8XGnZy73
	boH9tnl0GonK/uKc93/O54rd+fpcKQ/44lKy8VLWCXEMOYL7cgUGHwg+LeB/yA==

On Fri, Aug 19, 2022 at 2:01 PM Peter Zijlstra <peterz@infradead.org> wrote=
:
> I'm not entirly sure what to do here. On the one hand, it's 32bit, so
> who gives a crap, otoh we shouldn't break these ancient chips either I
> suppose.

This is something that I've repeatedly had to bring up, whenever
something breaks because someone meant well by enabling more security
bells and whistles:

x86-32 is by definition legacy hardware. Enabling more bells and
whistles essentially kills support for all but the very latest
variants of the x86-32 family. This is the wrong approach. The right
approach is to accept that building for x86-32 inherently means
building for older and thus less secure architectures.

Martin-=C3=89ric
