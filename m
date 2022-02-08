Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD72F2C
	for <regressions@lists.linux.dev>; Tue,  8 Feb 2022 18:00:10 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 192so26003841ybd.10
        for <regressions@lists.linux.dev>; Tue, 08 Feb 2022 10:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ii2RoA70hyPFpWjpQOIgYWVQ0Wgfgxw0SgqMO+aO1f0=;
        b=dzWW2CT/8mEzCJv7uPHU9VFT9BvCodKHGVN3IQfEajn1B6thGzNeWE3C12ULF8jAeO
         GSV7nZHTSO5v+V70AuDzAeg+qlPXVIim2Ra2vs8WZMmGNIMmrFqp66jlPQgelEZdkvsk
         dmRryK/Q64PLOhcRgkIxVZP2hT0jahsoeDmoJstcVB/p8PNa/MA2EEywCmZtWw2/58gx
         bwP6oQBfmLWxye9vmuITWUwoxQKj1PnPQayVQG+T2krCSvMz/oKr8ZyQvQkfuGcZYV2e
         ZHUY91B5UWMcjKsbRs8bEHehqdII468JM+P8vXtti2ISIIX6Xk/eZL7lv3sIhJ/KV87R
         W55w==
X-Gm-Message-State: AOAM5317rio0RNyg4sAXtlAG9WNb93M/h35wbjQty4LSgtLvD3vMINro
	oHRwmV2sy8c+NU+mk4NS/M0Qvxr+yBGpQr4h3Ng=
X-Google-Smtp-Source: ABdhPJxCnkDYQnltfASHHSHrKRxUmAdvsZvnR3ypuO8fhN3qkWtd7TI0tmHnLmkOZf2qb+oEnqgjgxSy6dkjHXlS3/I=
X-Received: by 2002:a05:6902:1545:: with SMTP id r5mr6035694ybu.475.1644343209557;
 Tue, 08 Feb 2022 10:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b177cb21-aa01-2408-9b26-164c028b6593@molgen.mpg.de> <31603144-edec-df2d-fb46-283692c67420@leemhuis.info>
In-Reply-To: <31603144-edec-df2d-fb46-283692c67420@leemhuis.info>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 8 Feb 2022 18:59:58 +0100
Message-ID: <CAJZ5v0hyp1nR5id02abZh4cjw=sT0J_nf9spbUHfuwzjdJb5KA@mail.gmail.com>
Subject: Re: 100 ms boot time increase regression in acpi_init()/acpi_scan_bus()
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux PCI <linux-pci@vger.kernel.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 1:03 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker speaking.
>
> Top-posting for once, to make this easy accessible to everyone.
>
> @Rafael or any other @acpi/@pm developer: what's the status here?
> Neither in this thread nor in the bug ticket anything happened afaics.
> Or is a 100ms boot time increase considered "not a regression"?

It is on my list of things to look into, because it used to work
faster, so depending on what change made it work slower, it may be
possible to restore the previous performance without sacrificing too
much.

I honestly don't think that it is a noticeable issue for users in the
field, though.
