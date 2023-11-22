Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB4C51026
	for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+RjafPP"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-549070a04baso2422791a12.3
        for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 05:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700660742; x=1701265542; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md1yJyViVJIk7bLbArcNZW7/RCjayNMC8N02jDNysO4=;
        b=l+RjafPPKkjLZSa/1UMpdsXcUTPGfk40RrV2kyRpI4cs9Ryjws3EzqJNjQ9hwWZ/Vr
         /FonBODhepUqRlHUfricWS008dwQicCjR5w73/y6DGywTUkXjBYnBtr76MgtbekV0VB+
         SKoT9gERUrXkPFFx3C/3VzJHdhlCe1d0YMx6v1cCe7lxwTVodxplyI6OOjG9RLhCMiU4
         ksAeCG/Vu0gBZQTNdTJvJb3+MSeXziYBSp318c63ijFzMNA29PMVt4HpKOI2Kqvj1SUz
         9jE5fvvCKWzIlZQ5bVP2Ril/dMKT+/s6rn3jr5bsIaTnDgn9kZe+pghO6Hza8H3zphsI
         TLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700660742; x=1701265542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md1yJyViVJIk7bLbArcNZW7/RCjayNMC8N02jDNysO4=;
        b=dRSm8WVGI+O8BAozhy4PMzqaCfuz+ys5XmO+qwR239FjmtsgWlTIK2X/db12I8ikIh
         WVQBo/HnbyGitkwGCELRH0ltDJxIfYLJmN1gwp0U0CWMtnFhAOpDkdJ2P9pC4MrqCKgP
         KXc58Uo5q7JVf0Sfrj4Kdoq4jY7imWhu1JB8355BN8mIr7a8xveC+Y92nP5rxap+FlWg
         nbIQH7ZYEhxV3YlsSHXsGqu+muh/Vtjr5ayP6Vbwh95kQ3uds7nTt/SXAUDBDTaqQnqI
         7+egkoh7qbdUnQY0/FUMh/Z+Rov8o9xPcHhlIXCI9vu/66yIUALoJ3XlevCrS580LrjZ
         ulkQ==
X-Gm-Message-State: AOJu0Yy5NWl6VNWYAz09bBFb0oZTQqatLnsolH6NoOGNfyp4lkOq3xXr
	CvRbyJuoG+hcCybEKIDby1vI9F2EkCATj6JRRpaqADfM
X-Google-Smtp-Source: AGHT+IEDJD80sNR88v2ZEvEEO8EO3ir1FQB2gTnGz7Y36msid1xY1pR45oM0Od6H7q9Cr5vTAN6bxG6Disb78sSlYj4=
X-Received: by 2002:a17:906:4e93:b0:9fc:ae47:5f0d with SMTP id
 v19-20020a1709064e9300b009fcae475f0dmr1464027eju.71.1700660742134; Wed, 22
 Nov 2023 05:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230825141226.13566-1-lukas.bulwahn@gmail.com>
 <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info> <20231112181036.GBZVEVHIIj/Oos1cx4@fat_crate.local>
 <0e9cbe6f-ac6c-47f2-b663-a22568799eca@leemhuis.info>
In-Reply-To: <0e9cbe6f-ac6c-47f2-b663-a22568799eca@leemhuis.info>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 22 Nov 2023 14:45:30 +0100
Message-ID: <CAKXUXMzo4cOW3p-XhODanMy5Lig7zHqnqbYJ5aXNvbeYLwfrrQ@mail.gmail.com>
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to CONFIG_MICROCODE_AMD)
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Borislav Petkov <bp@alien8.de>, dave.hansen@linux.intel.com, hpa@zytor.com, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 10:15=E2=80=AFAM Linux regression tracking (Thorste=
n
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 12.11.23 19:10, Borislav Petkov wrote:
> > On Sun, Nov 12, 2023 at 04:03:32PM +0100, Linux regression tracking (Th=
orsten Leemhuis) wrote:
> >> That's because dracut until the recent commit
> >> https://github.com/dracutdevs/dracut/commit/6c80408c8644a0add1907b0593=
eb83f90d6247b1
> >> looked for CONFIG_MICROCODE_AMD and CONFIG_MICROCODE_INTEL in the conf=
ig
> >> file to decide what to include or not.
> >
> > They've been told a bunch of times already that grepping .config for
> > specific symbols is not how one should check whether one should add
> > microcode blobs to the initrd or not because Kconfig symbols are not an
> > ABI.
>
> Maybe, but you know how Linus sees things like this: what's considered
> an ABI/API or not is nearly[1] irrelevant - if a change breaks something
> that used to work then it needs to be fixed.
>
> [1] unless you fiddle with things obviously internal; not sure if this
> case would qualify for him, but somehow I doubt it -- but I might be
> wrong there.
>

Thorsten, I think you are wrong here in this case. We are talking
about the kernel build configuration options and their names and these
are certainly not stable and never have been.

Some indication to show that the rate of change we are generally
talking about without anyone considering this stable ABI/API:

You can run "find . -name Kconfig* | xargs grep -h -E '^(menu)config '
| sort | uniq" on each kernel release. Then diff those lists of
configs with increasing kernel config versions.

If this would be stable, then only config options should appear and
little should disappear, but that is not the case. And if something
disappears, it should relate to a driver/feature that was removed, but
that is also not always the case.

Here are some quick numbers:

v6.0 to v6.1: 43 removals
v6.1 to v6.2: 40 removals
v6.2 to v6.3: 350 removals
v6.3 to v6.4: 86 removals
v6.4 to v6.5: 73 removals
v6.5 to v6.6: 61 removals

* Removals can also be potentially a renaming.

So, these config names are certainly not stable ABI/API. We can
investigate a bit deeper on which changes are due to driver removals,
which due to config removal but making a feature default and which are
simply a config renaming, but in the past, hardly any kernel developer
has considered this interface to be a special stable ABI/API.

Further, to my knowledge looking at kernel discussions and the
repository, there are currently no tools out there that would assist
in updating a kernel build configuration from one version to the next.

So, we are talking about roughly more than 50 removals to kernel
config options every release, and now there was this one special case
in one release, where a tool incorrectly relies on this one config
option to be stable. That is not a regression of a stable ABI/API,
that is a misuse of an internal non-stable ABI/API.


Lukas
