Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F3E1FC3
	for <regressions@lists.linux.dev>; Tue, 10 May 2022 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652171848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+bf0vsHdIZwwE9q6c75T7kOPMxvneKaFOveGY+sLTY=;
	b=ExL7ZMkaHmvZJqL4tczacj2GNE2kJc/5zCP3nMUQekB+hB5SFzXreQNOc0tIndRQ8lkXTM
	3c5l3+mYFC7yfkoBQCUo0uJ76b7CyZtDMujDlmoVA9EVTxgwOgmr734Mey+gyIXOT0Cnrk
	A6r/Brw9ZTrMUf5BBzlfvzZZLj+7wDI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-Hiac2AguMbirQfy7kx_tgA-1; Tue, 10 May 2022 04:37:27 -0400
X-MC-Unique: Hiac2AguMbirQfy7kx_tgA-1
Received: by mail-wr1-f72.google.com with SMTP id u11-20020a056000038b00b0020c9ea8b64fso5463026wrf.2
        for <regressions@lists.linux.dev>; Tue, 10 May 2022 01:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j+bf0vsHdIZwwE9q6c75T7kOPMxvneKaFOveGY+sLTY=;
        b=oXKcQzzNTaG0qKxFM3kqoBF0QbV0UciXZInDuSShd3a8DdNePz9vFXQsD572ok6Pbv
         wXq9W8mrVwKaV9jl6jEVIITUBJQhIINVyCfDnnd8gWGCXYbGv8kZ9cyIX/aSZekmeXwY
         Tz5RgSut/WButNWwFdM9ofHG9A5qS4no5A0rInn8xlcpP770R8XmWC2bJ4ZL0JJX33fu
         cawdUfm0EYDrarCm6w7NVS1hQc5RshBTyVpVj6nLzFSkLt2dFw1UWR27kXMFjVZevH+9
         A8gq7KrUc39ek+AlBsp4Fh36APfAHBtZ6yt/MzauY1sOvHidHOFnl2sZFhV9jJ8aBe8z
         IN4w==
X-Gm-Message-State: AOAM531mmleFFCxvXuycWdQ6dnG5vl9lF73C/axh7uMKtalgNeAt4fDA
	OKlHJj2th/GD5OhuuCE2eiGxsFyRd+XacTFKTeqYEWN92ImhD7VQVZPI/iI1HH6z5cLz908iSUD
	dqJ2OcLVX4TxMtJeKc1jHGhU=
X-Received: by 2002:a5d:630d:0:b0:20a:e1a3:8018 with SMTP id i13-20020a5d630d000000b0020ae1a38018mr17590605wru.489.1652171845935;
        Tue, 10 May 2022 01:37:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGL3y7pRTXcLytDFuw+KuLGDAOLIN9orN+ms074kBoO0zDNQxsf08xbRCBU2oDTE8Z+kx8xA==
X-Received: by 2002:a5d:630d:0:b0:20a:e1a3:8018 with SMTP id i13-20020a5d630d000000b0020ae1a38018mr17590583wru.489.1652171845547;
        Tue, 10 May 2022 01:37:25 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-113-89.dyn.eolo.it. [146.241.113.89])
        by smtp.gmail.com with ESMTPSA id az20-20020adfe194000000b0020c5253d8basm13146661wrb.6.2022.05.10.01.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 01:37:25 -0700 (PDT)
Message-ID: <b140c37fe1aac315e07464dd6a2d7a8f463e6fe4.camel@redhat.com>
Subject: Re: [PATCH v6] net: atlantic: always deep reset on pm op, fixing up
 my null deref regression
From: Paolo Abeni <pabeni@redhat.com>
To: Manuel Ullmann <labre@posteo.de>, Igor Russkikh <irusskikh@marvell.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 regressions@lists.linux.dev, davem@davemloft.net, ndanilov@marvell.com, 
 kuba@kernel.org, edumazet@google.com, Jordan Leppert
 <jordanleppert@protonmail.com>,  Holger Hoffstaette
 <holger@applied-asynchrony.com>, koo5 <kolman.jindrich@gmail.com>
Date: Tue, 10 May 2022 10:37:24 +0200
In-Reply-To: <87bkw8dfmp.fsf@posteo.de>
References: <87bkw8dfmp.fsf@posteo.de>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2022-05-08 at 00:36 +0000, Manuel Ullmann wrote:
> From 18dc080d8d4a30d0fcb45f24fd15279cc87c47d5 Mon Sep 17 00:00:00 2001
> Date: Wed, 4 May 2022 21:30:44 +0200
> 
> The impact of this regression is the same for resume that I saw on
> thaw: the kernel hangs and nothing except SysRq rebooting can be done.
> 
> Fixes regression in commit cbe6c3a8f8f4 ("net: atlantic: invert deep
> par in pm functions, preventing null derefs"), where I disabled deep
> pm resets in suspend and resume, trying to make sense of the
> atl_resume_common() deep parameter in the first place.
> 
> It turns out, that atlantic always has to deep reset on pm
> operations. Even though I expected that and tested resume, I screwed
> up by kexec-rebooting into an unpatched kernel, thus missing the
> breakage.
> 
> This fixup obsoletes the deep parameter of atl_resume_common, but I
> leave the cleanup for the maintainers to post to mainline.
> 
> Suspend and hibernation were successfully tested by the reporters.
> 
> Fixes: cbe6c3a8f8f4 ("net: atlantic: invert deep par in pm functions, preventing null derefs")
> Link: https://lore.kernel.org/regressions/9-Ehc_xXSwdXcvZqKD5aSqsqeNj5Izco4MYEwnx5cySXVEc9-x_WC4C3kAoCqNTi-H38frroUK17iobNVnkLtW36V6VWGSQEOHXhmVMm5iQ=@protonmail.com/
> Reported-by: Jordan Leppert <jordanleppert@protonmail.com>
> Reported-by: Holger Hoffstaette <holger@applied-asynchrony.com>
> Tested-by: Jordan Leppert <jordanleppert@protonmail.com>
> Tested-by: Holger Hoffstaette <holger@applied-asynchrony.com>
> CC: <stable@vger.kernel.org> # 5.10+
> Signed-off-by: Manuel Ullmann <labre@posteo.de>
> ---
> I'm very sorry for this regression. It would be nice, if this could
> reach mainline before 5.18 release, if applicable. This restores the
> original suspend behaviour, while keeping the fix for hibernation. The
> fix for hibernation might not be the root cause, but still is the most
> simple fix for backporting to stable while the root cause is unknown
> to the maintainers.
> 
> Changes in v2:
> Patch formatting fixes
> ~ Fix Fixes tag
> ~ Simplify stable Cc tag
> ~ Fix Signed-off-by tag
> 
> Changes in v3:
> ~ Prefixed commit reference with "commit" aka I managed to use
>   checkpatch.pl.
> ~ Added Tested-by tags for the testing reporters.
> ~ People start to get annoyed by my patch revision spamming. Should be
>   the last one.
> 
> Changes in v4:
> ~ Moved patch changelog to comment section
> ~ Use unicode ndash for patch changelog list to avoid confusion with
>   diff in editors
> ~ Expanded comment
> ~ Targeting net-next by subject
> 
> Changes in v5:
> ~ Changed my MTA transfer encoding to 8 bit instead of
>   quoted-printable. Git should like this a bit more.
> 
> Changes in v6:
> ~ Reducing content to 7 bit chars, because nipa did not apply v4 and v5, while
>   git does against a fresh net-next HEAD. Maybe it chokes on the
>   additional bit.
> ~ Omitting target tree to resemble the last passing patch version the most.

For future submission, please always specify the target tree (which is
-net in this case). No need to resubmit: I'm applying it.

Thanks,

Paolo

