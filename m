Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AAD8466
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 15:15:33 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-15027746720so21988779fac.13
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 07:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6mpKJos/FPMtqgzKryfkykw/TumKk6Lc1MADv4VNDaw=;
        b=JpRf7WA8CR1VvL1u9d7F0pRpDV7B/2mtiBVwj/uQ0vvHj51xLPBBHZbcmZ4FhLc53e
         7MTRjmhjlpBEDDMygvniKGDlSK7EAeThLiVnzoHmLMiFBvVDG35zBj1ZPNrInrrEJEd4
         aUv8/wdm1CjSSywI58kB+2yx49Vsuc4aIPo2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mpKJos/FPMtqgzKryfkykw/TumKk6Lc1MADv4VNDaw=;
        b=OYa0IrA6Uj1lQlRO+x+D+GVWnXubTBMj1iVhtZ1UI6tmGWJPjoreDkLOLrTQozAHjQ
         B81dVjxN6WYy9DSGxwnsUWBoyjLUIjRlhslQSqVgQaschWzeu9C2qc7zyDlmTMa3L9y7
         QnCBKeBDElFtPceswqks8X8VnUUKyGuDfSMo2DlKJzUo0onYjlbRCiJhs93b6qW4YkfJ
         nsBe6yRGp8NkTUrpo3wvFAyxIrX0DYJhyhr92Xwwko6lAKBmx34PcRq7fQsxoHGFULmH
         wmtU7IE9hzmjjLeE4w/2XeMA9pl33pi5LD3mcdwfhSdInEx6jRyEQ7cAkxpRbdkdd0Av
         iLEw==
X-Gm-Message-State: AFqh2koVJ2MN0FaAzEqIxjVp+WdXUCVOrq4kovyFgKs45UALMa88uehy
	fggWU9xYMGicrE3xIpw3ydeynmm8xsq7BKiHe4CuNnB1uITaGEfjY6U=
X-Google-Smtp-Source: AMrXdXv3dQDnfdNBNw+MQp56Vjvne/Kn7e1ltujbhspbCMkGntbNdh9QTHMnc3OVzHwx4LzFX2C+gndhklK2kW3cefI=
X-Received: by 2002:a05:687c:189:b0:14f:a2ed:988f with SMTP id
 yo9-20020a05687c018900b0014fa2ed988fmr2110159oab.220.1672758933004; Tue, 03
 Jan 2023 07:15:33 -0800 (PST)
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
 <87bknfr6rd.wl-tiwai@suse.de>
In-Reply-To: <87bknfr6rd.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 02:14:57 +1100
Message-ID: <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jan 2023 at 02:13, Takashi Iwai <tiwai@suse.de> wrote:
>
> That's weird.  Is snd_usb_audio driver bound with the device at all?
> That is, does it appear in /proc/asound/cards?
>

Yes, it's there.

0 [V49            ]: USB-Audio - V49
                     Alesis V49 at usb-0000:08:00.1-3, full speed
1 [NVidia         ]: HDA-Intel - HDA NVidia
                     HDA NVidia at 0xfc080000 irq 154
2 [U192k          ]: USB-Audio - UMC404HD 192k
                     BEHRINGER UMC404HD 192k at usb-0000:08:00.1-4, high speed
3 [Generic        ]: HDA-Intel - HD-Audio Generic
                     HD-Audio Generic at 0xfca00000 irq 156

--
Michael
