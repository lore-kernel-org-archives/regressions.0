Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA91FCE
	for <regressions@lists.linux.dev>; Sun, 14 May 2023 21:48:57 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-199ba5154b3so4656889fac.1
        for <regressions@lists.linux.dev>; Sun, 14 May 2023 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684100936; x=1686692936;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+YSwxrTT+iU4nSpQgtLDKahRgqIhzOMeGqncPjkpZTg=;
        b=hYdHKKdX2RYa4x9ty/w4iogkjqezTON6VzTtJjNueIu2cz5mwNKmoeGuaqQZ/9VacL
         C3KZSi0dGjItj6Zj0LQCEj3kzz71476E6w/M+RYsJjJM3WkE3X2c0t2uL6hPCXhAOOwd
         8edFaolNO0OQOpu1wyrCmx629wHHVDlN9nJTCvglMXXzM00ewEuJYLzzZTzqHkkIrgQs
         hQTKF0Lr7qYAqJLZHW/SdEuwAPl2rq4lrw0QkxyI8LH30DPP3FVppXRoDBIoL9Pda+7Q
         qT5zabqxAixQKww1EZYkSCgI7bS55yAdq2+jiQ0f2JCHF1AySnEim0GaCYNuqA+81Qx+
         QcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684100936; x=1686692936;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YSwxrTT+iU4nSpQgtLDKahRgqIhzOMeGqncPjkpZTg=;
        b=AsmxtzwOCYIDaTQ3fR3rZV3mL9VegqSmEMYAXkmufaFsn3Gt3LU+YiBT1XS9IhkeHI
         WQIkN2d6KDmD+7+aB4RrHxoINTuk/vHyrxLuRspTWZN56P+UzmLfgL7dZOEPkIRczMVm
         KOB5rFNqDIo8pz1r5mIYSMm/M9IiyJynnM7klE4MV4zuK8gFIVR5IyBN9vfsVA59qvMG
         5uIR6qyGHLCFZMismT1r6ZCzgdZL8SKnTqL3POO6SIYMlf3JqZFNnWEluXmoOm8pM3a6
         Q/fXmTlgm5hu38Wm+qr1E1kM51ym/0pWGTDSCWVm4khugVYoz9px9+PWv0YGmeCOXaiJ
         1KBw==
X-Gm-Message-State: AC+VfDy4GhV4tXxpA+ugvcw2PGDxLMIFC81yk5novvXBym5Z/qzHksV1
	lXwhJ24/3ILVWzRTrDUmca+QeWH+0A8z2WW+abg=
X-Google-Smtp-Source: ACHHUZ5Bl/zfWA5BfJII4hmR/DLH/R8Bf5RQV/baYNil5TbACMlFyKXPD/pDIJVfTB4ubaaqoWUA8jRI81+hmtDwfhA=
X-Received: by 2002:a4a:7644:0:b0:552:3a25:1d26 with SMTP id
 w4-20020a4a7644000000b005523a251d26mr5191973ooe.0.1684100936546; Sun, 14 May
 2023 14:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6358:7201:b0:111:8854:cdcf with HTTP; Sun, 14 May 2023
 14:48:55 -0700 (PDT)
In-Reply-To: <87cz338ix4.wl-tiwai@suse.de>
References: <bug-217440-225600@https.bugzilla.kernel.org/> <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me> <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Sun, 14 May 2023 17:48:55 -0400
Message-ID: <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Takashi Iwai <tiwai@suse.de>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, regressions@lists.linux.dev, kailang@realtek.com, 
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"

On 5/14/23, Takashi Iwai wrote:
> The patch changes two places (the change in alc_shutup_pins() and
> alc256_shutup()), and I guess the latter is the culprit.  Could you
> verify that only reverting the latter fixes the problem?

Yes, only reverting the latter fixes the problem. I just tried a
kernel consisting of 6.3.2 plus the below change, and it works fine:

--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -3638,8 +3638,7 @@ static void alc256_shutup(struct hda_codec *codec)
        /* If disable 3k pulldown control for alc257, the Mic
detection will not work correctly
         * when booting with headset plugged. So skip setting it for
the codec alc257
         */
-       if (codec->core.vendor_id != 0x10ec0236 &&
-           codec->core.vendor_id != 0x10ec0257)
+       if (codec->core.vendor_id != 0x10ec0257)
                alc_update_coef_idx(codec, 0x46, 0, 3 << 12);

        if (!spec->no_shutup_pins)


Regards,

Joseph C. Sible
