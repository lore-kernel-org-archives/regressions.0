Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184328F57
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 19:30:31 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id c133so27936172oif.1
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 11:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m7ZwI/3d5ZRCf0yxI1ai0kL0fT5rS0WsrJU7lWNFk4M=;
        b=N9bLaVOsVdePDS7BXQFXBFCPkjSWH/GqIpDqdL/WcEBvUZ94/z8+RJlmT94rsjkZNz
         uOa9iK4BgofdUwymsP32NTb51Eihk7OTko2NfRUjplTmIWGAgLXngyFnsXLhfxbVRo26
         G+rB8Os7QNOX6N3JB7a5sJGzwVtUjPo1QWBMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7ZwI/3d5ZRCf0yxI1ai0kL0fT5rS0WsrJU7lWNFk4M=;
        b=4deZUoL5fX5NK2gPWzX1FlscuKR0VLVulb6IiOA61buXyDcGs59A2/WV1VHC8vJWCR
         nBwaZeqWnUGPcgOFh5p7/Mez2xZ5ANpzwAtl9di+CAzbG2C7CpHJS58o1HMR09vWKYzJ
         kFCyvEU83ZCkpIdCa/Hm1cY1uHFDRGbimgdSPORhaXdN2kW/PeZ/vGr+NNMEbYc68auf
         1/puubEzrmNuEjTQknQ4uNHo7wXSdnoT1R+ioiu7BlMH0ywUqYCoiw5NFkc/CM4O2QjL
         uSblJE7w6eN3+hXy59d6muH4VtZ50I66gb18xPXEvbvxAp8pdtl+7bPnNAaBCX8s0ZCc
         CEFw==
X-Gm-Message-State: AFqh2ko5mNhWi3JhbqVemsPSA28nl3d74ipBGKDTEaoHScfVjRv5q471
	MUax56FXxu+waeqnFJtWJqtXIwF3H2YbGVCUBEhvbQ==
X-Google-Smtp-Source: AMrXdXu1u697rSaneDA2cqYDMAV81q1Y4RbB367bFHud5eZ6ZBV0aEUZioE62U9BiZvd0os6H9zrblsBcS2/esbvlHQ=
X-Received: by 2002:a05:6808:609:b0:35c:dee:db96 with SMTP id
 y9-20020a056808060900b0035c0deedb96mr3176138oih.235.1672774230210; Tue, 03
 Jan 2023 11:30:30 -0800 (PST)
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
 <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com> <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
In-Reply-To: <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 06:29:54 +1100
Message-ID: <CAC2975Jw63j26DhvDjiLc7dXwaRz=eK0aWNuErQ8dkEn_Gemjg@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jan 2023 at 06:27, Michael Ralston <michael@ralston.id.au> wrote:
>
> On Wed, 4 Jan 2023 at 06:24, Michael Ralston <michael@ralston.id.au> wrote:
> >
> > I did a diff between the sound/usb directory for 6.0.16 and 6.1.2 and
> > reverted that entire directory.
> >
> > It is working with that change, so there must be something else.
> >
>
> Logs below...
>

This line from the logs stands out to me as different. Could this mean anything?

> Jan 04 06:20:27 leatherback kernel: usb 1-4: clock source 41 is not
> valid, cannot use

--
Michael
