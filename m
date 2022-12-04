Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22FD7C
	for <regressions@lists.linux.dev>; Sun,  4 Dec 2022 21:03:24 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id y15so10238765qtv.5
        for <regressions@lists.linux.dev>; Sun, 04 Dec 2022 13:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rKd7A2ySfckvcP/WSPOwepMQ4TZ0rFcNRmP+2MvjT4A=;
        b=XnfhUClfXXxSzRvNxJMqANfGlMdg+aWxnIGjQQjSdkLEcMH5jf2oJ4VjtiTUtKP7Zf
         JrIy1duQqMiXakjzyJSwOhxEC2ceVsoSnon2ncSf6bUed65NwhuzL0sBBMHvfVD8msZH
         edqW1lUF5hfB/SpOPxFKHU+w8jnTfDNfs96NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKd7A2ySfckvcP/WSPOwepMQ4TZ0rFcNRmP+2MvjT4A=;
        b=KAvretRbmU+scOwliIEGw2O4Ma2pwmpj4TfUWV7UpAWGcfgx+TjoohfPqm71UPaojL
         uEsjq7hUd0GRZPeTiort/6kaM8abXWWRqvmvjXz0u46Vi499x4AAEnuH+VyD1J8alOO0
         xViWk4ynW23Guv4VaZuphfrj1S7AWPVuviqpuzqBVp2OOif44WAAxn45oeQ6UaCfP29Q
         BcQlDVxEiBVBzWYkVZ80KP6h9v3C1V/E9QbtEHAfn9mftqClQ/T2aL6k0wF6LXaem0kx
         6glVquYHd4NRdNX6JtrCRJKkNS5UbLOXgOKak6bgPv2UwZ7QZ1H3OKUYyJkI6mG1x5qP
         w+4g==
X-Gm-Message-State: ANoB5pkHxWiQ5t6vH3TeQZARJEdHa7sEIioYme+nGz2pT0YHUvKglfx5
	2wOci1zTvi5SSB1hGOEJSb9AzOmwFY79EH1t
X-Google-Smtp-Source: AA0mqf4YekVMh/g4jgO8YDAlFpX00+iQlM/om50ZkLcd6PQK04SRo82v5qZ2QaoEq0USR8+5x1h/oQ==
X-Received: by 2002:ac8:5ec8:0:b0:3a5:280d:31ff with SMTP id s8-20020ac85ec8000000b003a5280d31ffmr54636395qtx.646.1670187803173;
        Sun, 04 Dec 2022 13:03:23 -0800 (PST)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id bp39-20020a05620a45a700b006cbe3be300esm10910424qkb.12.2022.12.04.13.03.21
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 13:03:22 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id a17so7059104qvt.9
        for <regressions@lists.linux.dev>; Sun, 04 Dec 2022 13:03:21 -0800 (PST)
X-Received: by 2002:a05:6214:390c:b0:4c7:7282:5817 with SMTP id
 nh12-20020a056214390c00b004c772825817mr542557qvb.94.1670187801671; Sun, 04
 Dec 2022 13:03:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <167016324121.413036.10816787460130337195@leemhuis.info>
In-Reply-To: <167016324121.413036.10816787460130337195@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 4 Dec 2022 13:03:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgCHBWN5VbCAc6=bKMnEBjdumqDGYG=X1E27VWG2H_WQQ@mail.gmail.com>
Message-ID: <CAHk-=wgCHBWN5VbCAc6=bKMnEBjdumqDGYG=X1E27VWG2H_WQQ@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2022-12-04]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 4, 2022 at 6:16 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi Linus! Below you'll find regzbot's report about regression from this
> cycle the bot and I became aware of. But first let me highlight a few:

Ack. I fast-tracked the tpm fix and the mm performance regression
revert that everybody seemed to agree on, so that they will be in rc8.

The others end up being less clear-cut and remain.

Thanks,

               Linus
