Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C26AD32
	for <regressions@lists.linux.dev>; Wed,  4 Jan 2023 14:22:50 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-14ffd3c5b15so28473958fac.3
        for <regressions@lists.linux.dev>; Wed, 04 Jan 2023 06:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=igjVDIkTRCW04d8b25SU65c+XSQsQWPrG7rtS4TwrAQ=;
        b=MJUY15Rx+EsI1a33RFldZmcoiu/8+EQtU2LSP9vWavJ86Y4MFwGFAGT9tN4jQf/tb0
         9miib/P7j6sQlN1S1d2j+PiwkZCdlzd3/RXY0iNKzxGvUeoDV2vLxW+92JSKNUm4mlk1
         D+cEGMStnmzJsDV1qEOPB8V14zMAx39MO5ovA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igjVDIkTRCW04d8b25SU65c+XSQsQWPrG7rtS4TwrAQ=;
        b=wDg+8SU/ZGvKGNuKV6WnFDQtgFe32Yob81Skug/KQRX0VpBSIoqGxXttQrCdzEiD0Q
         5PE7trwJruPeT22gR+Vd1+YKF4o81numcSLAPd/V1fcGkNUWrt6cZooU3pujbf4OQR8a
         hJUbINAEcGZK/iOKQM7+6PZXhX+KRWG3IcmTJk2iNGr48owxuUlzccJvSXW6g2mfiucM
         qF1QMRsE3uf6nSf7IOVVRlxaL7z8hdmS0AT2frY5OSKObhmD7a6oqjD8Komg5hWIdlCs
         wgbmeN7igAyjWZKKRJdQREWb57WoYVG02VCzkFqorRo/QOXEVauz1gdIXmri4Ra2Eh3u
         uu9Q==
X-Gm-Message-State: AFqh2koHKCIgVwyW5QEQVUQvIVghYEgwKbi9Y3TFTPfQlI5cZ1hKmqp2
	9UjSFpdh7axhfjrDSHDOx4VpU6eHv2QbaEQy7UliSA==
X-Google-Smtp-Source: AMrXdXuV9TKAVHzukACpJCIGDdNXVbrbNUMelQFEEXb5waZ2ZQObiyPTxCJQcvWnbai7cKZAOwmSDDiq5glCGF0HS00=
X-Received: by 2002:a05:6870:8dcf:b0:150:a904:9f9a with SMTP id
 lq15-20020a0568708dcf00b00150a9049f9amr1030509oab.235.1672842169630; Wed, 04
 Jan 2023 06:22:49 -0800 (PST)
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
 <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
 <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
 <CAC2975Jw63j26DhvDjiLc7dXwaRz=eK0aWNuErQ8dkEn_Gemjg@mail.gmail.com> <87ilhmpvdt.wl-tiwai@suse.de>
In-Reply-To: <87ilhmpvdt.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Thu, 5 Jan 2023 01:22:13 +1100
Message-ID: <CAC2975LFWnK6f05j5my4=ebmhS0bVhigz8VH6cbaUtVT+ADxbA@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jan 2023 at 19:16, Takashi Iwai <tiwai@suse.de> wrote:
>
> I believe it's time to check which commit broke things.
> Assume that the bug is USB audio core changes, the following 8 commits
> are relevant:
>

Reverting 1045f5f1ff0751423aeb65648e5e1abd7a7a8672 resulted in this
compiler error:

sound/usb/endpoint.c: In function 'snd_usb_endpoint_stop':
sound/usb/endpoint.c:1672:27: error: 'struct snd_usb_endpoint' has no
member named 'need_prepare'
1672 |                         ep->need_prepare = true;
     |                           ^~

I did git annotate on endpoint.c and found line 1672 was added by commit:
3759ae6600e40

Reverting this commit has allowed me to compile a kernel again.

3759ae6600e40
1045f5f1ff0751423aeb65648e5e1abd7a7a8672
9355b60e401d825590d37f04ea873c58efe9b7bf
a74f8d0aa902ca494676b79226e0b5a1747b81d4
9902b303b5ade208b58f0dd38a09831813582211
9a737e7f8b371e97eb649904276407cee2c9cf30

I reverted these six commits, testing each one independently, then
adding the next on top of the others, and it didn't fix the issue.
Then the next commit wouldn't revert cleanly.

CONFLICT (content): Merge conflict in sound/usb/pcm.c
error: could not revert 2be79d586454... ALSA: usb-audio: Split
endpoint setups for hw_params and prepare (take#2)

++<<<<<<< HEAD
+ again:
+      if (subs->sync_endpoint) {
+              ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
+              if (ret < 0)
+                      goto unlock;
+      }
+
+      ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
++=======
+       ret = configure_endpoints(chip, subs);
++>>>>>>> parent of 2be79d586454 (ALSA: usb-audio: Split endpoint
setups for hw_params and prepare (take#2))
       if (ret < 0)
               goto unlock;
-       else if (ret > 0)
-               snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
-       ret = 0;


Again, I did a git annotate and found I needed to also revert
67fd112b4b040 to get 2be79d58645465351af5320eb14c70a94724c5ef to
revert.

This one also didn't fix the issue.

ac5e2fb425e1121ceef2b9d1b3ffccc195d55707
This final revert on top of all the others fixed the issue.

These are the reverts I made:
3759ae6600e40
1045f5f1ff0751423aeb65648e5e1abd7a7a8672
9355b60e401d825590d37f04ea873c58efe9b7bf
a74f8d0aa902ca494676b79226e0b5a1747b81d4
9902b303b5ade208b58f0dd38a09831813582211
9a737e7f8b371e97eb649904276407cee2c9cf30
67fd112b4b040
2be79d58645465351af5320eb14c70a94724c5ef
ac5e2fb425e1121ceef2b9d1b3ffccc195d55707

--
Michael
