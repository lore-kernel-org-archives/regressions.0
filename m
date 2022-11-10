Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649A51A612
	for <regressions@lists.linux.dev>; Thu, 10 Nov 2022 17:48:12 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 187-20020a1c02c4000000b003cf9c3f3b80so4013394wmc.0
        for <regressions@lists.linux.dev>; Thu, 10 Nov 2022 09:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ztUcoZwxxS4L3rEP12M4QSVDQliIB232GyZ8cQU3hfs=;
        b=EM2UPKAzSIQO5A8fjI7qne7aQoEMryYsdrZqIJx67Fv1ynaIj1oTwbXU+bfxRrAbgV
         +Qv9Sx3xBoWKWeIwNI7hE47YvKXPrl2B8Ev8oj9n+8frKKuh+BLI7Unb4SvGR8v60f35
         pFyO/ahsIH0xh1od+9sPoESsGvbgnc9/bh62RH/2fGSFDbVZWxBVHhaD0j2VPwLLCeXD
         mKjESLnFqdK5gWaoISGf+Q0DR0U68cPuwCZV5DJuQjIzAMkD/TRJEMxPFvsU2/BRRPjM
         mX1QgzkV3IDCByhz4mtOkiqu7jkzUl7vEULWg07qO2o/ajRmD2RbdXsuJYHPDLFGB2zc
         uC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztUcoZwxxS4L3rEP12M4QSVDQliIB232GyZ8cQU3hfs=;
        b=YbXRdpF+oKqkv8kBRS7Tde7P+6w3++ixGq0p5L3Q91njOcFzuACYHfKtUaZj0ca55A
         mLsOMaqlwS66jNDBvSf8mMGw5VOeUrxeNNh1Mu/CtuyVXbyZnvHTNl4TdFzwCyn2Ou1Q
         cbta0OdkcUoPz7gYv9mZIem11kISXq5YI3nrW/F3nTdCUpuhy5HaBIFfqtwqQv1MWFG0
         bjGGG5IT461n/2J7e+1ciWYZouVF+0uw+re0PmMTwIvOQF3X+7L0230DsBjHxGJ7afcz
         4lK02FtiP0hy/hNH9O31lXycK1xyU8ndfKP28DuyfkaAsQ08vzwX3P726iFgi3Li3eVM
         aENg==
X-Gm-Message-State: ACrzQf2+Aah7jTajPIdnElZew8wg+0vKx5cC1Pj8Fw3STFieCYKSjDbf
	R0n40hPTye+FYyldBsXix0o=
X-Google-Smtp-Source: AMsMyM5A7UqaErRF+QBbccloM6AZxHcZ4KGKTbR2L2/Pi14M1oPz6/1kZa2iA2slwoPEQaEKTj+NJQ==
X-Received: by 2002:a05:600c:2287:b0:3cf:4dfb:c223 with SMTP id 7-20020a05600c228700b003cf4dfbc223mr51117050wmf.19.1668102490581;
        Thu, 10 Nov 2022 09:48:10 -0800 (PST)
Received: from elementary ([94.73.35.109])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b003a2f2bb72d5sm7616974wmo.45.2022.11.10.09.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 09:48:10 -0800 (PST)
Date: Thu, 10 Nov 2022 18:48:08 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Alexander Zhang <alex@alexyzhang.dev>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Torge Matthies <openglfreak@googlemail.com>,
	Jiri Kosina <jikos@kernel.org>,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	Nikolai Kondrashov <spbnick@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH] HID: Accept Digitizers as input devices
Message-ID: <20221110174808.GA396731@elementary>
References: <20220804151832.30373-1-openglfreak@googlemail.com>
 <20220804180038.GA8906@elementary>
 <CAO-hwJJsKC=fyeFLCmdXMRkxEQFVGZ189GKphTVK83QJWc=udA@mail.gmail.com>
 <2717adbe-e9b2-3c5a-7ccf-3d851a55744c@alexyzhang.dev>
 <1db88d01-1004-0e42-b9aa-3e0bb2b22cdb@leemhuis.info>
 <b1536115-1d4b-67dd-197e-4b6ed8e5cbc6@alexyzhang.dev>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1536115-1d4b-67dd-197e-4b6ed8e5cbc6@alexyzhang.dev>

Hi!

> > On 27.10.22 00:42, Alexander Zhang wrote:
> > > On 8/11/22 8:27 AM, Benjamin Tissoires wrote:
> > > > On Thu, Aug 4, 2022 at 8:00 PM José Expósito
> > > > <jose.exposito89@gmail.com> wrote:
> > > > > On Thu, Aug 04, 2022 at 05:18:32PM +0200, Torge Matthies wrote:
> > > > > > Commit f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
> > > > > > styluses") broke input from my XP-Pen Star G640. This is because the
> > > > > > "Digitizer" usage is not recognized as a valid usage for input devices.
> > > > > > 
> > > > > > This patch changes the IS_INPUT_APPLICATION macro so that the
> > > > > > "Digitizer"
> > > > > > (HID_DG_DIGITIZER) usage is recognized as an input device usage.
> > > > > > 
> > > > > > Fixes: f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
> > > > > > styluses")
> > > > > > Signed-off-by: Torge Matthies <openglfreak@googlemail.com>
> > > > > > ---
> > > > > > This patch could be risky, because any digitizer devices that were
> > > > > > previously not treated as input devices are now used for input.
> > > > > > Alternatively the linked commit could be reverted, but that would
> > > > > > re-introduce the problem detailed in its commit message.
> > > > > > 
> > > > > >    include/linux/hid.h | 2 +-
> > > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > I hesitated about this when I sent the patch you mentioned. In the end,
> > > > > I didn't include any fix because the digitizer use was tested for 2
> > > > > years in DIGImend, so I (wrongly) assumed that it was safe enough.
> > > > > 
> > > > > However, my initial thought was to add in uclogic_probe():
> > > > > 
> > > > >           hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
> > > > > +       hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
> > > > > 
> > > > > Let's see if we can hear more opinions, but if you are worried about
> > > > > affecting other drivers, that could be a good solution.
> > > > 
> > > > Sadly, my automated regression tests are broken for a while and I
> > > > haven't checked if that patch is introducing errors in hid-multitouch.
> > > > 
> > > > FWIW, this part has always been painful because some tablets were not
> > > > using the correct usages. And so that's why we are ending up in that
> > > > weird situation.
> > > > 
> > > > Anyway, just to mention that any code that touches this part should be
> > > > tested against the hid regression tests suite[0], because that's the
> > > > only way to find out if the change is affecting other devices.

Since it seems like this patch is kind of stuck, I sent you a different
patch [1] that aims to fix the same issue but using a more conservative
approach.

Could you test it and confirm that it fixes your problem, please?

Hopefully, we'd manage to get it merged as the risk of doing so would
be smaller.

Jose

[1] https://lore.kernel.org/linux-input/20221110174056.393697-1-jose.exposito89@gmail.com/T/

