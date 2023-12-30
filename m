Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E761385
	for <regressions@lists.linux.dev>; Sat, 30 Dec 2023 04:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFhbrao7"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58dd3528497so4439821eaf.3
        for <regressions@lists.linux.dev>; Fri, 29 Dec 2023 20:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703909577; x=1704514377; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejfueo89WFs/oFJaApIa/W2r85V6qCPW0jGnmXIzsAU=;
        b=lFhbrao7PvPWgzDtMjNb1UnQwOLSo/WATc9o3MkYG2/9YGRA17nkjDd+NmwBFjG9rN
         alfK6oXrC++Zu97ijU0lIxqCKUIDITtaEVmNnVh8LKFj0AN4emvr3zlbWUPsteREaPsk
         3FeVYWwBQU7TGryB35YhatbJu+pJuCtkDow0lW4+qnDu0xcbE+kF7v/hJxLYCGwnYvxV
         QGb47OdBy7x7j877yBs+is/5Tl0St1l6Upv3cyGYhaGcKPONCORTlZ4sFJ0PfrlWb2xL
         JYbRKDGJcazrkggkVHZGKUWTebUPr+p+ezvJSviiNiWAUSDyGPEHiBCx6iyOBFvS0Pry
         8qLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703909577; x=1704514377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejfueo89WFs/oFJaApIa/W2r85V6qCPW0jGnmXIzsAU=;
        b=XYQoatDJwkGq8uYp8G72zOb+40a5k/O8bpvyj+RwQNvZsEdapIcV6WgIIs7obOZSQL
         KAxoEECFSO34tKPy9Dp8CvaU5WF0kJX//HtzG97G56zriGQXYbliXlpYoE8NtDFOo3FD
         JIquZbTetzpn7qmqMNnjPfNPKtDxeTecsR+g2YEt3hebRl9kDW6tz6+Fy4zTREigchvO
         m9md/0kNEVBru1X4SxN+0geT7ZXLs0KT/Bk4iGY0i0b+xEN88Iazb9Jfi9SJwkNbyA6M
         +4MVDV86rlqsLYXTsedp1mT413m0/LbHkV8LgeO5zhc4MsEcMXGZvMCPb90JvXEY+t2W
         qpMg==
X-Gm-Message-State: AOJu0YzA+cMejG18Os7hWIvJ7v7NJT6kWrkF37ZL/kGWtt3883GAy57f
	5tY2f1GIbcTFKXqLURrY1QDcolUq8ddaIZZnKMo=
X-Google-Smtp-Source: AGHT+IGs/93N6pvlZGycPQsHoufKzGa1iXlpHFU278prPiJa7vjr78QNNTc2J+L53QPoGAmP3vVaNU+gjcPX/5H9hMY=
X-Received: by 2002:a05:6820:2221:b0:591:a34c:f064 with SMTP id
 cj33-20020a056820222100b00591a34cf064mr7898267oob.6.1703909577411; Fri, 29
 Dec 2023 20:12:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMMLpeTCZDakqdkxm+jvQHxbRXhCYd4_PK+VVqMAmZHjSPuPRw@mail.gmail.com>
 <20231229163339.2716-1-dan@danm.net>
In-Reply-To: <20231229163339.2716-1-dan@danm.net>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Fri, 29 Dec 2023 21:12:21 -0700
Message-ID: <CAMMLpeTdYhd=7hhPi2Y7pwdPCgnnW5JYh-bu3hSc7im39uxnEA@mail.gmail.com>
Subject: Re: [REGRESSION] net/ipv6/addrconf: Temporary addresses with short
 lifetimes generating when they shouldn't, causing applications to fail
To: Dan Moulding <dan@danm.net>
Cc: bagasdotme@gmail.com, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, regressions@lists.linux.dev, 
	Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 9:33=E2=80=AFAM Dan Moulding <dan@danm.net> wrote:
>
> I think a maintainer will probably need to make a call here and decide
> how to proceed.
>
> > TEMP_PREFERRED_LIFETIME is an administratively set variable: The user
> > can change it to whatever they want whenever they want, and the
> > operating system can adjust it automatically too.
>
> Agreed. And the behavior it seems you really want is to prevent the
> user from administratively setting it to a value that is lower than
> REGEN_ADVANCE, so that it won't stop generating new temporary
> addresses altogether.
>
> But preventing the user from configuring it to a value that is too low
> is different from generating new temporary addresses with preferred
> lifetimes that are greater than the currently configured value of
> TEMP_PREFERRED_LIFETIME. I still believe it would be better, and would
> be in conformance with the RFC, to simply not allow the user to
> configure a too-short TEMP_PREFERRED_LIFETIME instead of tinkering
> with the lifetimes of generated temporary addresses.

In RFC 4941, REGEN_ADVANCE is a constant value of 5 seconds.[1]
However, Linux uses a variable regen_advance that depends on the
Retrans Timer value in the router advertisement.[2][3][4] Let's
imagine that when the user tries to set
/proc/sys/net/ipv6/conf/*/temp_prefered_lft to 3 seconds, they get an
error message that says "Sorry, the network requires at least 4
seconds." After a few minutes, network conditions change, and now 5
seconds is the minimum. Should the kernel just give up on using
private addresses? Or, the minimum might drop to 3 seconds, which is
what the user really wanted. Should the operating system tell the user
to change the value?

What I think you're getting at is that Linux might be violating the
spec by allowing TEMP_PREFERRED_LIFETIME to be less than 5 seconds.
The RFC says: [5]

> When processing a Router Advertisement with a Prefix
> Information option carrying a global scope prefix for the purposes of
> address autoconfiguration (i.e., the A bit is set), the node MUST
> perform the following steps:

> 5.  A temporary address is created only if this calculated Preferred
>     Lifetime is greater than REGEN_ADVANCE time units.

The right solution might be to make Linux use a constant value for
REGEN_ADVANCE instead of a variable. I think that's how it used to
work before commit 76506a986dc3 (IPv6: fix DESYNC_FACTOR,
2016-10-13).[6] If regen_advance can't change depending on network
conditions then it can't cause private address generation to randomly
stop working. I don't understand why the protocol would require
REGEN_ADVANCE to be a constant, but interpreting the RFC literally, it
would seem that Linux is technically non-compliant.

-Alex

[1] https://datatracker.ietf.org/doc/html/rfc4941#section-5
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/net/ipv6/addrconf.c?h=3Dv6.7-rc7#n1377
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/net/ipv6/ndisc.c?h=3Dv6.7-rc7#n1438
[4] https://datatracker.ietf.org/doc/html/rfc4861#section-4.2
[5] https://datatracker.ietf.org/doc/html/rfc4941#section-3.3
[6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D76506a986dc31394fd1f2741db037d29c7e57843
