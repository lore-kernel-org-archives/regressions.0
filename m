Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB6636
	for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 01:58:31 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id cq23so33936348edb.1
        for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 17:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1677549510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5kj/tOIuYssE3nfGvgZJGSzN2o3Am/0V2s7h/8HaHc=;
        b=BsUAShZ8pW0HHowCbX3WiXBRR36o5wnDHxqee+ebCqVym9PUvnjfKqLkgU29H/SxIU
         x6NtZCJbyVRSGj+wjr7IYfiaqsLyOpc09vexbdcerpUP2Sq7HmMQKqjUPbtnfQKucKtE
         XHpLkj48IMYRmlhg1OumlalykVOLMtcndTTb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677549510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5kj/tOIuYssE3nfGvgZJGSzN2o3Am/0V2s7h/8HaHc=;
        b=Bll1PokgWOiMkij0hbKlWkjClMIrxnaCz/2ACmHOxxoFEetGc5PUvUW4uHwVudwdPj
         T0ePPSA7PDeM7QJiQPMtBevcxWccDfKvvII6Dp7dD8eaXO8Hr6gJ4pmMxvaOY+2lsdLD
         IDbaybKYhk24I2jgplNExpQcc8cOPtjSK75iidIU5VM88OeuIxfebNfvnSOFMYSOv6sU
         D8TNDfoR63jYFPbKPeIXWsfDew1RztXFea3Aw9Y8Mh7f2AD69kaJ8Yl7Eim/X3b6h8/Q
         1S0+E+LZHLXQpDMA9pSMWc/IaQkd8Oi/0IZTTksfESzIscAsZgkDkumPOwklosya5Y3Y
         yFyQ==
X-Gm-Message-State: AO0yUKWavYTt7YlKTbmYRdR0+5KjpAoquGNiOB0vfUXXS5VnQrT5F9px
	Aj6c6jIWdP5kFtADwn9CLV0S7UB+sosuNhsVoC8=
X-Google-Smtp-Source: AK7set8hWDG27w4gnUCTddKztC/JjnlasO+QA7XmnL3ANLkP4PRoZ4mBXZcZGj9fThCemLCUnNFSFg==
X-Received: by 2002:a17:906:7c8:b0:8b1:a3c7:a9c9 with SMTP id m8-20020a17090607c800b008b1a3c7a9c9mr764135ejc.70.1677549509842;
        Mon, 27 Feb 2023 17:58:29 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id q20-20020a1709060e5400b008e772c97db6sm3834303eji.128.2023.02.27.17.58.29
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 17:58:29 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id cy6so33843380edb.5
        for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 17:58:29 -0800 (PST)
X-Received: by 2002:a17:906:2ec8:b0:877:747e:f076 with SMTP id
 s8-20020a1709062ec800b00877747ef076mr368063eji.0.1677549508810; Mon, 27 Feb
 2023 17:58:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1677529301-19530-1-git-send-email-george.kennedy@oracle.com> <face2b1b-0f2e-4a79-a71b-79681fc56273@t-8ch.de>
In-Reply-To: <face2b1b-0f2e-4a79-a71b-79681fc56273@t-8ch.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Feb 2023 17:58:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=whxC0ob3f--B-igBp34ujA5PZQMcTnDQ8Zh8HA7+ZbeWg@mail.gmail.com>
Message-ID: <CAHk-=whxC0ob3f--B-igBp34ujA5PZQMcTnDQ8Zh8HA7+ZbeWg@mail.gmail.com>
Subject: Re: [PATCH v2] vc_screen: modify vcs_size() handling in vcs_read()
To: linux@weissschuh.net
Cc: George Kennedy <george.kennedy@oracle.com>, jirislaby@kernel.org, 
	gregkh@linuxfoundation.org, sfr@canb.auug.org.au, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 5:46=E2=80=AFPM <linux@weissschuh.net> wrote:
>
> This still seems to be broken for me.

Looks that way.

> I still need the patch from
>
> https://lore.kernel.org/lkml/20230220064612.1783-1-linux@weissschuh.net/

.. and that has the same problem with "what if the error happens
during an iteration that wasn't the first, and we already succeeded
partially".

The "goto unlock_out" is bogus, since it jumps over all the "update
pos and check if we read something".

It was the correct thing to do *above* the loop, but not inside the loop.

IOW, I think the proper patch is to also turn the "goto unlock_out"
into a "break". Mind testing something like this (whitespace-damaged,
but you get the idea):

    --- a/drivers/tty/vt/vc_screen.c
    +++ b/drivers/tty/vt/vc_screen.c
    @@ -403,10 +403,11 @@ vcs_read(struct file *file, char __user
*buf, size_t count, loff_t *ppos)
                unsigned int this_round, skip =3D 0;
                int size;

    -           ret =3D -ENXIO;
                vc =3D vcs_vc(inode, &viewed);
    -           if (!vc)
    -                   goto unlock_out;
    +           if (!vc) {
    +                   ret =3D -ENXIO;
    +                   break;
    +           }

                /* Check whether we are above size each round,
                 * as copy_to_user at the end of this loop

which hopefully really fixes this (at least I don't see any other
"goto unlock_out" cases).

              Linus
