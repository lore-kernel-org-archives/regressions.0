Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AE4EA6
	for <regressions@lists.linux.dev>; Mon, 18 Jul 2022 09:41:56 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id j65so9884415vsc.3
        for <regressions@lists.linux.dev>; Mon, 18 Jul 2022 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uw96p5rg9bMjde+tQ6Y+RJreM2+o6oDSBazbHt0Gpe4=;
        b=ZMcgYemoS6vhtGV+wZTepAv0v7yYdmq3PKJVRg8DujBUwUrtzrBTIQtVGghklIuZsp
         pMH+ZEbCBITkHbGhkhnJVzLS/JRkvLlB3L1msVvqVDzqH0IaOlwS7HrlrywJufHp7a/1
         Y46jotEQTTbMuP32ne5lLIti/hegrnYiBGCwT9XX/WeYE/yteviq9WPcw27r1wC+V43l
         k0cNHGA09ys6nFRf+Q+HEeguCh75hz+/+d0OO1JmuJI4xeKUV4wP92OHwULfEI+pWMhI
         Z4OSmv1RwcrOKfyQYWrW1I0zb/bFVGMMxpd7U5luCglHL8fYp3ncTlDbS6pHHk/YYaZL
         R/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uw96p5rg9bMjde+tQ6Y+RJreM2+o6oDSBazbHt0Gpe4=;
        b=Tb0scbpPLbwItXCndh17UOaz2oqA88mJr7BiQ+ARpjDNtWbPUdGEK8PIrzg2vA1HuD
         3jC+d2I/CCZyhOpdeOeB1cZY/bbXWo1LGrueeJllvtH4Uri1Bi/CP6ZD/OvwmP51abV2
         r1vuu3106Obpk7xIpvPOeWXDqVCCHlFYyWT808SRLMCtT7AMgeUEMSP16XUqOkf/5yqP
         Hlm7dUiXpRUM5XzjDqGH5TRBOoi9uxigH81oWuZS2twZQvd5/yvOP7Kj+kkeI+4OEugq
         gqnpKTDv4ZAhXilze752Qa1EyLB3DJAx66MfgqTeA/lhymbKrtuYmStgWNKXlA+F2ycr
         Z02Q==
X-Gm-Message-State: AJIora/KzXQv2k5BHq22YLpZiI3f6qa8VkofMBoUtAg8FW1n6ALUuYwW
	PKPBKf1yIAITszZpu7IJ3AQy+NFxC9h7mhHGW40=
X-Google-Smtp-Source: AGRyM1uwPymo7DRuHzRKWZ13dPYMPZ/am7w4EtUZor/81WS5GgLWhgdwQXs2hG/1EIRU7O70pBwq+X5JnU9nktk2d/M=
X-Received: by 2002:a05:6102:834:b0:357:e3b9:56d5 with SMTP id
 k20-20020a056102083400b00357e3b956d5mr190138vsb.72.1658137315176; Mon, 18 Jul
 2022 02:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YtTM8GYn0/HkSoet@squish.home.loc>
In-Reply-To: <YtTM8GYn0/HkSoet@squish.home.loc>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 18 Jul 2022 11:41:43 +0200
Message-ID: <CAOQ4uxgya2-H9=qNZkRBO1exr=GRqyn=PFfGgAf0Px0VkH4bjQ@mail.gmail.com>
Subject: Re: [REGRESSION] recent changes to copy_file_range behavior breakage
To: Paul Thompson <paul.a.thompson@zohomail.com>
Cc: regressions@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	mat h <isolation.principle@gmail.com>, arvidn <arvid@libtorrent.org>, 
	Luis Henriques <lhenriques@suse.de>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 18, 2022 at 5:01 AM Paul Thompson
<paul.a.thompson@zohomail.com> wrote:
>
>         Something that worked in 5.18.9 no longer does in 5.18.1[01] and 5.19-rc6.
>
>         Using the example code in the man page for copy_file_range:
>
> # ./copy-file-range testfile-on-ext4 /path-to-another-ext4/testfile (or symlink thereto)
>
> Works in 5.18.9, fails with:
>
> # copy_file_range: Invalid cross-device link
>
> And produces garbage file at destination on newer (5.18.10+) kernels.
>
>         This breaks eg. qbittorrent (moving a distro image across ext4
> filesystems, or following such a symlink) So potentially other real world
> applications. I do not know if the reason for the commit overrides this
> breakage, but it caused me a bit of a headache.
>

Hi Paul,

I apologize for the headache this change has caused you.
FWIW, Arvidn has already fixed the problem in libtorrent 2.0.7 release yesterday
following a report by Mat [1].

The story here is that cross-fs copy_file_range() was not allowed pre
kernel v5.3.
When we started allowing it in v5.3, we did not and we could not test
all possible
combinations of src and dst fs, so it took a few years, but regression reports
started to surface [2].

We decided to try and revert the behavior to pre kernel v5.3 to fix those
regressions.

The first attempt was around v5.12 release, but sadly, the patch got ignored
and it wasn't before v5.19-rc5 that we managed to get the patch merged.

In the meanwhile, libtorrent 2.0.0 was released with code that assumes
that cross-fs copy_file_range() failure is a fatal error. This was
fixed is 2.0.7
released yesterday and I hope this fix will be packaged soon for distros.

There is no easy way to find if other userspace tools have made the same
assumptions except for getting regression reports like yours.
It is encouraging to me that I got two regression reports from you and Mat
shortly after the kernel patch was merged, which suggests that if there are
other userspace tools out there making the same assumption, we will hear
about them in the near future.

If we find out that is it too late to revert to pre v5.3 behavior,
then there are
a few other options that were discussed on [2], but none of them are pretty
and there was no consensus on either solution, so I'd rather wait a bit to
see if other workloads rely on cross-fs copy_file_range() from any src fs to
any dst fs, before taking further action.

Thanks,
Amir.

[1] https://github.com/qbittorrent/qBittorrent/issues/17352
[2] https://lore.kernel.org/linux-fsdevel/20210212044405.4120619-1-drinkcat@chromium.org/
