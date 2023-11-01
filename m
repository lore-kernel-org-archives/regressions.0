Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2622F7F
	for <regressions@lists.linux.dev>; Wed,  1 Nov 2023 05:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoXOiS12"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53dd3f169d8so10019192a12.3
        for <regressions@lists.linux.dev>; Tue, 31 Oct 2023 22:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698815918; x=1699420718; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8jpkMwCXqhfiGZN0qlr18CaGkiQXpOM96Yew3hJKrCw=;
        b=IoXOiS12IkrSvnbkqV2pPyboWpXdcJpF7ggEeQAFKwLpgFXUpluAkT3H/YlU8Zupmb
         PZpqFcOweo4lYkCX6CmkFXGL69hrVteEQZcDAWc6FH8wredW5TgHydVyGGF89lyuupk5
         7Edzc6QG1rCOGoxAQIfR3T448L4cIiQHszV3k66b/SpbVCtiH1y84O4/DoDhWhHx2QdN
         I+lyarzMuogmX/19ozhUB7Yvpmkx1jjINvs2vgjNR5SwfOMWci2Izjygi7OhPMLqMypa
         GEhKsieJl2YaExZkocbsvIsYVCI9CeRlwGBbXPXoVFwjy5ve0EIY1KKmjZ1Jr5QSo+nB
         LrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698815918; x=1699420718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jpkMwCXqhfiGZN0qlr18CaGkiQXpOM96Yew3hJKrCw=;
        b=u/lmdDewV7HZz6Ch52ESzP7cjhF9ysCE0tDC0+i9TSRQwXQlniwLAUwtEdUl4VLk/U
         cnxGfLWo2sJUPIKEAu2TCLUA/uwGPOBJ5YWu93gORVO+4E+Fw4chueq++5e8OQ2vs8+b
         w3oLfEzqHOJfL4quOz7BTYu0SOBobPSuKSSdkJucQUpVnUlljPT+MMMZi/sgtPngtxVU
         5zL3xXtrRPViJH+st2LYIWb6jTmz8KkrEbCm2wsShhQicr3OG9WYhUEc9L1blQaNfgdT
         86d+wyid9c6d5g8AYsrsHKllGnMK3F+3ogZUfgO+l5tM4iidl4RLcL3n2aeSkIMEMXeo
         WPlA==
X-Gm-Message-State: AOJu0Ywtw3ee2ivRU7OLKowDP9NW7g2oo6B+Udqqv7cTgBRqMVU3wTB7
	Cm2y6QNKjIQocSx5uJuEKTfKNmyt6/c2kRrSATSQQ17NQkM=
X-Google-Smtp-Source: AGHT+IFOZm77gF15cdLthwaJNp3/RzBOfz1HO0z6blJPnT8d/NRXXF8t1UCwkQ6Bnw3iGduYX1BBMDC7hW/Hw126G/Y=
X-Received: by 2002:a17:907:9814:b0:9d5:9065:90aa with SMTP id
 ji20-20020a170907981400b009d5906590aamr920884ejc.76.1698815918029; Tue, 31
 Oct 2023 22:18:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZUF8bYTl5SBlbBBJ@debian> <20231031222455.mbhbhxiykq7dnuvl@moria.home.lan>
In-Reply-To: <20231031222455.mbhbhxiykq7dnuvl@moria.home.lan>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 1 Nov 2023 05:18:01 +0000
Message-ID: <CADVatmMc-ZjPj0oNEidG4JK+k6YZ7XXPmMCCuYe_fnJ83xV5pw@mail.gmail.com>
Subject: Re: mainline build failure due to 5cfd69775eb5 ("bcachefs: Array
 bounds fixes")
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Oct 2023 at 22:24, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> On Tue, Oct 31, 2023 at 10:15:09PM +0000, Sudip Mukherjee (Codethink) wrote:
> > Hi All,
> >
> > The latest mainline kernel branch fails to build arm64 allmodconfig
> > with a native build on an arm64 host with the error:
> >
> > In file included from fs/bcachefs/btree_io.c:11:
> > fs/bcachefs/btree_update_interior.h: In function 'want_new_bset':
> > fs/bcachefs/btree_update_interior.h:274:36: error: array subscript 0 is outside the bounds of an interior zero-length array 'struct bkey_packed[0]' [-Werror=zero-length-bounds]
> >   274 |   __bch_btree_u64s_remaining(c, b, &bne->keys.start[0]);
> >       |                                    ^~~~~~~~~~~~~~~~~~~
> > In file included from fs/bcachefs/bcachefs.h:206,
> >                  from fs/bcachefs/btree_io.c:3:
> > fs/bcachefs/bcachefs_format.h:2344:21: note: while referencing 'start'
> >  2344 |  struct bkey_packed start[0];
> >       |                     ^~~~~
> >
> > git bisect pointed to 5cfd69775eb5 ("bcachefs: Array bounds fixes").
> >
> > I will be happy to test any patch or provide any extra log if needed.
>
> Following patch should resolve everything:

Thanks, and I can confirm that fixes the build for me too on the arm hosts.

>
> -- >8 --
> From ad77f25f730ec9a0eb04be5adc591628654b85ae Mon Sep 17 00:00:00 2001
> From: Kent Overstreet <kent.overstreet@linux.dev>
> Date: Tue, 31 Oct 2023 18:05:22 -0400
> Subject: [PATCH] bcachefs: Fix build errors with gcc 10
>
> gcc 10 seems to complain about array bounds in situations where gcc 11
> does not - curious.
>
> This unfortunately requires adding some casts for now; we may
> investigate getting rid of our __u64 _data[] VLA in a future patch so
> that our start[0] members can be VLAs.
>
> Reported-by: John Stoffel <john@stoffel.org>
> Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>

Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>


-- 
Regards
Sudip
