Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5571158E
	for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 17:28:49 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id h7-20020a17090a648700b001b927560c2bso2732374pjj.1
        for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 09:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=In6ibvsbevR+oUF1CNB4sd3J1jo3GRL6oP9ohnz3F4Q=;
        b=PavXSWFp42Rb3JhXSuid9+itRv8kFh6GIZuLY2gAhYwo3oc4KsMKMdg91czh/h6Qyo
         /mGMYVMcivtoahXjbQnw5TZAhfVIIDp+E5QCsL/X6VJ9piDGbmQRdfAyWdPYB33yDrlf
         LW/RAqpaseffxKwbcfXWLO+TCFNgnMalHJro+bQdWT0swIlsnrE3e5MjEFWQC06NQ7DQ
         UUuqdlzoG3NdkdmVki7b/1MJ87uOQKhZjDr9QNn9+tY7SKRYmUx08fkXzPJloY59m41M
         d20QVcx3qigbwwURbtc1rOkvtU4+BgKlYYT6moF9Kp2QSqmKqVXRQMAb6FoLvxQkqs+o
         abFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=In6ibvsbevR+oUF1CNB4sd3J1jo3GRL6oP9ohnz3F4Q=;
        b=sPFkiP8MkUbHyT1GJdyga74EsFfKrpEKR7OCXTzvVN8zLBKNRNhgB3A1S4Cj2L2Wd2
         W2fQVvA1d6oC0il10IpYWmVV9mOJttxzcARqNUCm+qMMabIoWIKtI8jub+HfF44Qm//3
         sWkO+70nYj3/cXs1Y/cxBZVfDZyt9GOMEQgP9s1iwrDE+e/cJfVQ6da6PDrmhP3tLwUA
         F1gcySib6K+ILMt6o+ge3Xv5fyfAUyCY4/LjamaKmSCgg2UjwsyKgGHln6w8q8VNPqDL
         dtx37TVPow1/D8LLGBbUVyuEDK4vNZP+my3LlWuFcf/qrY9C0wBTunVTXwHsB/iYUqub
         GYmA==
X-Gm-Message-State: AOAM533M8PcnjzONFIT3AhcoDMIUZtjcf8DLsCGhu3OD0UAXkcaLRrEo
	T0rJh6B5xNGeIjuWKHMxXEJU1tcLCWW1ASszAxGZlw==
X-Google-Smtp-Source: ABdhPJwZnJDH0ZZkUy+8spEtdicBcwJ01t47bO4NgUDlXJmAx54plZE8XmZ+xaHrg9DlDbWQu4mo0doKyyMpgKDxO6E=
X-Received: by 2002:a17:902:ce12:: with SMTP id k18mr75487plg.34.1644946129176;
 Tue, 15 Feb 2022 09:28:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <55f5c077-061c-7e53-b02d-53dde1dd654f@molgen.mpg.de>
 <CAPcyv4jSP4PTehMdkcpZfpDcz1HZ0ekjx+WztOiqpwGFU-1iBg@mail.gmail.com> <CAJZ5v0hv2P9_g0QAsY_guvYA_vSE-q4jz2902Df7r9KS=iRfMg@mail.gmail.com>
In-Reply-To: <CAJZ5v0hv2P9_g0QAsY_guvYA_vSE-q4jz2902Df7r9KS=iRfMg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 15 Feb 2022 09:28:42 -0800
Message-ID: <CAPcyv4jTe48rqGvLBXOH4tLtYM5q6JX1dF7EBApnD291+NaUgg@mail.gmail.com>
Subject: Re: New warning: ACPI: CEDT not present
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 9:14 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Tue, Feb 15, 2022 at 5:22 PM Dan Williams <dan.j.williams@intel.com> wrote:
> >
> > On Mon, Feb 14, 2022 at 11:52 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> > >
> > > #regzbot introduced: 2d03e46a4bad20191d07b83ec1242d5f002577be
> > >
> > > Dear Dan,
> > >
> > >
> > > On the Dell Latitude E7250, Linux 5.17-rc3 logs the warning below
> > > (`dmesg --level=warn`):
> > >
> > >      ACPI: CEDT not present
> > >
> > > I think commit 2d03e46a4bad (ACPI: Add a context argument for table
> > > parsing handlers), part of Linux since 5.17-rc1, is the reason.
> > >
> > > If I understand it correctly, CEDT is not to be expected on older
> > > devices, so the warning is not justified. Can something be done about it?
> >
> > Rafael,
> >
> > I'm inclined to just delete the warning altogether, but special casing
> > is also an option. Any preference?
>
> Change it into pr_debug()?

Sounds good, patch inbound.
