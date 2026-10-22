Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792679383;
	b=wQTRaMCT3nbOl/yKnZocpi48uGYL/fHNHj4wm5G6BqU2U3qRvQ7SvVijB5cCs3VJo0/d
	 JIniN3elHIS+/DrLMfhSdiso7kuISMxU5RAgrTiDMqUkOwfATlp5EQDZLXDNyLlf2Zd2T
	 x9juK5xDC6j33JrC8zHAI/1zwfSMVCXbn2+jQGGNV0UhF61h0rLACSOJTcQz5cXFW59kJ
	 DByOaInHAVWUzg74zJ5G0ywPANoPQ2tiURB+EzQjwLfo/e0Mz5nW49xgftWZyTJgulCww
	 MrKppLN3M5PEFHeKDL3d76Om6hCeIU8vSL80XfB4KCCE9YQQmqqCcCMRzh/v6aRd5aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=X57xiEbRfkeTM2gmq8dH6rxDoQcpfAmIPrvm3xA9pe0=;
	b=3Qbxt3mM7MIbc8aOVbI/tdc2Ebu4pL0qJoMnW7bWWPgfvDue867zKejkSHXFYlaB/mkL
	 8MDx0TtjtGhC+2yQDHCDUf4KBf+blCCaQfzTcHl/NZejWgLB2qIYr8YV4YDr4UGx8RWZ4
	 i+CABkEDQhnq3W4Wwjqz0Wx+yQTX6QY8GCg9PihtGkS2tl35Zw+l2plVpz2S64JYmklVM
	 XgKvyAbJGaC7JPm8Qafi9Sk7yv9/VTA/AZafE/eoLnOXJokoeg1yMR770vnSiUdRSolU6
	 S96Z+N0pkk+IN/xZoByLxHE6+dnqWw8PxfeupWsb3uFg89EToL2Lx4TqLuTu0qt+n/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r5N36CwM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A61606A319
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 14:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A61606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r5N36CwM
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-676858d42f8so1672426d50.2
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 07:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792679382; cv=none;
        d=google.com; s=arc-20260327;
        b=OfBluXJqCwv9XKQPyWJbXVu8hTBb12mEgXDjY3c8cDNg4QO8TMugOu2R6W5XPFy47n
         CFvamVAhtBelyzkeUW9D9RQOLlFKtsbN6rKqhB7Xsz876uxQQPbF2u/B0Izofax/yB2/
         t7vJf5a6VIZ3q3dSfvoiMs8hfOUFUQ58562c6y1M7++J99zXVKjnL+IWPbxDv6AeBabk
         gv80k4VeO17MMGWxGvfe7nB0sHXzUjXbehymXQCbn2BlL6ZxHhb8YBYyTE27MLebkQ9C
         Ibb7t6ft8t+GdZ1NMq6H/2qonKWqKCD0DICjTQeEjIwRsn8xGU9yrR6zuxCmPo1wkAVl
         cTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=X57xiEbRfkeTM2gmq8dH6rxDoQcpfAmIPrvm3xA9pe0=;
        fh=2IuiD+OJ4IXgqxDt5WgYhkkwGtM1Tti6w8lCUv1+TUY=;
        b=mhVsTN+4NQ1ipA3zmH/OlIvk7vKK70Nj6oU9LPTBeCiCKFQK12byuNs+3x9gzvpkph
         h0imyIySVgiJrwbX9dgNmQrAYvV+B4XcXqzy/jPSiz3m8R53xOYElXl2hqOH8ABWfqUT
         abdDmDfT+fMLoqSxtdT87an0nNDt7DWz1XAd5kUWf4Ve2gsdC36UHTd4998MMP7oQTQl
         kRwK/BQ9rLPXainbF9BUsl5+P+LO4DtYIeugkajyipYBrf5VCFsc45ATfbaf1ctuEZkB
         A7Gu4K/o2qDNsBucJ/2y51B6OfJlfVIlBSLSMaqzXc89JkaG+fFrGitoFNrb+WS/tjXj
         Dywg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679382; x=1793284182; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X57xiEbRfkeTM2gmq8dH6rxDoQcpfAmIPrvm3xA9pe0=;
        b=r5N36CwMQIkZYZqCtxUbLD6DEIXMzkhlsPx3Z2gvNq2yZFBM4YVD52K+90jzbJdhkr
         cLc77YJYdStEDxyxubN8ImZqM0sXYPX45SIy2WWEDVbaZCTVoBjJYudfMsKoiV7onj69
         bVYhXL96T4euXRSyWlXfrWmIqjznt3+GXelxFDKU5T4YtgxDlkZonSNgyBy7+Y334Nno
         Linasr2QI/6EFzwp3lBqmVRA7B1Y4/9//zjrRoMy9zTXTd+YdjVJXegsxcmIyoCXkDPN
         1eFoKFpnhUaPE2hLA7a62qv7GnOjl56N6hh3PSwDXq/B+CNgsuZutzhu/1ZZCyQNQwk/
         fQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679382; x=1793284182;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X57xiEbRfkeTM2gmq8dH6rxDoQcpfAmIPrvm3xA9pe0=;
        b=qTHnMIxUirLUxopP085mCDK73jbyyDMIMzXNUAoZnJrg6ughq4OD05X0YAkW/0mJ3O
         o5SlIeWm5nkbueuezwwRTh6qHKhJX3uR+Rd6ZTLRmnZfBLQ0H1FwDb7nQfem1rd+Bd63
         o1uS2biO6AA7WRtFc5/2U97sCoIpIHbHK/fJYSvcyIOweambEkHU20qENDdTHjKnr3eU
         kW3K37PQaqspv+2RuJFRMlrz52aR5ayl5TIDGC/+mR645Y70TvNTC/MZo7x3PFp05k3V
         csiUwkZEydvqGECmpRiTTnDJGa0OwP9DuPtdihmMjFJSxuRr0s6EYCkD6JjJBPQNbes8
         M9BA==
X-Gm-Message-State: AFq9FYIbX/GwUHd/JR7nyUcynFnrY3vZ6gx158p0IPOWanMw5BkZcJND
	XiyOWjjgzuGU5+BYwGgN788X+KNf1joC2uhR4O1WChYJrGNpHBBcj5NP9z6SFtkY8NeU36BLvaY
	1191RmcXOPY0IhNKCu7FqEhqwJ2A8Jkg=
X-Gm-Gg: AYBFou0NmQf7ifHgFxk3XzO44soaF0FSm0/yCyg22UXiLmrY8g8Rj4V4L7jcJ/2dFG2
	zBBNKqzu99QdayF47LWtSmMw0Y+keec0LYAUTJFaEDg7+0/KSes4Wk0Wq81dO3nobSR29PmiVko
	kEFyrbuPNASqm2hUyk3n8AIJ1Cwnn1yd3SvTCL7+Ewe4ZtkgEMyaYNtojlNCLSznsm8rMgWbCZD
	+48eFb6FDZKSRGg1eo/rXR/SarDqjKzwC0S6AmeELh/JzVqf8DV1X65kfziEy6/Rac1S3IhB0xV
	U7v1WTssOUGejAiRoAsvVHaumcNSm2hTre/LWsG28iNs3Z40fhuDqiqqQJRobQiX79JXYHyNgWT
	WsGOXQbC3O7MIIFTO/1hQvVagxGVxrsbiaOWv5Rtj/fq/F1cjStQq/wVWhWYxhS+z5ZjTSNrijX
	gqEVuU
X-Received: by 2002:a05:690e:80a:20b0:676:858d:35d0 with SMTP id
 956f58d0204a3-67a0e4ceba4mr1401129d50.59.1792679381266; Thu, 22 Oct 2026
 07:29:41 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Julien <julien82453@gmail.com>
Date: Thu, 22 Oct 2026 16:29:29 +0200
X-Gm-Features: AclHuK8kn-teVkT41gTygozI5r5_APcWEEF49YpV8Zuy9c-TKU2SyO_VGzaCmjU
Message-ID: <CAJOGg3x1KWjXrMpXoCDEMAV10i4Utk8E+hoJx7UW6Lr3uDkbEA@mail.gmail.com>
Subject: [REGRESSION] hp_bioscfg causes boot failure on model HP Laptop 15-bs1xx
To: platform-driver-x86@vger.kernel.org
Cc: regressions@lists.linux.dev, jorge.lopez2@hp.com
Content-Type: text/plain; charset="UTF-8"

Since commit 467d4afc6caa ("platform/x86: hp-bioscfg: Fix automatic
module loading"), the hp_bioscfg module is automatically loaded on HP
Laptop 15-bs1xx.

This module causes the system to hang during boot. Blacklisting
hp_bioscfg allows the laptop to boot successfully.

Sometimes the screen will go black but there is no kernel panic
screen. When I get to see logs, there are no messages related to
hp-bioscfg. I suspect the system crashes before it can display them
because on a normal boot the next message I would see is "Module
hp_bioscfg is blacklisted".

I think the hp_bioscfg module should be disable on this hp model until
a fix can be found.

#regzbot introduced: 467d4afc6caa
