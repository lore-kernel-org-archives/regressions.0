Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172B88466
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 15:05:55 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-14fb3809eaeso31034224fac.1
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 07:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ln3Hpxj04whwiUwy38KPHvXsJPvtlkVMO14jhU5Bin8=;
        b=jbszDPxzVNpLIap5ukIi81Ulb4x816IiBtHv+NmuSI5aUvrk96T7sfkGGtc/K08duO
         O6awQPQiJQsqvt8/R0i3rhF9kea9HKjVhk0LjVC1gjrdPL3+WcBsCSOAD2W8i/Rxjnu3
         YXVr13F+O3Fr8Lxtjcka7BtJz1eJuxgYCUOFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ln3Hpxj04whwiUwy38KPHvXsJPvtlkVMO14jhU5Bin8=;
        b=ghR7n80Im/QvV9hL7QmLLUjOlBtP0YNm+svtJOaGZTfq9J96xSTgrLwTJVY1MQYuZl
         70T/AUpNAZawePfCgSBp3fw3wdNOav8iLVOtVylx74SaXg8YTaao8Jujc3yot0Arzeue
         fb8R72RnHN87vuXyMua5tvFZ5DeIKagt2yhe2o0wQguygJTtWEWq5zPfFQuwEbn9qJzR
         np8dJu60Y5U/olBnumvdQQN3ZStgEth8Zfja3GHUkTQ32RVqEuUTtlIN9BVB9ppOnUbB
         FnhB+sAIeQ1ZbW+c0fLY0z28DXqVqLLNwCjtYGbu9xNodLpR5xUQqQ3sZzeXwYfDRRa2
         UqLQ==
X-Gm-Message-State: AFqh2krUrGUMpDcICzc/IwxFYqIMaFhV/XhmbWaVdjD4N/DhV7M30NTi
	4Tvq004HJSh/xiC4zFHjbdUKyKTLvOhsp/ysVrxfNA==
X-Google-Smtp-Source: AMrXdXs7QoifFER29bfCAsB0Fub0McfhgnzUfkpUj9BvtbBuATd0zwtbAYjNm79RajNWkejZ1HwbX8j3KBol1iYbJp4=
X-Received: by 2002:a05:687c:189:b0:14f:a2ed:988f with SMTP id
 yo9-20020a05687c018900b0014fa2ed988fmr2107981oab.220.1672758355026; Tue, 03
 Jan 2023 07:05:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info> <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com> <87sfgrrb5f.wl-tiwai@suse.de>
In-Reply-To: <87sfgrrb5f.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 02:05:18 +1100
Message-ID: <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jan 2023 at 00:38, Takashi Iwai <tiwai@suse.de> wrote:
>
> Thanks; that's helpful.
>
> Could you try to revert the commit
> 9902b303b5ade208b58f0dd38a09831813582211
>     ALSA: usb-audio: Avoid unnecessary interface change at EP close
as a blind shot?
>
> Also, there has been a series of fixes for other issues, and it might
> be worth to try as well:
>   https://lore.kernel.org/r/20230102170759.29610-1-tiwai@suse.de
>

I built 3 kernels: one with the reverted commit, one with the patches
you linked, and one with both. These builds were based on 6.1.2.

None of them worked. Also, even though I continued to boot with
snd_usb_audio.dyndbg=+p, none of the kernel logs showed the debug
messages that the other versions did. I'm baffled why this is.

I did notice that the order that the detected sound devices appeared
in alsa was varying. That's probably not relevant though.

Links to logs:

Revert only
https://hastebin.com/avinasiruj.apache

New patches only
https://hastebin.com/aqepesokam.apache

Both
https://hastebin.com/igilaqujus.apache

--
Michael
