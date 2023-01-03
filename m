Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5155779C5
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 13:11:23 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id m7-20020a9d73c7000000b00683e2f36c18so14013984otk.0
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 05:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBT8QGBM4TylsNBdJUfJE0UpwiJkpbSc92XFfa/BZbw=;
        b=S5uXlrqZ1UTZOKh9S0VWa+TJrjnr1xX00qWX1oZ2G/Qso/AUeU2XdRV8CuzJBn19RQ
         S8PUpZYTfTpZjW5xlrzgJepE/CwPmjpgb7b0RI+6PMUX7MlYhNbOqun0jKHnfOBil9Si
         9YqCLTcZiCzldnSbMlV8u/x1yZ9kAq3vTh0OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBT8QGBM4TylsNBdJUfJE0UpwiJkpbSc92XFfa/BZbw=;
        b=utMPDV0NpEqZObjAWORiOKmN5KETMTvIJ8s4sihigP54pAgJYidiTn391ZDHYP/6Sk
         YPaacV287N3eBMNBnDTKN9XZZSdJ5rd9Kk8UzY8361Fqdm+AwuO+3mRGla4fWm2MghGs
         HdG9Ty02/hQ6a5qiKwGwpwKbgmIUzqAA9MpZ8+WunEiSHWMLWJzBmGUI45fJVxVbAC/R
         ZFZq6lewxOjbdPl0Gn/0QXxE/dck9RVvnsX0HE7GIHDe/0yD01quj+cjxwr5g9oKKOet
         YJfGeM6kjo8p3+gkL28VN/9P9seV4/+1UgiS3215i5/5wkGxLPbSd/OkjbOcAYZsB5h7
         R4LA==
X-Gm-Message-State: AFqh2kqLtw9fy79xQspYusIAJtY+oqZ6p3UoZaR4blDlxWlOGrukjHKe
	v2wcYO2s3iGOCz3a/i2Q/OjJ84mQciw8v7nOu055CA==
X-Google-Smtp-Source: AMrXdXvMiRhkPudrVcodk+MiSXC0+Q1QXxeRXc6jXFUYRSTGQ3XazpqjMW5uF+w3LzN5kMlewpTk+W0So2OurVCx894=
X-Received: by 2002:a05:6830:1c8:b0:66e:b992:749f with SMTP id
 r8-20020a05683001c800b0066eb992749fmr2372045ota.52.1672751482203; Tue, 03 Jan
 2023 05:11:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info> <87zgb0q7x4.wl-tiwai@suse.de>
In-Reply-To: <87zgb0q7x4.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 00:10:46 +1100
Message-ID: <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Working, 6.0.16-lqx1
https://hastebin.com/omoqasiqek.apache

Not working, 6.1.1-arch1-1.1
https://hastebin.com/itasefinaz.apache

I built the working kernel myself with patched sources. Let me know if
you'd like me to run a test with any particular kernel build or
version.

--
Michael

On Tue, 3 Jan 2023 at 20:33, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 03 Jan 2023 10:07:42 +0100,
> Thorsten Leemhuis wrote:
> >
> > [TLDR: I'm adding this report to the list of tracked Linux kernel
> > regressions; all text you find below is based on a few templates
> > paragraphs you might have encountered already already in similar form.
> > See link in footer if these mails annoy you.]
> >
> > [CCing alsa maintainers]
> >
> > On 02.01.23 18:29, Michael Ralston wrote:
> > > I'm currently experiencing a regression with the audio on my Behringe=
r
> > > U-Phoria UMC404HD.
> > >
> > > Alsa info is at:
> > > http://alsa-project.org/db/?f=3Df453b8cd0248fb5fdfa38e1b770e774102f66=
135
> > >
> > > I get no audio in or out for this device with kernel versions 6.1.1 a=
nd 6.1.2.
> > >
> > > The versions I have tried that work correctly include 5.15.86 LTS,
> > > 5.19.12, and 6.0.13=E2=80=9316.
> > >
> > > When I run this on 6.1.1, it will just hang until I ctrl+c:
> > > aplay -D plughw:1,0 /usr/share/sounds/alsa/Front_Center.wav
> > >
> > > I've run strace on that command, and its output is at:
> > > https://pastebin.com/WaxJpTMe
> > >
> > > Nothing out of the ordinary occurs when aplay is run, according to th=
e
> > > kernel logs.
> > >
> > > Please let me know how I can provide additional debugging information
> > > if necessary.
>
> Please boot with snd_usb_audio.dyndbg=3D+p option, and get the kernel
> logs in both working and non-working cases.
>
> I guess it's a regression due to the hw_params/prepare split, but need
> to check more details.
>
>
> thanks,
>
> Takashi
