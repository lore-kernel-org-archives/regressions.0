Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EF58F57
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 19:24:53 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id r205so27884599oib.9
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 11:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1Pvovz6KD/rGdi5Cr+RhhTptgsnk7UiVcQNAM8+eBU=;
        b=A3iZHMq1qX7BLuv8LOjD2/WgSAjRCflHSb5ljgUjZXfI8UO7kxCSKjMML05dAGROBq
         Brk9fkjqudbKAi0IhPSRvRw8xF/XcmKn2bWbYCmQCa+KKDylcfx7e0By5aHaOZYzMbB/
         Q3T4Oeed30ocfaOtl6ejPaxlyYYpEkjoNQ5Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1Pvovz6KD/rGdi5Cr+RhhTptgsnk7UiVcQNAM8+eBU=;
        b=ydJkwzGpKAcZ/e+jWo39BOdUQetWSxbq8pUIV3UD1mrFpYn0zbctBt0FxcupUGRU1o
         LM8rZMgUER0ejNRld+ChSHaMPyA1s12QSFoKCwrjMpO4G912ymeGGQg1muZH1Ofbg92m
         z0+zW0yW+QDucJnkcdkcpk6DrNY+HTKlM4Q7UTslAg0mwi0UnyAPFAp3A8zMOZNlcHZK
         KmY4ukw3MqmEjjEm2CtN3WYj2LW5cS2dCELYPkwPmJp9Xy1J5WkgIjnAe10LMD0KHq6M
         eQJ9TfL34EUYQutXCRfT+CpxXKHkhMe28ymNBFlvdGgMh9tx90IjyBtHFszWM0mkXM6N
         +UVQ==
X-Gm-Message-State: AFqh2koN4eGNif5AvasVut7z9e57Ij/x7X8pmRy4ciCJ5oF5kukG83Oa
	aZsiUeqeSMAoYK7PXXAOH5vpGu66V/kyHiKKqawgBg==
X-Google-Smtp-Source: AMrXdXsSrUBgeuZr11V5MVDq1ahDjM3YnzlwexugjDHVzjW3s/niOCBfKCmmzgVetZXBqZkQUi4GfRfYldJc0F2Ls1w=
X-Received: by 2002:a05:6808:48d:b0:35c:3327:ecf0 with SMTP id
 z13-20020a056808048d00b0035c3327ecf0mr2314709oid.220.1672773892807; Tue, 03
 Jan 2023 11:24:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info> <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de> <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de> <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
 <878rijr6dz.wl-tiwai@suse.de> <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
 <87zgazppuc.wl-tiwai@suse.de> <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
In-Reply-To: <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 06:24:16 +1100
Message-ID: <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jan 2023 at 06:09, Michael Ralston <michael@ralston.id.au> wrote:
>
> On Wed, 4 Jan 2023 at 03:03, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > OK, thanks.  Then it's not about the USB interface reset.
> > It must be subtle and nasty difference.
> >
> > Could you apply the change below on the top?
> > It essentially reverts the hw_params/prepare split again.
> >
>
> Very sorry to say this still hasn't fixed the problem :(
>

I did a diff between the sound/usb directory for 6.0.16 and 6.1.2 and
reverted that entire directory.

It is working with that change, so there must be something else.

Michael
