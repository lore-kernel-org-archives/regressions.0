Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C77D3D71
	for <regressions@lists.linux.dev>; Tue,  4 Oct 2022 14:48:12 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id v17so161250qkv.5
        for <regressions@lists.linux.dev>; Tue, 04 Oct 2022 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=ihftkltNveJbQdV47ucYZdqJk9biYFJbbWec+UAUaqI=;
        b=bCOclblMw4zaokxU052XVeIH9IFOsnNvnBLTBNQQxDiYphNQW14xmYUVoJa7/SvzOX
         qBTxFSblw8bPY01muWGwvsgRYJUDWeQa+OXchhb8JbbPQAZKzWdKQdmR67BRmmhvbBKJ
         uk1jbSJv+lkQ8beE7uQosuUrHRinvgB6Z4fHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ihftkltNveJbQdV47ucYZdqJk9biYFJbbWec+UAUaqI=;
        b=YjZLrMwe9RTHvnD+iMOTIkzyLJ17RLXdGLsFbGjU15edt10ye43ysBECqXBSxwRGhB
         CMp+kB9b0x2vChz2MfnpTJ+KlckPgIibgw9/LYQ8ER/8XK2GMO0Gq/ZvbPUSZyUTYxau
         aBs1ZFiQACP8fkdumFORRmJMuP4XZ58KRivQ27DjNt/lbVghAA4+N3iyhzYXAtVXpoCI
         XCySQM2fPLfm3Aeroyoy1aRndOc88oUeF5tf/J3xSnK1i93svLgb+ApFU4YI+SspMTej
         fWN8T0T+iwvucr1b50eOSJbvNPCLZBgoUyWdXnX3HOAb3R4RVk5KPEqlEIcxKbnrfkFA
         f29Q==
X-Gm-Message-State: ACrzQf1AX8k1l+4vdkO/cEdBJ+lDu1pg9QK+RIhy3SD3npAcG1IbxyF1
	PfYYW0bpl5/eHo4SzpNO0+xHVg==
X-Google-Smtp-Source: AMsMyM6+Bc9ggdImprFSEV1hRtemUxuVGWvA6/LDu4e+5bM+Ys3Rxli+THNpHa5WG/LMSjfwREz93g==
X-Received: by 2002:a05:620a:158d:b0:6cd:efb1:8eb6 with SMTP id d13-20020a05620a158d00b006cdefb18eb6mr16903244qkk.185.1664894891065;
        Tue, 04 Oct 2022 07:48:11 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y3-20020a05620a44c300b006ce60296f97sm57780qkp.68.2022.10.04.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 07:48:10 -0700 (PDT)
Date: Tue, 4 Oct 2022 10:48:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Mike Rapoport <rppt@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>, Theodore Ts'o <tytso@mit.edu>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221004144808.q6jq77quysduw5wt@meerkat.local>
References: <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com>
 <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com>
 <YzqjfU66alRlGk5y@kernel.org>
 <20221003153718.o7fhrain5fnwwu3l@meerkat.local>
 <b23586ae-3082-08dc-7bc7-94c3fecffbf9@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b23586ae-3082-08dc-7bc7-94c3fecffbf9@gmx.com>

On Tue, Oct 04, 2022 at 12:24:23PM +0000, Artem S. Tashkinov wrote:
> > It can't, actually, which is I think is the crux of misunderstanding here. I
> > think what Artem is proposing is to *auto-create bugzilla accounts* for anyone
> > who shows up in MAINTAINERS, so that they can be cc'd on a bug report.
> > However, everyone understood this as "add these people as default assignees,"
> > which is not the case.
> > 
> > If we auto-create accounts for MAINTAINERS, that would allow them to be cc'd
> > by an actual human being triaging bugs, but won't lead to any discernable
> > increase of bugzilla mail.
> > 
> > Artem, please correct me if I'm wrong.
> 
> Exactly. Only maintainers and mailing lists will be assigned
> automatically as it is _now_. Other developers need to be CC'ed _manually_.
> 
> There's no SPAM issue or never has been about what I proposed. Absolute
> most people will never CC anyone 'cause bug reporters are normally quite
> lazy or not experienced enough to grep git logs.

It's still not a perfect plan, because this is what tends to happen:

1. someone is cc'd via the bugzilla interface
2. the maintainer responds via replying to the email and cc's someone else
3. bugzilla doesn't automatically synchronize the email Cc: fields and the
   bug's cc list, so any responses posted via the web interface don't go to
   people who were cc'd via email

Let me ponder what can be done about that.

If you're interested in helping to get the bugzilla product list into a sane
format, I can suggest that you work on creating a mapping file between
bugzilla product/component and MAINTAINERS entry, maybe just for the
"S: Maintained" and "S: Supported" ones?

E.g., starting from the top:

    3CR990 NETWORK DRIVER -> Drivers/3CR990
    3WARE SAS/SATA-RAID SCSI DRIVERS (3W-XXXX, 3W-9XXX, 3W-SAS) -> Drivers/3WARE
    53C700 AND 53C700-66 SCSI DRIVER -> Drivers/53C700
    ... etc ...

That would allow me to automate the creation of components *and* work on a
better email bridge than what bugzilla can currently do.

-K
