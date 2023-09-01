Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84E0CA4D
	for <regressions@lists.linux.dev>; Fri,  1 Sep 2023 22:48:37 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a9f88b663cso1611230b6e.3
        for <regressions@lists.linux.dev>; Fri, 01 Sep 2023 15:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693608516; x=1694213316; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eONqcjJk6d5/5qOWzNU6WGhoVewodjNEM3WP2cqp3kM=;
        b=W5DqzXA8DBdm7pEEYb78i6W91ZdUPhMO4u+FvGOF6XKnc77dJTJ01w0aXm2wOUDRPZ
         ONg3ZgoT8jvCi9IOyuGJ3MU3WsmNxaQdKe11ZNeun4usBTnNuoVfGZ0s9M4fDgKkFd+s
         XoVqfVzdD9yvonSPoyXbX9PMWvblGOxieNxa1JoQ6zWKPW5siHHDc+z9hCn0yYhk7Q+e
         dRFDT61unRU4Ch578hN9C6KlJAAgCS0hnfaaU/s0lPwFvg5mnTsRUhYj5gvmLqYC57uf
         //pQzif86A91YwVVZAPtyAyE2BLpl1rWjJHKdQwcDpOMagiakrMkBcGBn3hzViobKcNi
         9v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693608516; x=1694213316;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eONqcjJk6d5/5qOWzNU6WGhoVewodjNEM3WP2cqp3kM=;
        b=b4I8MwCReEhRZINarA2mmZQX5a004mGPgoMNy6tuY81nW2dP7Y0Z1IGfZXXn50oKks
         ZGyw/CF6H4eW1g+GxZbDVP1ICv6sT3C5wbPRiOJMCBmOjre3qWyMDSDsBENeDclXyMpv
         UISpJHFkKNLD3pQTqA0jZ1QAhNBX+nywjg/6a8QswoNYKJ8oBKWLMiPhF1r9JcC1sono
         UiDCSU0SMX+lK9z9JQom6CxNpCJhoaiPPujrlIhbR0JbDI79udc56IElqrmQ3/cQQUGg
         ZjGIjQINu7VJXLx6rtCKVIt1M8bajWzgg9ZEoWxf4VGiFybUnATibBLJR7Jqu3mSrSxc
         lAQQ==
X-Gm-Message-State: AOJu0YznFtm2Ye5EQhGbqwNYIj816Pob8JOPqSQokDNsGhihCrLkGu9j
	/gQx9DHLUrOVYxZM55M7jjp/nA==
X-Google-Smtp-Source: AGHT+IHIRsnpNF/YhT6AjUk2xXQfDzfvwC68NkNoXY8yFOH/ftGxUh9fhjMkLdg6gqKRvn70ENI6Ew==
X-Received: by 2002:a05:6358:5207:b0:13a:a85b:c373 with SMTP id b7-20020a056358520700b0013aa85bc373mr4551287rwa.18.1693608516272;
        Fri, 01 Sep 2023 15:48:36 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id i193-20020a0ddfca000000b00583d1fa1fccsm1332554ywe.0.2023.09.01.15.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 15:48:35 -0700 (PDT)
Date: Fri, 1 Sep 2023 15:48:26 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, regressions@lists.linux.dev
Subject: Re: 6.6/regression/bisected - after commit a349d72fd9efc87c8fd1d16d3164752d84a7275b
 system stopped booting
In-Reply-To: <CABXGCsOPcu8R9rpdihNR5r822FAHBZ42wBa5XUa5RDVierD_tg@mail.gmail.com>
Message-ID: <5e4d50d4-978-ce54-e1ae-40f7117dbf3d@google.com>
References: <CABXGCsNi8Tiv5zUPNXr6UJw6qV1VdaBEfGqEAMkkXE3QPvZuAQ@mail.gmail.com> <3548ca67-ce58-3bc6-fef5-348b98d7678b@google.com> <CABXGCsOyamBvQ=Y-M9HQBTfEDfaRwGqzXqayBm7L259Q+t+gJQ@mail.gmail.com> <98eb1ba4-5bd3-ee7-1a88-47b054dc938@google.com>
 <CABXGCsOPcu8R9rpdihNR5r822FAHBZ42wBa5XUa5RDVierD_tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463760895-45710664-1693608515=:22700"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463760895-45710664-1693608515=:22700
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 1 Sep 2023, Mikhail Gavrilov wrote:
> On Fri, Sep 1, 2023 at 2:08=E2=80=AFPM Hugh Dickins <hughd@google.com> wr=
ote:
> >
> >
> > Sorry about that, please try this instead, adds EXPORT_SYMBOL(pte_unmap=
).
> >
>=20
> Thanks, now I have a working kernel builded at commit a349d72fd9ef.
>=20
> > I've never used stackdepot before, but I've tried this out in good and
> > bad cases, and expect it to work for you, shedding light on where is
> > going wrong - machine should boot up fine, and in dmesg you'll find one
> > stacktrace between "WARNING: pte_map..." and "End of pte_map..." lines.
>=20
> Interesting, I checked twice but I didn't find any entry with
> "pte_map" in the kernel log after applying your patch.

That was very disappointing: I found it hard to explain, but was thinking
of sending you a similar patch, doing the same check on all your 32 CPUs -
maybe the stall being on CPU 0 in your photo was accidental.

But now I think I have the shameful answer (which studying your dmesg,
and the 82328 jiffies at 86 seconds in your photo, did help me towards).

That mm/pagewalk fix I put into 6.5 has a grievous oversight (and a
video of your failing 6.6 bootup would likely have shown a WARN_ON_ONCE
from the underflow in __rcu_read_unlock()).

Please revert the debug patch I sent yesterday (or earlier today), please
try booting with this one on top of a349d72fd9ef; and if that's successful,
then please go back to your original Rawhide tree and apply this on top of
that, to confirm that boots to a working system too - thanks.

With my apologies,

[PATCH] mm/pagewalk: fix bootstopping regression from extra pte_unmap()

[ Commit message yet to be written: it's actually something to go to
6.5 stable, to correct i386 CONFIG_HIGHPTE there - though we know of
no case where it is actually hit. ]

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/pagewalk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 2022333805d3..9e7d0276c38a 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -58,7 +58,7 @@ static int walk_pte_range(pmd_t *pmd, unsigned long addr,=
 unsigned long end,
 =09=09=09pte =3D pte_offset_map(pmd, addr);
 =09=09if (pte) {
 =09=09=09err =3D walk_pte_range_inner(pte, addr, end, walk);
-=09=09=09if (walk->mm !=3D &init_mm)
+=09=09=09if (walk->mm !=3D &init_mm && addr < TASK_SIZE)
 =09=09=09=09pte_unmap(pte);
 =09=09}
 =09} else {
--=20
2.35.3
---1463760895-45710664-1693608515=:22700--
