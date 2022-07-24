Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD0B3FE4
	for <regressions@lists.linux.dev>; Sun, 24 Jul 2022 19:59:15 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id fy29so16972580ejc.12
        for <regressions@lists.linux.dev>; Sun, 24 Jul 2022 12:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rnfLZsTFzFa0wqaySCmIaHsg/ndbi17KUWIR0LUjjyQ=;
        b=JRxmHxqa/8WyYdLNsPP/DYXO/hthdlrx/29N3AFRHH1fHMKLHHyRKqJCTersUcrlxR
         NiQDS0i29vQ9gwen5RX8XpxUpAJkbFL93fsb0NUWINl5o046HwRW5ffoYKn4/qL6mTwz
         Tdx55KkzwGPTfsDXFU6cNRJacMJUe/NQve4r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rnfLZsTFzFa0wqaySCmIaHsg/ndbi17KUWIR0LUjjyQ=;
        b=xfc0/CihVCWgwMfhpomOXPQ6nAVc4yr8pm1OM69ERuwTq0yfCVTURr3/D+qiIs+5md
         qR2UL+qfrFQfhsm43vwy39QH5zJ2qUKxveIcQyG8psQawdCAI1TC+/DCS9sUwBysgsp5
         oTmmlAS3VHgvcCnoZM788fWp9J/u/sHYm3q6oZeRgzdr1kFBSNYSFq0C6iBxnI9tioI5
         cyq5blonbKRj48UYeqYr+QYgGpO5mS9s5Iq7H9FqWBIsH4O29p5metAZqB445YHbgX2z
         f9LELEZhIx2jxH43PjfJNFWH36mXBVw6m9iNtMY26Wp8aoo2V6GSFE/H2MbYyzqwStCx
         PyNQ==
X-Gm-Message-State: AJIora9jB4UmbmqZcx67IajFTDCCu/wvf5FOZvvhYdZb57zJYhnqxRwZ
	4BknQobIdeiv+4szHXa0OMcaKJ2D1UykKkdl
X-Google-Smtp-Source: AGRyM1vVoxe7lUpwp47n0AQ5nnvoDSr/TbVu27uoNl6VQUbs38FAaWpOIAWF3JovpJAjdNu0O8zt1Q==
X-Received: by 2002:a17:907:75c6:b0:72b:496c:77c7 with SMTP id jl6-20020a17090775c600b0072b496c77c7mr7395600ejc.47.1658692753464;
        Sun, 24 Jul 2022 12:59:13 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id w7-20020aa7dcc7000000b0043a83f77b59sm6061974edu.48.2022.07.24.12.59.12
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jul 2022 12:59:12 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id h9so13365695wrm.0
        for <regressions@lists.linux.dev>; Sun, 24 Jul 2022 12:59:12 -0700 (PDT)
X-Received: by 2002:a05:6000:1a88:b0:21d:aa97:cb16 with SMTP id
 f8-20020a0560001a8800b0021daa97cb16mr5948645wry.97.1658692752059; Sun, 24 Jul
 2022 12:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <165869171256.283493.2326902986633030609@leemhuis.info>
In-Reply-To: <165869171256.283493.2326902986633030609@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 24 Jul 2022 12:58:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZ8snqJmoyhHjZCYVP5bMmNWzQMkDZ6LtNr1YKEg4A9w@mail.gmail.com>
Message-ID: <CAHk-=wjZ8snqJmoyhHjZCYVP5bMmNWzQMkDZ6LtNr1YKEg4A9w@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2022-07-24]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 24, 2022 at 12:48 PM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> * The following patch fixing a build bug reported three times now, that
> didn't get any reaction from the maintainer since it was posted six days
> ago:
> https://lore.kernel.org/lkml/20220717231105.33005-1-kilobyte@angband.pl/

Ok. DavidH is on vacation, so I just picked that up directly.

> * The virtio regression is kinda fixed by c346dae4f3fb already, but
> there is a patch in the branch Michael usually uses to sent patches to
> you that he for one reason or another hasn't sent your way yet:
> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/commit/?h=vhost&idj9720576cd00d30722c5f755bd17d4cfa9df636
> I asked what's up here a few days ago, but sadly got no reply.

I'll let this be for now. It's more of a "don't do that then" thing,

> [ *NEW* ] fs: recent changes to copy_file_range behavior breakage

This seems to be a "damned if you do, damned if you don't", in that
different versions of libtorrent seem to expect different behaviors.

I think we're leaving it be, so that there's just one behavior going
forward, rather than vacillate between two and making things just
worse and oscillate depending on which one people use.

Not good, but there doesn't seem to be a good case.

               Linus
