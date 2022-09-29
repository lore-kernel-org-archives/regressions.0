Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D2A1398
	for <regressions@lists.linux.dev>; Thu, 29 Sep 2022 13:04:13 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id g23so696184qtu.2
        for <regressions@lists.linux.dev>; Thu, 29 Sep 2022 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=qpdOjHoVeeBXawuhfGss23fD+10+rI0bqQ2kczWUCBE=;
        b=G5+5vtHrOwCkZ1NKDM/wqQUQ1URVwqeIG62iNVHh68BtD5jU9DHjLQGOglsRV7k9QL
         odkEPI5MJ6oy9/j9AW8BD1gdwGcGBS3MYWXx6f/OvhJR/XcdrdImKVshig0EcIBZIpHb
         EOYhIZesKEbUMT7ki+TlhNL/ZXma/Wub52ozU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=qpdOjHoVeeBXawuhfGss23fD+10+rI0bqQ2kczWUCBE=;
        b=hqfFDzDVYAds3YKkZEPJtgSzDxragppvECIOaHJu8OzthMS/6Uwfais6VzKeVNF9Rf
         P0MeUVzeCXRWq3MBFehCQJtOoVkLcNplGPFRD6JxHYOba/Vikjts5zKzwkeZ3I59BRmp
         9NeWSNqxIz7wVZoFh7/ub9sahh4/0fhIZjfmBDKX8fVRc5Pmt2BAAONGGeJgFUi2lE/j
         DqXvQaZYdkoMKf41MMTg1dgbtPmkOun5/PuAs/9Q0m1DtnVntw0bCcwqUH7qvQRzbt0O
         /PfF4PJJHw4x1CnoAQhVhsMqaTBGk7DNWfZ3aOEUUCWphCvuFBlFMZWO4lEFqcwmufSa
         xDtQ==
X-Gm-Message-State: ACrzQf3MSzsKNZyXq1DxWf4A/76/NHCHhmH/IhQGRWtfHHHP6U/adJ5V
	NpPNQlaxzXg6d7+/CanWxaGRVSXoMzY6pA==
X-Google-Smtp-Source: AMsMyM5MXuYjd1O59zouVYEcPOQV28TNv4ifR4ELIB2VcXSipLzGkZAbTBUDRw/04XgZ+YCRklN/dA==
X-Received: by 2002:a05:622a:1492:b0:35c:b7e6:12ef with SMTP id t18-20020a05622a149200b0035cb7e612efmr2215287qtx.94.1664456652720;
        Thu, 29 Sep 2022 06:04:12 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bj7-20020a05620a190700b006bad7a2964fsm5936297qkb.78.2022.09.29.06.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 06:04:12 -0700 (PDT)
Date: Thu, 29 Sep 2022 09:04:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>

On Thu, Sep 29, 2022 at 12:22:35PM +0000, Artem S. Tashkinov wrote:
> AFAIK, the kernel bugzilla is a Linux Foundation project and the
> organization receives funding from its very rich members including
> Google, Meta, Intel, and even Microsoft. The fact that no one is
> seriously working on it looks shameful and sad. We are not talking about
> a minor odd library with a dozen users we are talking about the kernel.

The bugzilla as a software platform is a Mozilla product, not Linux
Foundation. Unfortunately, it's pretty much dead:

1. all development has stopped years ago
2. it doesn't even work with recent MySQL servers
3. it is written in perl5 and can only pretty much run with mod_perl

We're committed to running it as far as we can, but we all must also admit
that the platform is near-death and probably will become an ever-increasing
burden to keep it operating. Heck, one of our IT staff is currently trying to
convert bugzilla.kernel.org to use Postgres just so we can keep operating it
past the end of 2022.

The Linux Foundation IT is in charge of running infrastructure -- we're not a
development shop. All of our software projects are pretty much "skunkworks"
efforts (and yes, this includes b4).

We do have ability to fund development efforts -- LF has been the primary
sponsor behind public-inbox.org over the past 3 years. However, there must be
a clear, strong, and well-articulated mandate from the community. From what I
heard, the vast majority of maintainers simply want a web form that would
allow someone to:

1. clearly state what kernel version they are using
2. clearly describe what they were trying to do
3. explain what they expected vs. what they got
4. attach any files
5. give this bug report a unique identifier

Then a designated person would look through the bug report and either:

a. quick-close it (with the usual "talk to your distro" or "don't use a
   tainted kernel" etc)
b. identify the responsible maintainers and notify them

The hard part is not technical -- the hard part is that "designated person."
Being a bugmaster is a thankless job that leads to burnout, regardless of how
well you are paid. Everyone is constantly irate at you from both ends -- the
users are annoyed because their stuff doesn't work, and the maintainers are
annoyed because you keep yanking them to work on dull problems that require a
ton of back-and-forth with people who aren't capable of applying patches and
booting custom kernels.

Before we try to fix/replace bugzilla, we really need to figure out the entire
process and pinpoint who is going to be the one in charge of bug reports. If
you think that LF should establish a fund for a position like that, then you
should probably approach LF fellows (Greg KH, Shuah Khan), who can then talk
to LF management. The IT team will be happy to support you with the tooling,
but tooling should come second to that -- otherwise we'll just be replacing an
old and rusty dumpster on fire with a new and shiny dumpster on fire.

-K
