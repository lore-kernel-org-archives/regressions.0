Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16BB10E9
	for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 10:18:36 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso10523281wmq.5
        for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 02:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4TaXd25ULxGf2VZebmB9AEIpKhaLK0177ui9ayfPBQ=;
        b=LwHeTZaoDhMCvsrZ6tLpAfp7BgSOThqwgtC5PFDY3TJvWN8Ei4G48NYXwt6Jq2ljnF
         niAD0oygmqRt+msvEfO0rgYuEQyY+emyJ21CufGOjK2rMV67EzM8+lO+q8q1Reu2JxIg
         A2pHtrY612OPswNDJ5gEeDJ1ZOJdzBXeb6dB/RSvolE6Ut+4vzQRQQ5s+QIgQf7tfBe6
         V7lY1EOIVpRokj0HF5yk80F8sE1a6u1mQW4JevfpPOkQzmif6Kv5jS3NpBu0Xfly7LXy
         V59r5iGIo08SvLpesUQwkmg5IiM942X+pqXswNJxLnuPTDnnZmtPkRQ3jZPKItP9Z48V
         BFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4TaXd25ULxGf2VZebmB9AEIpKhaLK0177ui9ayfPBQ=;
        b=VYTNpoVy8X01IJ2oMHrB9wLSpTjVXrduNwH4X76lgXdWGh5XR6TtGyhIujO/kBTbkM
         KIjNm4MNYffix9vI5yUbdnQUHO9Ali/zmxP0Fpr3s9N/czAYu+LP2u+cY/E/KSaXfa2Q
         PgdoH0JS4LVLgUfqU29k20gPSMFtC+nzb6zFC9ZQYdTZsSRqXcg2NiotXXj1f3ERtdw0
         7NhVPptPQYQwXuIevBe0YKZJGxDHqyWSrrOIrdjqPYIKKpjmGFkMSNL2FfqW9qxkGzyw
         XeoV/gllAN/hgXem1Pn19LbfqKWJ6wajwEdqFgIeukY6yxDkE50LcLV/vNpheC0zaz3c
         fIKQ==
X-Gm-Message-State: AFqh2krKybvK1pdTWGOpm5ltTTqGgf0QhwQgbiL14f3hFZa6YuTtae+3
	INmaBvw3e1I8pYY7Zt/Ewdl6jkUqSsY5gV3Xx9qytg==
X-Google-Smtp-Source: AMrXdXtocw9FvQQl06F1Kjomd0eSL9SilrcqLZGnbM0D3rqzvReZ39zJnQfeShc7bRB+A3Vuqna4tY8Rubb9xKbssEc=
X-Received: by 2002:a05:600c:34c3:b0:3cf:781a:4310 with SMTP id
 d3-20020a05600c34c300b003cf781a4310mr2643909wmq.150.1674555515054; Tue, 24
 Jan 2023 02:18:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>
 <Y89n98fRfTpLmPUg@kroah.com>
In-Reply-To: <Y89n98fRfTpLmPUg@kroah.com>
From: Lukasz Majczak <lma@semihalf.com>
Date: Tue, 24 Jan 2023 11:18:24 +0100
Message-ID: <CAFJ_xbqMx8LsD_Ry70jnqVmmhyGjTFpA-Gv7SpRR21v3Djr1DA@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sasa Ostrouska <casaxa@gmail.com>, stable@vger.kernel.org, regressions@lists.linux.dev, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sasa,
I've just built a vanilla kernel (v.6.1.7) with ChromeOS and audio
seems to work - at least for a while - I was able to play some music
on YouTube. Can you share a full dmesg ?

Best regards,
Lukasz

wt., 24 sty 2023 o 06:09 Greg KH <gregkh@linuxfoundation.org> napisa=C5=82(=
a):
>
> On Mon, Jan 23, 2023 at 09:44:34PM +0100, Sasa Ostrouska wrote:
> > Hi all, sorry if I put somebody in CC who is not the correct one. I
> > have a google pixelbook and using it with Fedora 37.
> > The last few kernels supplied by fedora 37, 6.1.6, 6.1.7 but also some
> > earlier have no working sound.
> > I see the last kernel for me with working sound is 6.0.18.
> > On my pixelbook this is showing in dmesg:
>
> Any chance you can use 'git bisect' to track down the offending commit?
>
> thanks,
>
> greg k-h
