Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53183E1D13
	for <regressions@lists.linux.dev>; Wed, 20 May 2026 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284469; cv=none; b=nVfggVKIHuSlGW0iS8kJ4Io6CW7MNbtBvaY9HhAUfjXg2W+Qg+9fwv/J1d/loTvK+sGwJCoIk0bh4q0ywIVlvi5jvWcjKyzZoIoxt3Gu35EokYV12FvP8nsvMmtj3lvFOuyXZXyoDNZKrdCkI6Z/mUONP1tmdx+8djlSLs75c+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284469; c=relaxed/simple;
	bh=9zR/Hf6z7N1IsGt+VW/yYO2sLyoz8qP7waAI+MYVktE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zheo9uylTrPJi/ZAdaZxiGCUx3IMARYdR61d1FUIKoKaEwTWQH6VOPy4UU3WCMfp2gWFzqn2jKbC5gZ4DjdHZdsryzvAvzelNLAzLkiLtceP7fyi5hEQYBfV7ipzOVObgtFA5KDrKE59w73uY+qcp/z19NoQzcC9Jy1H24GqjXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhFFd9jj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhFFd9jj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48fde648a71so36084485e9.0
        for <regressions@lists.linux.dev>; Wed, 20 May 2026 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284466; x=1779889266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfk/0mVcnY/X27KP5hrre9gbSIDn/b0aV1xxYD9Hst4=;
        b=OhFFd9jj+ZM1mQlVzVHLQcn7BHDhxz4n+3gcHWXnc2w15UjpZXmA2aJERWlvs1Z8he
         T1F0LEC8s/Rmv8Fvhhn00yxEPJltUxDg6Vo4dA9Fj4ZNXg4IjLkp1cg0rb1Yk6QnL7+q
         XdKgIa9ZCcrtZjJSfIAhrlK70Wwo3JejvzftG2ETtqN/HlKWAKOhDZIc2y3oUo/SC8t/
         MyXxTudmNCkYKYPxHyIN+Q4NuV3zWaQ3pVClhpal3shmIExywZbpIIN1ePB4qaDOrs/t
         e8juX35VwosuxkziEu6pN/v+9hiLBtub/8acLYfNB2wI/bywNpodoYlSPZ8APBTAEv4n
         PNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284466; x=1779889266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vfk/0mVcnY/X27KP5hrre9gbSIDn/b0aV1xxYD9Hst4=;
        b=dCPuQEkNgAHMcka8vWc4vVc16wndk1WnwN22jR9Rkvrc/DOysYO+5Dd9FRkVgyQoRh
         l++mrkwoujBciJlL3zOKo52OQ92ajUN7S1IQuSst09ahPkOEaFrlQJXMmIAvpFfMCPTt
         XjmUMFHenYnYS3PVAGOqH9g0CVcIuDxAjed9tf/1tMOXaH4xwzwbXwXBirZlewwr3Y1m
         /08GtHB3Z9i3j9fqVmExX7R3IMaSFHRCaXbIvL7qE8vrEzH8Fdzk+WHengxbIzJBMyfQ
         KTmTlaqyR0AG0tEaQ2Nq+weNQJMNUebHOP/L6gwHRAOh3E7WL5t6YBN0gkVoOigQyyLp
         Z1lg==
X-Forwarded-Encrypted: i=1; AFNElJ9eQ1TCf0O1gGLkkMbav4LflCEDEyubExMhzXaP8o13yyubdsagaCtC98A6b1ZqYOutr9cqtllYu8fDFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhLZNvYsh17fBHiQfPULBzV7HGkmod/DI0ZWLgazWKOx2ZgjMo
	wDpgi5jr6As69t8waLVA4xwJr0FSkAgsRqAdG1J6p9W2QAKAsBqR4j0v
X-Gm-Gg: Acq92OFGr5NkE0qhKIWv6l8OgAnJ7JaY5zua5qQII9/2/Q42BgHtzmzZLjlMlw2HsTS
	6s3yTBmSi++lXuoWo9Bro0h/hZa3OmjyZf9RF+fEi4txj6xlmavDm7t72VfCnUsVTeUFYODAV2f
	+wMyLxDNjqPGijmtOJsRwzaFcMQUuoAsvZbWL8ycOPDE4+us9gBtHg01S9WczFlEaFkpdSir/vF
	+wzqNyDJsjQsdfQUPhf7jfaMEzuWHFv/ORwr2TB0a3Za0iLwrHKys4aZ7GnQJmJtYdJYLy4EfqO
	7q3hsegksjPp/961ETdb+Phv+q2jMeYVAmZBIMsoJQLWaOTU5TSSgfnyqRYGf+5n5/D0rCtYUSX
	bknc6aHDmDGsYOUb604D++PsElQzkzqIA1wof4OltBJ1hVKtwXzuEcLjJM/MfG3UbXb5ilLis4N
	KSWNY/CvWjKrGooHNbBhGBJ0KFcXE3beI0g3GFO0pu5WjoX4z2BYByd/wT/3BWIAI0
X-Received: by 2002:a05:600c:1d09:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-48fe537fb44mr313902805e9.11.1779284466032;
        Wed, 20 May 2026 06:41:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab6aasm429607155e9.2.2026.05.20.06.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:41:05 -0700 (PDT)
Date: Wed, 20 May 2026 14:41:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Tony Rodriguez <unixpro1970@gmail.com>
Cc: davem@davemloft.net, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, andreas@gaisler.com, thuth@redhat.com,
 regressions@lists.linux.dev, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH 0/1] sparc64: unify thread stack sizing and add explicit
 32KB stack
Message-ID: <20260520144104.618c75ca@pumpkin>
In-Reply-To: <05e0e7a5-107b-410b-853b-883810b1be3e@gmail.com>
References: <20260519075809.8993-1-unixpro1970@gmail.com>
	<20260519110223.5aeb88e3@pumpkin>
	<05e0e7a5-107b-410b-853b-883810b1be3e@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 19 May 2026 16:57:04 -0700
Tony Rodriguez <unixpro1970@gmail.com> wrote:

> On 5/19/26 3:02 AM, David Laight wrote:
> > On Tue, 19 May 2026 00:57:54 -0700
> > Tony Rodriguez <unixpro1970@gmail.com> wrote:
> > =20
> >> This patch fixes a reproducible stack exhaustion issue on SPARC64
> >> that occurs during USB hub enumeration. This regression may have
> >> started sometime after kernel v6.12. With the default 16KB kernel
> >> stack, the following panic is triggered early in boot:
> >>
> >>      [   25.528399] Call Trace:
> >>      [   25.528403] [<0000000000433cd4>] dump_stack+0x8/0x18
> >>      [   25.528419] [<00000000004297ac>] vpanic+0xdc/0x318
> >>      [   25.528429] [<0000000000429a0c>] panic+0x24/0x30
> >>      [   25.528436] [<0000000000be2280>] __schedule+0xa8/0x7bc
> >>      [   25.528445] [<0000000000be2b60>] schedule+0x24/0x4c
> >>      [   25.528452] [<0000000000be6970>] schedule_timeout+0xc8/0xe4
> >>      [   25.528459] [<0000000000be3318>] __wait_for_common+0x78/0xf0
> >>      [   25.528466] [<0000000000be3550>] wait_for_completion_timeout+0=
x1c/0x2c
> >>      [   25.528473] [<000000001005e2f4>] usb_start_wait_urb+0x68/0x128=
 [usbcore]
> >>      [   25.528502] [<000000001005e468>] usb_control_msg+0xb4/0xf8 [us=
bcore]
> >>      [   25.528518] [<0000000010051180>] set_port_feature+0x44/0x54 [u=
sbcore]
> >>      [   25.528530] [<00000000100530f0>] hub_power_on+0xc8/0xe8 [usbco=
re]
> >>      [   25.528543] [<0000000010054fd8>] hub_activate+0x12c/0x644 [usb=
core]
> >>      [   25.528557] [<0000000010059438>] hub_probe+0xdd4/0xeb0 [usbcor=
e]
> >>      [   25.528570] [<0000000010062360>] usb_probe_interface+0x234/0x2=
6c [usbcore]
> >>      [   25.528585] [<0000000000a10a40>] really_probe+0x1ac/0x3b0
> >>
> >> This is caused by large SPARC64 trapframes, register-window spills,
> >> and deep call paths in usbcore. A 16KB stack is insufficient for
> >> this workload. =20
> > Increasing the stack size for all threads seems overkill.
> > That stack doesn't even look deep.
> > I suspect there are large on-stack buffers in there.
> >
> > Unfortunately the traceback doesn't print the stack pointers making
> > debugging hard.
> >
> > -- David =20
>=20
> Hi David. Any specific grub command line keywords and values, and=20
> functions you recommend for debugging this?=C2=A0 I would be happy to sha=
re=20
> Trace Calls, etc. so it is easier to reconfirm and zero in on the issue.=
=20

Without the stack offsets from the dump, look at the stack frame sizes
for the functions in that traceback.
I suspect there are too many that get near the compile-time threshold.

-- David

> -- Tony
>=20
> >> The new logic is:
> >>
> >>      SPARC64:
> >>          THREAD_SIZE =3D 4 * PAGE_SIZE (32KB)
> >>          THREAD_SHIFT =3D PAGE_SHIFT + 2
> >>          THREAD_SIZE_ORDER =3D 2
> >>
> >>      Non=E2=80=91SPARC64 with PAGE_SHIFT =3D=3D 13:
> >>          Retains the existing 16KB stack behavior
> >>
> >>      Fallback:
> >>          Retains the existing 8KB stack behavior
> >>
> >> Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>
> >>
> >>
> >> Tony Rodriguez (1):
> >>    sparc64: unify thread stack sizing and add explicit 32KB stack
> >>
> >>   arch/sparc/include/asm/thread_info_64.h | 28 ++++++++++++-----------=
--
> >>   1 file changed, 14 insertions(+), 14 deletions(-)
> >>
> >> --
> >> 2.53.0
> >>
> >> =20
>=20

