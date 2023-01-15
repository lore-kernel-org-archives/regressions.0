Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA5E7E7
	for <regressions@lists.linux.dev>; Sun, 15 Jan 2023 00:55:50 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id g9so7487354qtu.2
        for <regressions@lists.linux.dev>; Sat, 14 Jan 2023 16:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8um7jzfdZofjaGhbaEiPIgthhZTY/B5b/SUEq3CZJf4=;
        b=HDJDHEipGxwIomQUQCLkGwGUP4yS8GLbVRqadszvgYX8dn4vzaYaznNeHG1irvUOos
         p8FmFA961/qlcIfcgaKyQ4LjRJvOB/xB6PEaGjYpFATE/A97b1Guyvlh892mjX195xzH
         A0z9sM4t4mh/+O6Xu1D8h4eTtjLEaIAoUYJlrndVAMZDzyaNkBxVTAxMs9yV1faX8DW3
         32+fXTtVDeyEpGvfLZmBchaNtcAQ8aXggFE31VXi6fVJ8eUN6gIOhEQhp6uV+6qwAr8a
         XE0F4lyhS61PbYG1Mzc3dRkw2o0vHH7HXckYpb4BsR+w1JzrduDyz9lf3zoqOqTnJ8Wz
         +TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8um7jzfdZofjaGhbaEiPIgthhZTY/B5b/SUEq3CZJf4=;
        b=5tmyf8cqJ9jg6fvnblYW+2O+E1LtGrwREy0ZJYs5BqT35WsfNQT0gdEgWSaofuQ1CI
         3+5F3iyZyKM7+wZgI6dekrFMxd56GmWnew3eGIZbbY3D56B3LQ0w+KTsgPmMJ6IkI1MZ
         4U43PRYaWuDFMF+5tmAN93viwZoiTOJnnzHAGBdYPiFM8QaX0je3FMkX5LCPofYBz4Fb
         hp1EELXJW5dzLPssEpH9WF+cY4ofRbswK8JPZChYLv1DNm2N0/LAyWGt1y5MiANKwqPi
         ttljDSea+IEKZFF6xlkQincpZ5PxdXF7A3l06tj+fYd7hkzEl577Gkw8qHBN7RtTpVuC
         qLjA==
X-Gm-Message-State: AFqh2krS3/CyE6iICHscb+BoIGqbpJlWQR/xqApk4qmFV/C/jXGr5dbL
	nMraml+c+jUbUFIXmz0rjfPfSTVzZRrpvu48CUQ=
X-Google-Smtp-Source: AMrXdXsQGkUMZ8iBNXUVVEwGHKbvQdbC1HGvyKlUxXcx0TYs/3XfWyeGKRkis57wQFhk4N4H/Z0O7eRaYAfRd4B+KR8=
X-Received: by 2002:a05:622a:5d83:b0:3b6:2bb2:216c with SMTP id
 fu3-20020a05622a5d8300b003b62bb2216cmr54608qtb.616.1673744149172; Sat, 14 Jan
 2023 16:55:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADsncqR2mTUArTv2HhRnsfmQx5iNgUZo=JVgkUcZT7MtjxEoYw@mail.gmail.com>
 <Y8JSMlMgnggwOYl0@kroah.com> <Y8LByXvibutD79au@eldamar.lan>
In-Reply-To: <Y8LByXvibutD79au@eldamar.lan>
From: Matthew Fahner <mdfahner@gmail.com>
Date: Sat, 14 Jan 2023 19:55:38 -0500
Message-ID: <CADsncqRgM17CEnKpwORz0_1n62-QgH74HZRO2yx5awvB6ULiBw@mail.gmail.com>
Subject: Re: Second Monitor Issue on Kernel 6.1.5
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Salvatore,

Thanks, yes, that does appear to match my issue.

The Debian bug report seems to have identified as commit
4d07b0bc403403438d9cf88450506240c5faf92f

I'll keep an eye on those threads and test again once it's believed to
be updated.

-Matt

On Sat, 14 Jan 2023 at 09:52, Salvatore Bonaccorso <carnil@debian.org> wrote:
>
> Hi,
>
> On Sat, Jan 14, 2023 at 07:56:50AM +0100, Greg KH wrote:
> > On Fri, Jan 13, 2023 at 11:58:47PM -0500, Matthew Fahner wrote:
> > > Hello,
> > >
> > > I'm running Ubuntu 20.10 and experienced a regression when trying
> > > kernel 6.1.5 that was not present in previous kernels such as 6.0.19
> > > or 6.0.9
> > >
> > > I have two monitors attached using DisplayPort MST (daisy chaining the
> > > displays).
> > >
> > > Normally, this works without issue and both monitors are detected and
> > > display properly.
> > >
> > > With kernel 6.1.5, the second monitor (the monitor that's not directly
> > > connected to the computer) was detected but would not display.  I
> > > didn't spend much time troubleshooting the issue and instead reverted
> > > to 6.0.19 where it again worked without issue.  The first monitor
> > > worked without issue.
> > >
> > > Let me know what steps I can take to help identify the root cause.
> >
> > Can you use 'git bisect' to track down the offending commit?
>
> Not the reporter, but I suspect this is
> https://gitlab.freedesktop.org/drm/amd/-/issues/2171 .
>
> Matthew can you verify this matches? There is as well context on this
> issue on this thread:
>
> https://lore.kernel.org/stable/8502e5d8-8444-e256-54f3-0c488b54686a@amd.com/
>
> FWIW, we had a similar bugreport downstream in Debian:
> https://bugs.debian.org/1028451
>
> Regards,
> Salvatore
