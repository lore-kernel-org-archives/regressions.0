Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC50223DE7
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479602; cv=pass; b=ffnI/hIxpBNlNhXi2ZYl+7dnamY6fmoAlObS0Ws46/t4a57ZZtai2m3HlE1kiMIINc9i/vkra9uAsLtNomq2FpxJvJZaIoHLfr5/7TRt3wS6pPLE6xVGaMRroZK1KX3P2X/9vR2y2z7nQVc1AJ1wyIN2ItccscC8yMsHJHW4cFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479602; c=relaxed/simple;
	bh=1IeoGmyXKCHF+vazqnzxSivC66X9NGYz6nKU75EaHt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoDkVhQmp85NsTXxmTkINs6TnpEIEdFFXHizF38ZgcMg2dR3vq6ag22WnOECTKzBCMGM26FrhxsVCjfaYkVd/2DTnycu8x0S0oIpfDg974hp3UgyeDxKxD8daGJNwTiLIUPWf6066e22y466RnrD2Vz8pecOBwwWjS8sOh3HaH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=A1DKPhgR; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="A1DKPhgR"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3074adb8fcaso340010eec.0
        for <regressions@lists.linux.dev>; Wed, 03 Jun 2026 02:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780479600; cv=none;
        d=google.com; s=arc-20240605;
        b=C45uexOjlXj0wUCxlcCmK+73XlxkaJXBrXW1ePwKrNPHWMCPJCFQ64PbbenBN8DIKq
         H3cbFb4YJMqyOLQTvWewV/drOLtPbVgZsgCgWIUO90m67ATvLC11uBbip0NUGzUfO5v1
         LUDtg+WoHRWnNALDpf4fWpdLsbVOD53+TdWtG0yJEN0oQHQ3mYRovFlCxRKxFCf1uTwW
         0ySNLzNPnPHdn0LBkVxdDATFxpkJBMIkUr3wT7rL0mFWedNOeX0L0eOStp5A/21KtC9K
         7Z0w1mt5AAkXBdehdjbeVWwwQ9dvGWXv+LN9t9awapis2Vgtwh7sCGb5e9/YufTcCmIu
         +dTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1ehSj23IfCmzPZngwG8XDa8t9FB4fozxZd1s0Ny6Ia4=;
        fh=DzxMhaj5K6C6OAdxw2s4GVvnaqKifoYSPWDlURBbWWw=;
        b=HbAVa5/pB+kcmTr5fV9Eo37RG/KFkoraEovULe5FaAdJQQGmxw6Tyd9+KNRgRm0pf8
         QwCP0FobpEEDsKaIS+QeUcsRLj8A2cSiYfslPDR537O0efEILWs45QELFlEoa56HXbLE
         G1VSZtckNPIjxdEgZUeGbcvoW/TpY1LeacXhTIVNUmnG1EC01h9a1EPgLjN2VifPJYjp
         Z1W/Z/Hzza1psg5EQxnW7DgFiLtxZbgZ4J2+TuCd27xsQJF7JYXX3hOLmJkKRRRDWa7H
         rdjFhXbmwfZJoC+fGTtEADSPcQmCSXj3qQLJ2Ha3DJBy8XzHqqCtvSyORkVbaD+8A5sV
         PO6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780479600; x=1781084400; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ehSj23IfCmzPZngwG8XDa8t9FB4fozxZd1s0Ny6Ia4=;
        b=A1DKPhgR6S8Bxghy7RqiJJNuzY+QQbStL6goonpuUe7Gbd3z3J/crP6ZyFBd6IH5rF
         N920wI51Oi1paDwYnMhONg43MI8IqpoQA8KwO21s85blWPsKox26vvyqazRl8w76yjw3
         5myMYktAIo067xs6GepSEiX5JavQn2ig1XITQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780479600; x=1781084400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ehSj23IfCmzPZngwG8XDa8t9FB4fozxZd1s0Ny6Ia4=;
        b=T5Spnsw8LzhqvwqWQgJPt+OCoFlFP14pSdQTRNdPsjFEXzYPug+n7VX0dvGiPbP+ab
         xv86PDZG4qlNFvewfeyBLynJ90YYurkJcHSTLREJSPj32KA/9iPWnp4/gVjm8qbDiYyw
         9oPQTwCtBR1+OrbVDHZZLjuq4TQ2pOhAzJZ1+FTY5yJnQiiL3cCugLP1kJ5JyyJUQkaz
         wmOm9U8rLkVm1RPRY3tDwmwdJ/h7Zm9/8ft7LZaXpDpyqF0tIl8Q3nP/4tB30gQMNBWV
         2pYma0cc9Ukfd3igs+J1QH9BTYSj1y6Ox8mGr7DD4IRHdjK9JxXe23jgOfPdIuRPna2Q
         nJRg==
X-Forwarded-Encrypted: i=1; AFNElJ8eqwBRO8FobCQ6+0w5Rtt0x0htQWxRVw9GnlezTE9vq91NsR0Oigprf9Sh3UdV5avwpv/s0bYndHlkew==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ8T+UJCVWYua+J5H2qWXuxEhR9CsmQFDnU78P9uC1hYtxg9Oj
	DXV/j6Mv09dUYo1LY/q3nI/FzLzVIEA4rtDsIe1J1WenhAt3ghdSzh5hB8EtD6tsGc53NVkBCBg
	q+ZBCegGAWkGV6QQOiAjqn7HiMrxJSTkSz973a6FO/g==
X-Gm-Gg: Acq92OFuxaDdt8rQN6Z/mSf5LTnUHaRlaqYimDc9jg+eSxwpdGSmyNqymrlwR1uIoZb
	HroKPfxOxj9/qCby/w73UYiPVa5+tp4WY9hO14OAdf0P2sE+qDfpPCuOz8YjCToWZPWW4Ox/xLw
	zY7h4FioDXp1cfOWUKq0DRPMMb509fsimgoekKQngO+8nfJNsniAkDQYaquf9ShwMa8WXYR675z
	9hO0KakpaASLH2WMAjKvbdbkn2GZj/8LM8nR1Xx3MCsRoQkBSDBiYkYjDJq67MwiYOgUtm/q5y0
	C+0CnRTUVHdZh9BTYlx3qVGZdcFKqdW0+F8+lQ+ZkFMEwRc=
X-Received: by 2002:a05:7300:72cb:b0:2e2:3381:2fba with SMTP id
 5a478bee46e88-3074fa5579dmr1310275eec.3.1780479600262; Wed, 03 Jun 2026
 02:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFbF8N7++zopZuEcsKRxBV_sgOGCbzCY0hOyMw1SiGAtuzGhyQ@mail.gmail.com>
 <CAJfpegsCJnMfn_BzzTK7m9ndCGVsnPit8ZsT0fzAhYoY+yOsKQ@mail.gmail.com> <178035740095.2923901.5908691318688917347@noble.neil.brown.name>
In-Reply-To: <178035740095.2923901.5908691318688917347@noble.neil.brown.name>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 3 Jun 2026 11:39:46 +0200
X-Gm-Features: AVHnY4IoGOIZC3vvhezDGQYniFFeuDo0XpHHJxBiuhhHmBWXiQF3cxck0JH7m5w
Message-ID: <CAJfpegt=DphJP3pYHL6ZMzbYD4Yfmo_G+DAm496Ar57L0RzymA@mail.gmail.com>
Subject: Re: PROBLEM: FUSE_NOTIFY_INVAL_ENTRY leaves stale negative dentry
 after c9ba789dad15
To: NeilBrown <neil@brown.name>
Cc: =?UTF-8?B?0JDRgNGC0LXQvCDQm9Cw0LHQsNC30L7Qsg==?= <123321artyom@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 01:43, NeilBrown <neilb@ownmail.net> wrote:

> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index b658b6baf72f..3f16ecbc358e 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1605,13 +1605,29 @@ int fuse_reverse_inval_entry(struct fuse_conn *fc, u64 parent_nodeid,
>                 struct dentry *child = try_lookup_noperm(name, dir);
>                 if (!child || IS_ERR(child))
>                         goto put_parent;
> -               entry = start_removing_dentry(dir, child);
> -               dput(child);
> -               if (IS_ERR(entry))
> -                       goto put_parent;
> -               if (!d_same_name(entry, dir, name)) {
> -                       end_removing(entry);
> -                       entry = NULL;
> +               if (d_really_is_negative(child)) {
> +                       spin_lock(&child->d_lock);
> +                       if (d_really_is_negative(child)) {
> +                               fuse_dir_changed(parent);
> +                               if (!(flags & FUSE_EXPIRE_ONLY))
> +                                       __d_drop(entry);
> +                               fuse_invalidate_entry_cache(entry);

s/entry/child/ for the above two lines

Otherwise looks good and tests OK.

Agree about the need for comments.

Thanks,
Miklos
