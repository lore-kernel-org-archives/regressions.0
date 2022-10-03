Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB2D17CA
	for <regressions@lists.linux.dev>; Mon,  3 Oct 2022 14:22:44 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id z18so6769628qvn.6
        for <regressions@lists.linux.dev>; Mon, 03 Oct 2022 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=1mNtnrUJyTQxjM/H58kPO2FBj8ctREemEmZLeJQjiiA=;
        b=HHOvlrEsLsjIt8pkWJIJaNi/7w9fH7/+USdEgJk/pasP39/PqJRX9gJNl+6RLSmCMf
         GVyofV26jlyTxOmuA6eiwfdzwft095SM77pgF3xPOqSYIty+eZ6BqJxbjuVad1yp9Zty
         Plox52neU37WQikTvfXrSDCcANY2b6vl+JjSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=1mNtnrUJyTQxjM/H58kPO2FBj8ctREemEmZLeJQjiiA=;
        b=pggAmtopxoERtiAk0Xh/D7jT5O1Ebmyvs+vNH+IRpbT83oyDS4Jptuzckzo6TY7GzN
         xSWEKEDhP+B8ep/6OfgxIGP/4pMIg7H0VJNrDCScOWX4Rpd4glk5I0Rd//gWhlKf8ab3
         tcigXdJoNSL3H8TCr3vCNzWDpQllekfSpNJCviZf3UBvLKaeapV4zSOGMeUCAS7baca5
         Tw3wkf8Zx0lJMC6YtGSCwOIWiLNcDt43mtwR2HLPp/wr5/WFS2d4lUR4fIkxXb5s1MOv
         yWHOhifehd3cuX89LhYUJhqJdsftQ+Tc33lMBHdYlW/XomlDSvjMnVhegT1zGqh2wRsE
         T6Jw==
X-Gm-Message-State: ACrzQf2pG2jlPrpfpFfjb976l4sc/0bFwvh19w9hAM+0WEnCwUFRUNL9
	nsEE9ns4D/ni7GBlXYV9QcTfyA==
X-Google-Smtp-Source: AMsMyM40Bz2C89dANTyCDKluBnuuyuFRbPI6+PRG0AjqrNrChvyQCbzmIZu+Hwe3O2nDYy3wQo9z+Q==
X-Received: by 2002:a05:6214:d08:b0:4b1:7127:f615 with SMTP id 8-20020a0562140d0800b004b17127f615mr10560443qvh.92.1664806963423;
        Mon, 03 Oct 2022 07:22:43 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id p3-20020a05622a00c300b0035d0a021dcasm10246739qtw.63.2022.10.03.07.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 07:22:42 -0700 (PDT)
Date: Mon, 3 Oct 2022 10:22:40 -0400
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
Message-ID: <20221003142240.hu5gj7fms5wdoujk@meerkat.local>
References: <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com>
 <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com>
 <YzqjfU66alRlGk5y@kernel.org>
 <251201be-9552-3a51-749c-3daf4d181250@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <251201be-9552-3a51-749c-3daf4d181250@gmx.com>

On Mon, Oct 03, 2022 at 09:16:06AM +0000, Artem S. Tashkinov wrote:
> The initial conversation started with the fact that Bugzilla is old,
> semi-deprecated, requires MySQL [no idea what's bad about it, Bugzilla
> can work with MariaDB and Percona as well]

It can't, actually. It only works with MySQL 5.7 or an equally ancient MariaDB.
No, there is no official fix (because nobody is working on bugzilla).
https://bugzilla.mozilla.org/show_bug.cgi?id=1592129

-K
