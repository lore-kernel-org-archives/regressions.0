Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0877B1FC0EA
	for <regressions@lists.linux.dev>; Tue, 22 Apr 2025 21:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745358571; cv=none; b=jEa/tTqNJs8lxe0Z+x1+0V+ml1ks4WhaLhZlQ5SY07s5jsGYUKD7FuOPn2OlnnRZ/++qCfHjTcF3Pa2dY7b2Hm9VncDbcw+/kHuaRCD7+xZKwddZy85MgpsVCHRUHTBHUCGyhvibn5KAy2P7PAV4ij3+tHK9nmKTe5N0MeS+l1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745358571; c=relaxed/simple;
	bh=sG7YJMva/w4l3cfCNfOiczfRXXTwbAHBKnI5Bzj7KRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otJKMPVsGpXy6h2v9IRLfgWgeJC5TYqgWsMdbU1j1Ud+8xE/IoaLJXbaPqMrJg4VrxEmSPYdcm1zyNd1J6GO6OetYR822Gm900FRGk6SsOYIGGkfd1o7G/kKkkrL3e5u6FunzFiKlssuee+fa63CfufJSsQ4q3JmU4NCYSukRqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbEESW5i; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbEESW5i"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30332dfc820so6914985a91.2
        for <regressions@lists.linux.dev>; Tue, 22 Apr 2025 14:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745358569; x=1745963369; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9dYvt2Xcrh+kbYqRYnlS/5tyT+BexXkaGSTJNxwW1ck=;
        b=VbEESW5iUGa2gCdK1+m/eDgqY0wiiKSQnTy4pQdtQba5Mgq5RwfHEFzkLZjKLQcTUW
         jaTbivJeQDKHPet+8qZBhdMtpYc9JGq7rCZgNXhNxYZHO7rzjW43TxdbosC/u4n7rSEV
         aKYYnST9w3W2b3mdgvpkIwGj+LTyU+AwuG8feFtyP02LYoOGb65SJRgcUgq9s93FCEUC
         g+RVUGsfPr4iKtWQyOPO6MftjPwTIgHqDcLz5uJPKb/qvrUE2mFoNmkdZzXEWzHKQ1Y5
         sTHHNarW2j30FLfv4juy0jX3xgIUUAdpecbFCi5vgK9CU5lbHlt+aKW/qxR4C+Q4rhc/
         GfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745358569; x=1745963369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dYvt2Xcrh+kbYqRYnlS/5tyT+BexXkaGSTJNxwW1ck=;
        b=EYRzKox6z5ETB9vvyjiqia5ehnebzmGtSLAZ6SyX7Ja6i0/xqgHQqdC7rolLk4p2ZK
         frvGwdSyCC36mn9A0UtjnSJkEbdPFH7aESntwb60oF0iX4crU8tjYTGDGkuiABFvwhlp
         LQFzvGz5tQiqpL3FYUrjXUN2jaxRkmesZZ1u2s4YMYlk5GmXI6rqVvKKgSr9wvi0Oc7V
         ilw2JkhkN58te6BdKh4bqq6cVHol8imWi4Wjqd5bmsTkHAQDYPpq4oxmczCPMwflfB0t
         /2s6gmM5Ey6Rrepl4ylRPD3ED0wVEHUQY3+68vxL4b/rbn7cbHQ7px6iqrWWRIWBSID5
         I0XA==
X-Forwarded-Encrypted: i=1; AJvYcCXd15ZQMpeR2yu7CbhrLEtoWuzFnCcw7MGeLKyh6PIlHKwfU7LHCsx/cOi8s/QOKrhu+dIIv6V+32ubiw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq/VTK4g92gnkZkR3voo1kkGGbZGMfnaDmNNZTUDfloETtcN4g
	xcL501EdhDed5vCZ3tRXKd5OfiZgxf1YmNpOwzgWztqGpgkLdcRy
X-Gm-Gg: ASbGncuXBuBVYeBQt7NW1ZgDiVbBLbyK/SGDiS+s73zJrFCa7KwbVwPQti70Op+QrUc
	/V6S0amUkRmyNiou1eyi+5Le1wDba35XDqObv5GCrdrPenUDG+R3KcfGNhArM0D6vhz7RbDO3y4
	c32u08L38u7nAohmXvZgENATyB4qa7ehnUY04hbMQLCAWZeL+GqixW1zNQWic5X/U5s2U4x6kzf
	enpFH50S5WLJFd1UNctwoJTx0JXvO9aM1Z9nEZbbXfbOXYvnp3AcMDiTArUX1obmP2Fm/nfZZEP
	ZdtuiVujMaNLco3xan75sMV8XKq2srsMB3pl0tofDpzd2ncuBsWwiHc=
X-Google-Smtp-Source: AGHT+IEa5UJBk8pFAAEn17DT7zrqf9LgrhW1yVg3/4Nr/d7c82A8poo6UJuKjfvQ33n45llJ3lLYzw==
X-Received: by 2002:a17:90a:f945:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-3087bb57aa9mr27886530a91.12.1745358569302;
        Tue, 22 Apr 2025 14:49:29 -0700 (PDT)
Received: from localhost ([129.210.115.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4a46sm90649335ad.147.2025.04.22.14.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:49:28 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:49:27 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: "Alan J. Wylie" <alan@wylie.me.uk>
Cc: Holger =?iso-8859-1?Q?Hoffst=E4tte?= <holger@applied-asynchrony.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>, regressions@lists.linux.dev,
	Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Octavian Purdila <tavip@google.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	stable@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] 6.14.3 panic - kernel NULL pointer dereference in
 htb_dequeue
Message-ID: <aAgO59L0ccXl6kUs@pop-os.localdomain>
References: <20250421104019.7880108d@frodo.int.wylie.me.uk>
 <6fa68b02-cf82-aeca-56e6-e3b8565b22f4@applied-asynchrony.com>
 <20250421131000.6299a8e0@frodo.int.wylie.me.uk>
 <20250421200601.5b2e28de@frodo.int.wylie.me.uk>
 <89301960-1758-5b2e-6d91-81ef06843e14@applied-asynchrony.com>
 <20250421210927.50d6a355@frodo.int.wylie.me.uk>
 <20250422175145.1cb0bd98@frodo.int.wylie.me.uk>
 <4e2a6522-d455-f0ce-c77d-b430c3047d7c@applied-asynchrony.com>
 <aAf/K7F9TmCJIT+N@pop-os.localdomain>
 <20250422214716.5e181523@frodo.int.wylie.me.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422214716.5e181523@frodo.int.wylie.me.uk>

Hi, Alan

Although I am still trying to understand the NULL pointer, which seems
likely from:

 478                         if (p->inner.clprio[prio].ptr == cl->node + prio) {
 479                                 /* we are removing child which is pointed to from
 480                                  * parent feed - forget the pointer but remember
 481                                  * classid
 482                                  */
 483                                 p->inner.clprio[prio].last_ptr_id = cl->common.classid;
 484                                 p->inner.clprio[prio].ptr = NULL;
 485                         }

Does the following patch work? I mean not just fixing the crash, but
also not causing any other problem.

Please give it a try.

Thanks!

---

diff --git a/net/sched/sch_htb.c b/net/sched/sch_htb.c
index 4b9a639b642e..0cdc778fddef 100644
--- a/net/sched/sch_htb.c
+++ b/net/sched/sch_htb.c
@@ -348,7 +348,8 @@ static void htb_add_to_wait_tree(struct htb_sched *q,
  */
 static inline void htb_next_rb_node(struct rb_node **n)
 {
-	*n = rb_next(*n);
+	if (*n)
+		*n = rb_next(*n);
 }
 
 /**
